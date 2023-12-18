# Base image
FROM php:latest

ENV COMPOSER_ALLOW_SUPERUSER=1

# Set the working directory
WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    git \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath opcache

# Copy composer.lock and composer.json
COPY src/SE104_CoffeeShop_BE/composer.lock src/SE104_CoffeeShop_BE/composer.json ./

# Copy the .env file
COPY .env ./

# Install composer dependencies
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


# Copy the rest of the application code
COPY src/SE104_CoffeeShop_BE ./

RUN chmod -R 777 storage bootstrap/cache public

# Expose port 8000
EXPOSE 8000
