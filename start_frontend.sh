#!/bin/bash

# remove node_modules && package-lock.json
echo "Removing node_modules..."
rm -rf node_modules
rm -rf package-lock.json

# Install dependencies
echo "Installing dependencies..."
yarn install

# Run the build
echo "Running build..."
yarn build

# Run the server
echo "Running server..."
yarn start --host 0.0.0.0 --port 3000
