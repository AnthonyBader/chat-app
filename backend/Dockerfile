# Use Node base image
FROM node:18

# Set working directory inside container
WORKDIR /app/backend

# Copy package files and install
COPY backend/package*.json ./
RUN npm install

# Copy backend source
COPY backend/src ./src

# Copy frontend build files (relative to project root)
COPY frontend/dist ./frontend-dist

EXPOSE 5000

CMD ["node", "src/index.js"]