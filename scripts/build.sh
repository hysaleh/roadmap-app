#!/usr/bin/env bash

#script for checking if roadmap-app is ready to be deployed safely.
set -e

echo "Starting build process..."

if [ ! -d "venv" ]; then
  echo "Error: virtual environment not found. Run setup.sh first."
  exit 1
fi

source venv/bin/activate

if [ ! -f "requirements.txt" ]; then
  echo "Error: requirements.txt not found."
  exit 1
fi

echo "Installing dependencies..."

pip install -r requirements.txt

echo "Running Django system checks..."

python manage.py check

echo "Applying database migrations..."

python manage.py migrate --noinput

echo "Collecting static files..."
python manage.py collectstatic --noinput

echo "Build is complete!"