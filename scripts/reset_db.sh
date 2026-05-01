#!/usr/bin/env bash
set -e

echo "Resetting database..."

if [ -d "venv" ]; then
  source venv/bin/activate
fi

python manage.py migrate
echo "Database reset complete."