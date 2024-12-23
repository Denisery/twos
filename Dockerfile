# Stage 1: Build Node.js app
FROM node:16 AS node-build
WORKDIR /node-app
COPY ./node-app .
RUN npm install && npm run build

# Stage 2: Prepare Python app
FROM python:3.9 AS python-build
WORKDIR /python-app
COPY ./python-app .
RUN pip install -r requirements.txt

# Stage 3: Set up NGINX
FROM nginx:latest
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY --from=node-build /node-app /usr/share/nginx/html/node-app
COPY --from=python-build /python-app /usr/share/nginx/html/python-app

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
