from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.conf import settings
from google import genai
import traceback

# -----------------------------
# Simple rate limiter (in-memory, resets on deploy/restart)
# -----------------------------
API_CALL_COUNT = 0
API_CALL_LIMIT = 5


# -----------------------------
# Client factory (safe for server environments)
# -----------------------------
def get_client():
    api_key = getattr(settings, "GEMINI_API_KEY", None)
    if not api_key:
        raise ValueError("GEMINI_API_KEY is not set in environment or settings")

    return genai.Client(api_key=api_key)


# -----------------------------
# Core AI function
# -----------------------------
def generate_next_step(current_career, target_career):
    global API_CALL_COUNT

    if API_CALL_COUNT >= API_CALL_LIMIT:
        return "API limit reached. Try again later."

    API_CALL_COUNT += 1

    prompt = f"""
You are a strict career decision engine.

Current career: {current_career}
Target career: {target_career}

Return ONLY ONE next step.

Rules:
- 1–5 day execution window
- must produce a tangible deliverable
- no vague advice

Format:

Next Step:
Why:
Unlocks:
Avoid:
"""

    client = get_client()

    response = client.models.generate_content(
        model="gemini-2.0-flash",
        contents=prompt
    )

    return response.text

@csrf_exempt
def index(request):
    next_step = None

    if request.method == "POST":
        current_career = request.POST.get("current_career")
        target_career = request.POST.get("target_career")

        if current_career and target_career:

            try:
                next_step = generate_next_step(current_career, target_career)
            except Exception as e:
                print("AI ERROR TYPE:", type(e).__name__)
                print("AI ERROR MESSAGE:", str(e))
                traceback.print_exc()
                next_step = f"AI ERROR: {type(e).__name__}: {str(e)}"

    return render(request, "index.html", {"next_step": next_step})