# Use Node base image
FROM node:18

# Set working directory
WORKDIR /app

# Install frontend dependencies and build
COPY frontend/package*.json ./frontend/
RUN npm install --prefix ./frontend
COPY frontend ./frontend
RUN npm run build --prefix ./frontend

# Install backend dependencies
COPY backend/package*.json ./backend/
RUN npm install --prefix ./backend
COPY backend ./backend

# Backend will serve frontend static files from here:
# So we move the dist folder internally
RUN cp -r ./frontend/dist ./frontend-dist

# Expose backend port
EXPOSE 5000

# Start backend
CMD ["npm", "start", "--prefix", "./backend"]
