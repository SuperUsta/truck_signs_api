#!/usr/bin/env bash
set -Eeuo pipefail

echo "Waiting for postgres to connect ..."

HOST="${DB_HOST:-localhost}"
PORT="${DB_PORT:-5432}"

#checking connection
while ! nc -z "$HOST" "$PORT"; do
  sleep 0.2
done

echo "PostgreSQL is active"

#css, js, images
python manage.py collectstatic --noinput
python manage.py makemigrations
python manage.py migrate

echo "Starting Gunicorn ..."
exec gunicorn truck_signs_designs.wsgi:application --bind 0.0.0.0:8000