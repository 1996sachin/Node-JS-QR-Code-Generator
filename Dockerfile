# Use Node.js LTS image
FROM node:20

# Set working directory inside container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all project files
COPY . .

# Expose port the app runs on
EXPOSE 3000

# Start the app
CMD ["node", "index.js"]
