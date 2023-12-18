# Base image
FROM node:current-alpine as build-stage

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY src/SE104_CoffeeShop_FE/package*.json ./
# Copy the rest of the application code
COPY src/SE104_CoffeeShop_FE ./
# Install dependencies
RUN npm install -g react-scripts
RUN npm install

# Copy the .env file
COPY .env ./
# Build the application
RUN npm run build

# Expose port 3000
EXPOSE 3000


FROM nginx:latest
COPY ./.nginx/default.conf /etc/nginx/conf.d/default.conf
# COPY from WORKDIR /app/build to /usr/share/nginx/html
COPY --from=build-stage /app/build /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]



