#!/usr/bin/env bash
set -e

echo "Running security and dependency checks..."

if [ -d "venv" ]; then
  source venv/bin/activate
fi

pip list --outdated

pip install pip-audit detect-secrets django-sec-check --quiet

pip-audit || true

detect-secrets scan . || true

python -m sec_check || true

echo "Checks complete."