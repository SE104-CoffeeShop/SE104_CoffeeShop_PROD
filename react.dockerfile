# Base image
FROM node:current-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY src/SE104_CoffeeShop_FE/package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy the rest of the application code
COPY src/SE104_CoffeeShop_FE ./

# Copy the .env file
COPY .env ./
# Build the application
RUN npm run build

# Expose port 3000
EXPOSE 3000

# Set the command to run the application
CMD ["npm", "start"]