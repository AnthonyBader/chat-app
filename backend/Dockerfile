# Use Node base image
FROM node:18

# Set working directory inside container
WORKDIR /app/backend

# Copy backend package files
COPY ./backend/package*.json ./

# Install backend dependencies
RUN npm install

# Copy backend source code
COPY ./backend/src ./src

# Copy frontend dist (static build)
COPY ./frontend/dist ./frontend-dist

# Expose backend port
EXPOSE 5000

# Start backend server
CMD ["node", "src/index.js"]
