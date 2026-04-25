#!/bin/bash


echo "Checking for vulnerabilities... "
pip list --outdated
pip-audit

echo "Checking for sensitive info in repo... "

pip install detect-secrets --quiet
detect-secrets scan .

echo "Check for security misconfigurations..."
pip install django-sec-check --quiet
python -m sec_check

echo "Checking if files were accidentally staged..."
