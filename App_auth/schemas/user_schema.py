from datetime import datetime
from pydantic import BaseModel, EmailStr


class UserProfileResponse(BaseModel):
    user_id: int
    username: str
    email: EmailStr
    level: int
    avatar_stage: str
    created_at: datetime