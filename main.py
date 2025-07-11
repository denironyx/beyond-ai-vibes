from dotenv import load_dotenv
import os

load_dotenv()

open_router_key = os.getenv("OPEN_ROUTER_KEY")
openai_api_key = os.getenv("OPENAI_API_KEY")

print("OPEN_ROUTER_KEY:", open_router_key)
print("OPENAI_API_KEY:", openai_api_key)
# --- IGNORE ---