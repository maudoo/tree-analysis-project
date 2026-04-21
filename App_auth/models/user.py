from datetime import datetime

class User:
    def __init__(self, user_id, username, email, password_hash, level=1, avatar_stage="Beginner", created_at=None):
        self.user_id = user_id
        self.username = username
        self.email = email
        self.password_hash = password_hash
        self.level = level
        self.avatar_stage = avatar_stage
        self.created_at = created_at if created_at else datetime.utcnow()

    def to_dict(self):
        return {
            "user_id": self.user_id,
            "username": self.username,
            "email": self.email,
            "password_hash": self.password_hash,
            "level": self.level,
            "avatar_stage": self.avatar_stage,
            "created_at": self.created_at.isoformat()
        }