# Base image for Node.js
FROM node:18 as node-build

# Set working directory for Node.js app
WORKDIR /node-app
COPY ./node-app ./
RUN npm install

# Build Python app base
FROM python:3.10 as python-build

# Set working directory for Python app
WORKDIR /python-app
COPY ./python-app ./
RUN pip install -r requirements.txt

# Final image with Nginx
FROM nginx:latest

# Copy Node.js app
COPY --from=node-build /node-app /app/node-app

# Copy Python app
COPY --from=python-build /python-app /app/python-app

# Copy Nginx configuration
COPY ./nginx.conf /etc/nginx/nginx.conf

# Add script to start all processes
COPY ./start.sh /start.sh
RUN chmod +x /start.sh

# Expose required ports
EXPOSE 80
EXPOSE 3000
EXPOSE 8080

# Start script to run all services
CMD ["/start.sh"]
