#!/bin/bash

# Start Node.js app
node /app/node-app/server.js &

# Start Python app
python3 /app/python-app/app.py &

# Start Nginx
nginx -g "daemon off;"
