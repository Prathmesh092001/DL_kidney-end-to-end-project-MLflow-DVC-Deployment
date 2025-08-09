# Stage 1: Base image with dependencies
FROM python:3.8-slim-bullseye AS base

# Install AWS CLI and dependencies
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends awscli && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy only requirements first (for better caching)
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Stage 2: Final runtime image
FROM python:3.8-slim-bullseye

# Install AWS CLI for runtime
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends awscli && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy installed packages from base
COPY --from=base /usr/local /usr/local

# Copy source code
COPY . .

# Default command
CMD ["python", "app.py"]



