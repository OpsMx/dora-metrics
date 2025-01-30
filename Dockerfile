FROM python:latest

# Set the working directory in the container
WORKDIR /app

# Copy the application files
COPY requirements.txt .
COPY main.py .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the application's port
EXPOSE 5000

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Run the application
CMD ["sh", "-c", "python", "main.py"]
