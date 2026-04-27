#!/usr/bin/env bash
set -e

echo "Starting development server..."

if [ ! -d "venv" ]; then
  echo "Virtual environment not found. Run setup.sh first."
  exit 1
fi

source venv/bin/activate

pip install -r requirements.txt

python manage.py migrate

# Stat server
python manage.py runserver