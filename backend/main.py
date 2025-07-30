from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from database.database import Base, engine
from routers import mood_router
from ai.chatbot import get_ai_response  # 👈 Import


# Create FastAPI app
app = FastAPI()

# Enable CORS for Flutter
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Create DB tables
Base.metadata.create_all(bind=engine)

# Register router
app.include_router(mood_router.router)

@app.post("/chat")
def chat_endpoint(data: dict):
    message = data.get("message")
    if not message:
        return {"error": "No message provided"}
    
    reply = get_ai_response(message)
    return {"reply": reply}
