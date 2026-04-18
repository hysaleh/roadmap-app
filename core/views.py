from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt


def generate_fake_roadmap(current_career, target_career):
    # Simple simulated "AI" output
    return f"""
Step 1: Understand the fundamentals of {target_career}.
- Research what skills are required.
- Compare with your current experience in {current_career}.

Step 2: Skill Gap Analysis
- Identify missing skills.
- Start with beginner-friendly resources (YouTube, blogs, docs).

Step 3: Build Projects
- Create 2–3 small projects related to {target_career}.
- Showcase transferable skills from {current_career}.

Step 4: Networking
- Join communities in {target_career}.
- Connect with professionals on LinkedIn.

Step 5: Apply for Roles
- Tailor your resume highlighting transition from {current_career}.
- Apply consistently and iterate.

Step 6: Keep Improving
- Learn from rejections.
- Continue building and refining your portfolio.
"""


@csrf_exempt
def index(request):
    roadmap = None

    if request.method == "POST":
        current_career = request.POST.get("current_career")
        target_career = request.POST.get("target_career")

        if current_career and target_career:
            roadmap = generate_fake_roadmap(current_career, target_career)

    return render(request, "index.html", {"roadmap": roadmap})