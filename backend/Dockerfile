# Use Node base image
FROM node:18

WORKDIR /app/backend

COPY backend/package*.json ./
RUN npm install

COPY backend/src ./src

COPY frontend/dist ./frontend-dist

EXPOSE 5000

CMD ["node", "src/index.js"]
