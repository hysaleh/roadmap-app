#!/bin/bash

set -e

echo "Setting things up.. "

source venv/bin/activate

python manage.py migrate

