#!/bin/bash

# Install dependencies
echo "Installing dependencies..."
composer update --ignore-platform-reqs --no-scripts
composer install --ignore-platform-reqs --no-scripts

# Generate key
echo "Generating key..."
php artisan key:generate --ansi

# Run migrations fresh
echo "Running migrations..."
php artisan migrate:fresh
php artisan migrate --seed

# Run the server
echo "Running server..."
php artisan serve --host 0.0.0.0 --port 8000
