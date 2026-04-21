from fastapi import FastAPI, HTTPException, File, UploadFile, Form
from fastapi.staticfiles import StaticFiles
from pydantic import BaseModel
from pathlib import Path
import psycopg2
from psycopg2 import errors
import math
import uuid

app = FastAPI()

from App_auth.routes.auth import router as auth_router
app.include_router(auth_router)

DB_CONFIG = {
    "host": "localhost",
    "dbname": "alphawood_db",
    "user": "postgres",
    "password": "Yash@1902",
    "port": 5432,
}

# -----------------------
# Uploads setup
# -----------------------
UPLOAD_DIR = Path("uploads")
UPLOAD_DIR.mkdir(exist_ok=True)

# View images at: http://127.0.0.1:8000/uploads/<filename>
app.mount("/uploads", StaticFiles(directory=str(UPLOAD_DIR)), name="uploads")


# -----------------------
# Helpers
# -----------------------
def get_conn():
    return psycopg2.connect(**DB_CONFIG)


# distance in meters (Haversine)
def haversine_m(lat1, lon1, lat2, lon2):
    R = 6371000  # meters
    phi1 = math.radians(lat1)
    phi2 = math.radians(lat2)
    dphi = math.radians(lat2 - lat1)
    dlambda = math.radians(lon2 - lon1)

    a = (
        math.sin(dphi / 2) ** 2
        + math.cos(phi1) * math.cos(phi2) * math.sin(dlambda / 2) ** 2
    )
    c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a))
    return R * c


def get_tree_coords(cur, tree_id: str):
    cur.execute("SELECT latitude, longitude FROM trees WHERE tree_id = %s;", (tree_id,))
    row = cur.fetchone()
    if not row:
        return None
    return float(row[0]), float(row[1])


# -----------------------
# Base routes
# -----------------------
@app.get("/")
def home():
    return {"message": "Alphawood API is running"}


@app.get("/trees/count")
def tree_count():
    conn = get_conn()
    cur = conn.cursor()
    try:
        cur.execute("SELECT COUNT(*) FROM trees;")
        count = cur.fetchone()[0]
        return {"trees_count": count}
    finally:
        cur.close()
        conn.close()


@app.get("/trees/random")
def random_tree():
    conn = get_conn()
    cur = conn.cursor()
    try:
        cur.execute("""
            SELECT id, tree_id, common_name, scientific_name, latitude, longitude
            FROM trees
            ORDER BY RANDOM()
            LIMIT 1;
        """)
        row = cur.fetchone()
        if row is None:
            raise HTTPException(status_code=404, detail="No trees found. Load data into trees table.")

        return {
            "id": row[0],
            "tree_id": row[1],
            "common_name": row[2],
            "scientific_name": row[3],
            "latitude": row[4],
            "longitude": row[5],
        }
    finally:
        cur.close()
        conn.close()


@app.get("/missions")
def get_missions():
    conn = get_conn()
    cur = conn.cursor()
    try:
        cur.execute("""
            SELECT mission_id, title, points, tree_id, hint
            FROM missions
            WHERE is_active = TRUE
            ORDER BY mission_id;
        """)
        rows = cur.fetchall()

        return [
            {
                "mission_id": r[0],
                "title": r[1],
                "points": r[2],
                "tree_id": r[3],
                "hint": r[4],
            }
            for r in rows
        ]
    finally:
        cur.close()
        conn.close()


# -----------------------
# Mission completion (GPS validation)
# -----------------------
class MissionComplete(BaseModel):
    player_id: int
    mission_id: int
    tree_id: str
    user_lat: float
    user_lon: float


@app.post("/missions/complete")
def complete_mission(data: MissionComplete):
    MAX_DISTANCE_M = 40  # allow within 40 meters

    conn = None
    cur = None
    try:
        conn = get_conn()
        cur = conn.cursor()

        # 1) mission must exist and be active
        cur.execute("""
            SELECT points, tree_id
            FROM missions
            WHERE mission_id = %s AND is_active = TRUE;
        """, (data.mission_id,))
        m = cur.fetchone()
        if not m:
            raise HTTPException(status_code=404, detail="Mission not found or inactive")

        mission_points = int(m[0])
        mission_tree_id = m[1]  # can be NULL

        # 2) If mission has a tree_id, validate distance
        if mission_tree_id is not None:
            if str(data.tree_id) != str(mission_tree_id):
                raise HTTPException(status_code=400, detail="Wrong tree for this mission")

            coords = get_tree_coords(cur, str(mission_tree_id))
            if not coords:
                raise HTTPException(status_code=404, detail="Tree not found in database")

            tree_lat, tree_lon = coords
            dist = haversine_m(data.user_lat, data.user_lon, tree_lat, tree_lon)

            if dist > MAX_DISTANCE_M:
                raise HTTPException(
                    status_code=400,
                    detail=f"Too far from tree. Distance={dist:.1f}m (need <= {MAX_DISTANCE_M}m)"
                )

        # 3) Insert completion (unique constraint prevents duplicates)
        cur.execute("""
            INSERT INTO mission_log (player_id, mission_id, tree_id, points_earned)
            VALUES (%s, %s, %s, %s);
        """, (data.player_id, data.mission_id, data.tree_id, mission_points))

        # 4) Update player total_points
        cur.execute("""
            UPDATE players
            SET total_points = total_points + %s
            WHERE player_id = %s;
        """, (mission_points, data.player_id))

        conn.commit()
        return {"status": "success", "message": "Mission completed", "points_awarded": mission_points}

    except errors.UniqueViolation:
        if conn:
            conn.rollback()
        raise HTTPException(status_code=400, detail="Mission already completed by this player")

    finally:
        if cur:
            cur.close()
        if conn:
            conn.close()


# -----------------------
# PHOTO UPLOAD + GPS verification
# -----------------------
@app.post("/trees/{tree_id}/photos")
def upload_tree_photo(
    tree_id: str,
    player_id: int = Form(...),
    user_lat: float = Form(...),
    user_lon: float = Form(...),
    file: UploadFile = File(...)
):
    MAX_DISTANCE_M = 40

    ext = Path(file.filename).suffix.lower()
    allowed = {".jpg", ".jpeg", ".png", ".heic", ".webp"}
    if ext not in allowed:
        raise HTTPException(status_code=400, detail="Only jpg, jpeg, png, heic, webp allowed")

    conn = None
    cur = None
    try:
        conn = get_conn()
        cur = conn.cursor()

        coords = get_tree_coords(cur, tree_id)
        if not coords:
            raise HTTPException(status_code=404, detail="Tree not found in database")

        tree_lat, tree_lon = coords
        dist = haversine_m(user_lat, user_lon, tree_lat, tree_lon)

        if dist > MAX_DISTANCE_M:
            raise HTTPException(
                status_code=400,
                detail=f"Too far from tree. Distance={dist:.1f}m (need <= {MAX_DISTANCE_M}m)"
            )

        filename = f"{tree_id}_{uuid.uuid4().hex}{ext}"
        save_path = UPLOAD_DIR / filename

        with save_path.open("wb") as out:
            out.write(file.file.read())

        cur.execute("""
            INSERT INTO tree_photos (player_id, tree_id, file_path, photo_lat, photo_lon, distance_meters, is_verified)
            VALUES (%s, %s, %s, %s, %s, %s, TRUE)
            RETURNING photo_id;
        """, (player_id, tree_id, str(save_path), user_lat, user_lon, float(dist)))

        photo_id = cur.fetchone()[0]
        conn.commit()

        return {
            "status": "success",
            "photo_id": photo_id,
            "tree_id": tree_id,
            "distance_meters": round(dist, 2),
            "photo_url": f"/uploads/{filename}"
        }

    finally:
        if cur:
            cur.close()
        if conn:
            conn.close()


@app.get("/trees/{tree_id}/photos")
def list_tree_photos(tree_id: str):
    conn = get_conn()
    cur = conn.cursor()
    try:
        cur.execute("""
            SELECT photo_id, player_id, file_path, photo_lat, photo_lon, distance_meters, is_verified, uploaded_at
            FROM tree_photos
            WHERE tree_id = %s
            ORDER BY uploaded_at DESC;
        """, (tree_id,))
        rows = cur.fetchall()

        result = []
        for r in rows:
            filename = Path(r[2]).name
            result.append({
                "photo_id": r[0],
                "player_id": r[1],
                "photo_url": f"/uploads/{filename}",
                "photo_lat": r[3],
                "photo_lon": r[4],
                "distance_meters": r[5],
                "is_verified": r[6],
                "uploaded_at": r[7].isoformat() if r[7] else None
            })
        return result
    finally:
        cur.close()
        conn.close()