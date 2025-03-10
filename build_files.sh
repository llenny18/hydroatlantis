#!/bin/bash

# Install dependencies
python3 -m pip install -r requirements.txt
python -m pip install gunicorn

# Collect static files
python3 manage.py collectstatic --noinput

# Run migrations
python3 manage.py migrate

# Create Vercel-compatible output vercel directory
mkdir -p .vercel/output/static
cp -r staticfiles/ .vercel/output/static/