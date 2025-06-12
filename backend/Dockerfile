# Use the official Node.js image as the base
FROM node:18

# Create and set the working directory inside the container
WORKDIR /app

# Copy only package files first (for faster rebuilds if code doesn't change)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your application code into the container
COPY . .

# Expose the port your app listens on (adjust if different)
EXPOSE 5000

# Run the app
CMD ["npm", "start"]
