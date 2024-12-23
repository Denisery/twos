#!/bin/bash

# Start Node.js app
node /app/node-app/index.js &

# Activate Python virtual environment and start Python app
source /app/python-app/venv/bin/activate
python3 /app/python-app/app.py &

# Start Nginx
nginx -g "daemon off;"
