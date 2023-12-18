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
RUN composer install --ignore-platform-reqs --no-scripts

# Copy the rest of the application code
COPY src/SE104_CoffeeShop_BE ./

RUN chmod -R 777 storage bootstrap/cache public
RUN php artisan cache:clear
# Generate the application key
RUN php artisan key:generate --ansi

# Run database migrations
# RUN php artisan migrate:fresh
# RUN php artisan migrate
# RUN php artisan db:seed

# Expose port 8000
EXPOSE 8000

# Set the command to run the application
CMD ["php", "artisan", "serve", "--host", "0.0.0.0", "--port", "8000"]