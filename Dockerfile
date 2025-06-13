# Dockerfile (moved to project root)
FROM node:18

WORKDIR /app

COPY backend/package*.json ./backend/
RUN npm install --prefix ./backend

COPY backend/src ./backend/src
COPY frontend/dist ./frontend-dist

EXPOSE 5000

CMD ["node", "backend/src/index.js"]
