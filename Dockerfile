# Use an official Node image as base
FROM node:18

# Set working directory
WORKDIR /app

# Copy and install frontend dependencies
COPY frontend/package*.json ./frontend/
RUN npm install --prefix ./frontend

# Build the frontend
COPY frontend ./frontend
RUN npm run build --prefix ./frontend

# Copy backend files
COPY backend/package*.json ./backend/
RUN npm install --prefix ./backend
COPY backend ./backend

# Copy the built frontend
COPY ./frontend/dist ./frontend-dist

# Expose backend port
EXPOSE 5000

# Start the backend
CMD ["npm", "start", "--prefix", "./backend"]
