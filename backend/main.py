# Add these at the top
from database.database import Base, engine
from routers import mood_router

# Create DB
Base.metadata.create_all(bind=engine)

# Add router
app.include_router(mood_router.router)
