# Use the official Node.js image
FROM node:18

# Set the working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port that the Node.js app will listen on
EXPOSE 3000

# Start the Node.js app
CMD ["npm", "start"]
