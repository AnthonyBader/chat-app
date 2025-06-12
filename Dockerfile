# Dockerfile at root
FROM node:18
WORKDIR /app

COPY backend/package*.json ./backend/
WORKDIR /app/backend
RUN npm install

COPY . .

EXPOSE 5000
CMD ["npm", "start"]
