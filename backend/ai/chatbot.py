from gpt4all import GPT4All

# Correct model name
model = GPT4All("mistral-7b-openorca.Q4_0.gguf")

def get_ai_response(user_message):
    with model.chat_session():
        response = model.generate(user_message, max_tokens=200)
        return response
