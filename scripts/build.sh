#!/usr/bin/env bash
set -e

echo "Building project..."

if [ -d "venv" ]; then
  source venv/bin/activate
fi

pip install -r requirements.txt

python manage.py migrate

python manage.py collectstatic --noinput

echo "Build complete."