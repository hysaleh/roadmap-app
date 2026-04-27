#!/usr/bin/env bash
set -e

echo "Building project..."

# Activate venv if exists
if [ -d "venv" ]; then
  source venv/bin/activate
fi

# Install dependencies
pip install -r requirements.txt

# Apply migrations (DO NOT generate new ones here)
python manage.py migrate

# Collect static files (safe even if not used)
python manage.py collectstatic --noinput

echo "Build complete."