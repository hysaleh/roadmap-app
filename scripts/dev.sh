#!/usr/bin/env bash
set -e

echo "Starting development server..."

#ensuring virtual env exists
if [ ! -d "venv" ]; then
  echo "Error: virtual environment not found. Run setup.sh first."
  exit 1
fi

source venv/bin/activate

python manage.py migrate

python manage.py runserver