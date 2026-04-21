from datetime import datetime

class PhotoActivity:
    def __init__(
        self,
        photo_id,
        user_id,
        image_path,
        latitude,
        longitude,
        mission_id,
        validation_result=False,
        gallery_visibility=True,
        timestamp=None
    ):
        self.photo_id = photo_id
        self.user_id = user_id
        self.image_path = image_path
        self.timestamp = timestamp if timestamp else datetime.utcnow()
        self.latitude = latitude
        self.longitude = longitude
        self.mission_id = mission_id
        self.validation_result = validation_result
        self.gallery_visibility = gallery_visibility

    def to_dict(self):
        return {
            "photo_id": self.photo_id,
            "user_id": self.user_id,
            "image_path": self.image_path,
            "timestamp": self.timestamp.isoformat(),
            "latitude": self.latitude,
            "longitude": self.longitude,
            "mission_id": self.mission_id,
            "validation_result": self.validation_result,
            "gallery_visibility": self.gallery_visibility
        }