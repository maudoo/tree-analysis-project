
import csv
import psycopg2

DB_CONFIG = {
    "host": "localhost",
    "dbname": "alphawood_db",
    "user": "postgres",
    "password": "admin",
    "port": 5432
}

CSV_PATH = "trees_clean.csv"

def main():
    conn = psycopg2.connect(**DB_CONFIG)
    cur = conn.cursor()

    with open(CSV_PATH, newline="", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        rows = 0
        for r in reader:
            cur.execute(
                """
                INSERT INTO trees (tree_id, common_name, scientific_name, latitude, longitude)
                VALUES (%s, %s, %s, %s, %s)
                """,
                (
                    r.get("tree_id"),
                    r.get("common_name"),
                    r.get("scientific_name"),
                    float(r["latitude"]) if r.get("latitude") else None,
                    float(r["longitude"]) if r.get("longitude") else None,
                )
            )
            rows += 1

    conn.commit()
    cur.close()
    conn.close()
    print(f"Inserted {rows} rows into trees")

if __name__ == "__main__":
    main()
