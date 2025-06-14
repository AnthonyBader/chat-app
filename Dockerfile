# Use Node as base
FROM node:18

# Set working directory
WORKDIR /app

# Install backend dependencies
COPY backend/package*.json ./backend/
RUN npm install --prefix ./backend

# Install and build frontend
COPY frontend/package*.json ./frontend/
RUN npm install --prefix ./frontend
COPY frontend ./frontend
RUN npm run build --prefix ./frontend

# Copy backend and frontend build
COPY backend/src ./backend/src
COPY frontend/dist ./frontend-dist

# Expose port (adjust if needed)
EXPOSE 5000

# Start backend
CMD ["npm", "start", "--prefix", "./backend"]
