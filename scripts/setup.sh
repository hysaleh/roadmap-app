#!/usr/bin/env bash

set -e  

#creating venv if it doesn't exist
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
else
    echo "Virtual environment already exists"
fi

#activate venv
echo "Activating virtual environment..."
source venv/bin/activate

#upgrade pip
echo "Upgrading pip..."
pip install --upgrade pip

#install dependencies
if [ -f "requirements.txt" ]; then
    echo "Installing dependencies..."
    pip install -r requirements.txt
else
    echo "requirements.txt not found. Skipping dependency install."
fi

#env file check
if [ ! -f ".env" ]; then
    echo ".env file not found. Creating template..."
    cat <<EOL > .env
GEMINI_API_KEY=your_api_key_here
EOL
    echo "Please update .env with your real API key."
else
    echo ".env file already exists"
fi

#migrations
echo "Running migrations..."
python manage.py migrate

echo " Setup complete."
echo " Run server with: python manage.py runserver"
