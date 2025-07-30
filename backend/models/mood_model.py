from sqlalchemy import Column, Integer, DateTime
from database.database import Base
from datetime import datetime

class MoodEntry(Base):
    __tablename__ = "mood_entries"

    id = Column(Integer, primary_key=True, index=True)
    mood = Column(Integer)
    timestamp = Column(DateTime, default=datetime.utcnow)
