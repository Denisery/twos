# Base image for Nginx
FROM nginx:latest

# Install dependencies for Node.js and Python
RUN apt-get update && apt-get install -y \
    nodejs \
    npm \
    python3 \
    python3-pip \
    python3-venv

# Copy Node.js app
COPY ./node-app /app/node-app

# Install Node.js dependencies
RUN cd /app/node-app && npm install

# Copy Python app
COPY ./python-app /app/python-app

# Set up Python virtual environment
RUN python3 -m venv /app/python-app/venv \
    && /app/python-app/venv/bin/pip install --upgrade pip \
    && /app/python-app/venv/bin/pip install -r /app/python-app/requirements.txt

# Copy Nginx configuration
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./nginx/nginx.html /etc/nginx/html/nginx.html

# Add script to start all processes
COPY ./start.sh /start.sh
RUN chmod +x /start.sh

# Expose required ports
EXPOSE 80 3000 8080

# Start script to run all services
CMD ["/start.sh"]
