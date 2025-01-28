# Use the official Python base image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the application code into the container
COPY . /app

# Install dependencies (if there's a requirements.txt file)
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Set the command and arguments
CMD ["python", "/app/main.py"]
