# Use the official Node.js image as the base image
#FROM node:16-alpine
# If you're using M1, M2 Mac, try this:
FROM  node:12-alpine

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./
COPY Gruntfile*.json ./

# Install dependencies
RUN npm install --legacy-peer-deps

# Copy the application files
COPY . .

RUN npm run gruntbuild

# Expose the port
EXPOSE 3000

# Start the application
CMD [ "npm", "dev" ]