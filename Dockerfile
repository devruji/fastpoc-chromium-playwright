# Use official Python 3.12 slim base image
FROM python:3.12.3-slim-bullseye

# Set working directory
WORKDIR /app

# Install system dependencies required for Playwright
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        wget \
        gnupg \
        ca-certificates \
        fonts-liberation \
        libnss3 \
        libxss1 \
        libasound2 \
        libatk1.0-0 \
        libatk-bridge2.0-0 \
        libdrm2 \
        libxcomposite1 \
        libxrandr2 \
        libgbm1 \
        libxdamage1 \
        libxfixes3 \
        libjpeg-dev \
        libvpx-dev && \
    rm -rf /var/lib/apt/lists/*

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Install Playwright browsers with dependencies
RUN python -m playwright install --with-deps

# Copy application code
COPY app/ .

# Set default command
CMD ["python", "main.py"]