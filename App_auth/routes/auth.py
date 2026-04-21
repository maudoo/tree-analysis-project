import json
import os
from datetime import datetime

from fastapi import APIRouter, HTTPException
from App_auth.schemas.auth_schema import SignupRequest, LoginRequest
from App_auth.services.auth_services import hash_password, verify_password

router = APIRouter()

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FAKE_USERS_FILE = os.path.join(BASE_DIR, "test_data", "fake_users.json")


def load_users():
    if not os.path.exists(FAKE_USERS_FILE):
        return []
    with open(FAKE_USERS_FILE, "r") as file:
        return json.load(file)


def save_users(users):
    with open(FAKE_USERS_FILE, "w") as file:
        json.dump(users, file, indent=2)


@router.post("/signup")
def signup(user: SignupRequest):
    users = load_users()

    for existing_user in users:
        if existing_user["email"] == user.email:
            raise HTTPException(status_code=400, detail="Email already registered")

    new_user = {
        "user_id": len(users) + 1,
        "username": user.username,
        "email": user.email,
        "password_hash": hash_password(user.password),
        "level": 1,
        "avatar_stage": "Beginner",
        "created_at": datetime.utcnow().isoformat()
    }

    users.append(new_user)
    save_users(users)

    return {"message": "User signed up successfully", "user": new_user}


@router.post("/login")
def login(user: LoginRequest):
    users = load_users()

    for existing_user in users:
        if existing_user["email"] == user.email:
            if verify_password(user.password, existing_user["password_hash"]):
                return {
                    "message": "Login successful",
                    "user_id": existing_user["user_id"],
                    "username": existing_user["username"],
                    "email": existing_user["email"]
                }
            raise HTTPException(status_code=401, detail="Invalid password")

    raise HTTPException(status_code=404, detail="User not found")