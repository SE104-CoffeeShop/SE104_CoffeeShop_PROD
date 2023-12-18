#!/bin/bash

# Install dependencies
echo "Installing dependencies..."
npm i
npm i -D

# Run the build
echo "Running build..."
npm run build

# Run the server
echo "Running server..."
npm start --host 0.0.0.0 --port 3000
