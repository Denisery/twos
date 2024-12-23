# Base image for Nginx
FROM nginx:latest

# Install Node.js and Python
RUN apt-get update && apt-get install -y \
    nodejs \
    npm \
    python3 \
    python3-pip

# Copy Node.js app
COPY ./node-app /app/node-app

# Copy Python app
COPY ./python-app /app/python-app

# Install Node.js dependencies
RUN cd /app/node-app && npm install

# Install Python dependencies
COPY ./python-app/requirements.txt /app/python-app/requirements.txt
RUN pip3 install -r /app/python-app/requirements.txt

# Copy Nginx configuration
COPY ./nginx.conf /etc/nginx/nginx.conf

# Add script to start all processes
COPY ./start.sh /start.sh
RUN chmod +x /start.sh

# Expose required ports
EXPOSE 80 3000 8080

# Start script to run all services
CMD ["/start.sh"]
