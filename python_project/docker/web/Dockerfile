# Use the official Python image as a base image
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Copy the dependencies file to the working directory
COPY ./app/requirements.txt .
COPY ./app/app.py .

# Install dependencies
RUN pip install -r requirements.txt

# Copy the content of the local src directory to the working directory
RUN chmod +x /app/app.py


# Command to run the Flask application
CMD ["python", "app.py"]

