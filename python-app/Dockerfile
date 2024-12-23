# Use the official Python image
FROM python:3.9

# Set the working directory
WORKDIR /app

# Copy requirements.txt and install dependencies
COPY requirements.txt ./
RUN pip install -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose the port that the Python app will listen on
EXPOSE 8080

# Start the Python app
CMD ["python", "app.py"]
