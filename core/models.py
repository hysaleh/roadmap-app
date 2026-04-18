from django.db import models

# Create your models here.
from django.db import models


class RoadmapRequest(models.Model):
    goal = models.TextField()
    level = models.CharField(max_length=100)
    time_commitment = models.CharField(max_length=100)

    # Stripe reference
    stripe_session_id = models.CharField(max_length=255, null=True, blank=True)

    # Output
    roadmap = models.TextField(null=True, blank=True)

    # Status tracking
    is_paid = models.BooleanField(default=False)

    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.goal} ({'Paid' if self.is_paid else 'Unpaid'})"