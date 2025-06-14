import express from "express";
import { fileURLToPath } from "url";
import path from "path";
import dotenv from "dotenv";
import cookieParser from "cookie-parser";
import cors from "cors";

import { connectDB } from "./lib/db.js";
import authRoutes from "./routes/auth.route.js";
import messageRoutes from "./routes/message.route.js";
import { server } from "./lib/socket.js";

dotenv.config();

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors({
  origin: process.env.FRONTEND_URL || "http://localhost:5173", // update this as needed
  credentials: true,
}));
app.use(express.json());
app.use(cookieParser());

// API routes
app.use("/api/auth", authRoutes);
app.use("/api/messages", messageRoutes);

// Serve React frontend build folder
// In production serve frontend-dist from backend folder
if (process.env.NODE_ENV === "production") {
  app.use(express.static(path.join(__dirname, "../frontend-dist")));

  // Catch all other routes and serve index.html
  app.get("*", (req, res) => {
    res.sendFile(path.join(__dirname, "../frontend-dist/index.html"));
  });
} else {
  // Dev fallback or just an example route
  app.get('/api/hello', (req, res) => {
    res.json({ message: 'Hello from backend in dev!' });
  });
}

// Start your HTTP + socket server
server.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
  connectDB();
});
