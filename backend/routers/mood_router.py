from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from database.database import SessionLocal
from models.mood_model import MoodEntry
from pydantic import BaseModel

router = APIRouter()

class MoodRequest(BaseModel):
    mood: int

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.post("/mood")
def add_mood(mood_req: MoodRequest, db: Session = Depends(get_db)):
    mood = MoodEntry(mood=mood_req.mood)
    db.add(mood)
    db.commit()
    db.refresh(mood)
    return {"message": "Mood saved", "id": mood.id}
