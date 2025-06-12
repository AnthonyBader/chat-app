# Use Node.js v18 base image
FROM node:18

# Set root working directory
WORKDIR /app

# Copy backend package files first for optimized layer caching
COPY ./backend/package*.json ./backend/

# Set working directory for backend and install dependencies
WORKDIR /app/backend
RUN npm install

# Go back to root and copy everything (backend + frontend)
WORKDIR /app
COPY . .

# Build React frontend
WORKDIR /app/frontend
RUN npm install
RUN npm run build

# Move build output to backend for static serving
RUN mkdir -p /app/backend/frontend-dist && \
    cp -r dist/* /app/backend/frontend-dist

# Switch back to backend working directory
WORKDIR /app/backend

# Expose backend server port
EXPOSE 5000

# Start the server
CMD ["npm", "start"]
