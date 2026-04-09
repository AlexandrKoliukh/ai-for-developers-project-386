#!/bin/sh
set -e

# Start FastAPI backend in background
uvicorn app.main:app --host 127.0.0.1 --port 8000 &

# Start nginx in foreground (PID 1 — receives SIGTERM from Render)
nginx -g 'daemon off;'
