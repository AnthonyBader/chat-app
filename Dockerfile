FROM node:18

WORKDIR /app

# Copy package files
COPY backend/package*.json ./backend/
COPY frontend/package*.json ./frontend/

# Install dependencies
RUN npm install --prefix ./frontend
RUN npm install --prefix ./backend

# Copy and build frontend
COPY frontend ./frontend
RUN npm run build --prefix ./frontend

# Copy backend source
COPY backend/src ./backend/src

# ✅ Now copy the built frontend
COPY ./frontend/dist ./frontend-dist

EXPOSE 5000

CMD ["npm", "start", "--prefix", "./backend"]
