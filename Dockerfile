# Use the official Python image
FROM python:3.7-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    default-libmysqlclient-dev \ 
    libmariadb-dev \
    python3-dev \
    build-essential \
    --no-install-recommends && \
    apt-get clean && rm -rf /var/lib/apt/lists/*



#set the working directory
WORKDIR /app

# Copy dependency list and install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the project files
COPY . /app/

# Expose port 8000
EXPOSE 8001

# Command to run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8001"]
