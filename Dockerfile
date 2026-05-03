# Base image
FROM ubuntu:latest

# Avoid interactive prompts during package install
ENV DEBIAN_FRONTEND=noninteractive

# Install apache2 and git
RUN apt-get update && \
    apt-get install -y apache2 git wget unzip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /var/www/html

# Download the Minimal White template
RUN wget -O template.zip \
    "https://www.tooplate.com/zip-templates/2141_minimal_white.zip"

# Extract the zip into the working directory
RUN unzip template.zip -d . && \
    rm template.zip

# Expose HTTP port
EXPOSE 80

# Run Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]

