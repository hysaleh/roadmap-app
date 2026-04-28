#!/usr/bin/env bash
set -e

echo "Running validation and security checks..."

if [ ! -d "venv" ]; then
  echo "Virtual environment not found. Did you forget to run setup.sh?"
  exit 1
fi

# Activate environment
source venv/bin/activate

echo "Checking outdated dependencies..."
pip list --outdated || true

echo "Checking for known dependency vulnerabilities..."
pip-audit || true

echo "Scanning for accidentally committed secrets..."
detect-secrets scan . || true

echo "Running Django system checks..."
python manage.py check

echo "Checking Django security configuration..."
python -m sec_check || true

echo "Validation complete."