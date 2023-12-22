#!/bin/bash

# Create docker folder, docker/mysql and docker/logs if it doesn't exist
folder_path="docker"

if [ ! -d "$folder_path" ]; then
    mkdir "$folder_path"
    echo "Created $folder_path folder ..."
else
    echo "$folder_path folder already exists ..."
fi

folder_path="docker/mysql"

if [ ! -d "$folder_path" ]; then
    mkdir -p "$folder_path"
    echo "Created $folder_path folder ..."
else
    echo "$folder_path folder already exists ..."
fi

folder_path="docker/logs"

if [ ! -d "$folder_path" ]; then
    mkdir -p "$folder_path"
    echo "Created $folder_path folder ..."
else
    echo "$folder_path folder already exists ..."
fi

# Create src folder if it doesn't exist
folder_path="src"

if [ ! -d "$folder_path" ]; then
    mkdir "$folder_path"
    echo "Created $folder_path folder ..."
else
    echo "$folder_path folder already exists ..."
fi

# Create .env from .env.example if it doesn't exist

file_path=".env"
if [ ! -f "$file_path" ]; then
    cp .env.example .env
    echo "Created $file_path file ..."
else
    echo "$file_path file already exists ..."
fi

# clone source code from github
# SE104_CoffeeShop_FE
echo "Cloning source code FE ..."
git clone https://github.com/SE104-CoffeeShop/SE104_CoffeeShop_FE.git ./src/SE104_CoffeeShop_FE
# SE104_CoffeeShop_BE
echo "Cloning source code BE ..."
git clone https://github.com/SE104-CoffeeShop/SE104_CoffeeShop_BE.git ./src/SE104_CoffeeShop_BE

# Start docker-compose
docker compose up -d
