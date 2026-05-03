FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y apache2 wget unzip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

# Remove default Apache page
RUN rm -rf /var/www/html/*

# Download and extract template properly
RUN wget -O template.zip \
    "https://www.tooplate.com/zip-templates/2141_minimal_white.zip" && \
    unzip template.zip -d temp && \
    cp -r temp/*/* /var/www/html/ && \
    rm -rf temp template.zip

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]
