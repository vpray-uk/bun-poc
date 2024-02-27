FROM debian:stable-slim

# Set shell to bash
SHELL ["/bin/bash", "-c"]

# Install necessary packages
RUN apt-get update && \
    apt-get install -y curl unzip && \
    rm -rf /var/lib/apt/lists/*

# Install Bun
RUN curl -fsSL https://bun.sh/install | bash

# Add Bun to PATH
ENV PATH="/root/.bun/bin:${PATH}"

# Copy your application code
COPY . /app

# Set the working directory
WORKDIR /app

# Install dependencies
RUN bun install

# Expose the port your app runs on
EXPOSE 3000

# Define the command to run your app
ENTRYPOINT [ "bun", "run", "src/index.js"]
