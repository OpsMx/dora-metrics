# Use an official Python runtime as the base image
FROM python:latest 

# Set the working directory in the container
WORKDIR /app

# Copy the application files to the container
COPY requirements.txt /app

# Copy the application files from the host
COPY main.py /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt


# Expose the application's port
EXPOSE 5000

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Run the application
CMD ["python", "app.py"]
