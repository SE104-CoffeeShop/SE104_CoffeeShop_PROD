# Base image
FROM node:current-bookworm

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY src/SE104_CoffeeShop_FE/package*.json ./

# Install dependencies
RUN npm install -g react-scripts
RUN npm install

# Copy the rest of the application code
COPY src/SE104_CoffeeShop_FE ./

# Build the application
RUN npm run build
# Expose port 3000
EXPOSE 3000


