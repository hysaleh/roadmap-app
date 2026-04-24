# AI Career Next-Step Engine

## Overview

This is a Django-based web application that uses a large language model (Google Gemini API) to generate a single, high-confidence next actionable step for users transitioning between careers. Unlike traditional career roadmap tools that generate multi-step plans, this system is intentionally constrained to output **one executable action** designed to be completed within one week max.

## System Design
### Input
- Current career (string)
- Target career (string)

### Output
Structured AI response containing:
- Next Step (single action item with specific steps to take)
- Description of why it works and what it unlocks

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
