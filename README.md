# AI Career Next-Step Engine

## Overview

This is a Django-based web application that uses a large language model (Google Gemini API) to generate a single, high-confidence next actionable step for users transitioning between careers.

Unlike traditional career roadmap tools that generate multi-step plans, this system is intentionally constrained to output **one executable action** designed to be completed within 1–5 days and produce a tangible deliverable.

---

## Problem Statement

Most career transition guidance suffers from:

- Overly generic recommendations (e.g., “learn Python”)
- Excessive complexity (long multi-step roadmaps)
- Low execution clarity (no immediate actionable output)

This project addresses that by reducing decision complexity to:

> One next step that maximizes immediate progress.

---

## System Design

### Input
- Current career (string)
- Target career (string)

### Output
Structured AI response containing:
- Next Step (single action item)
- Why this step matters
- What it unlocks
- What to avoid

---

## Architecture
Frontend (Django Template)
↓
HTTP POST Request
↓
Django View (index)
↓
Prompt Construction Layer
↓
Google Gemini API (gemini-2.0-flash)
↓
Response Parsing
↓
Rendered HTML Output
