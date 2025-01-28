# Use an official Python runtime as the base image
FROM python:latest AS builder

# Set the working directory in the container
WORKDIR /app

# Copy the application files to the container
COPY requirements.txt /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

FROM python:slim

# Set working directory
WORKDIR /app

# Copy the application files from the host
COPY main.py /app

# Copy installed dependencies from the builder stage
COPY --from=builder /usr/local/lib/python3.*/site-packages /usr/local/lib/python3.*/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin

# Expose the application's port
EXPOSE 5000

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Run the application
CMD ["python", "app.py"]