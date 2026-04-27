#!/usr/bin/env bash
set -e

echo "Setting up project..."

if [ ! -d "venv" ]; then
  echo "Creating virtual environment..."
  python3 -m venv venv
fi

source venv/bin/activate

# Upgrade pip
pip install --upgrade pip

pip install -r requirements.txt

if [ ! -f ".env" ]; then
  echo "Creating .env template..."
  echo "SECRET_KEY=your_secret_key_here" > .env
fi

python manage.py migrate

echo "Setup complete."