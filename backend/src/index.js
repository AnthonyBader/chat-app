import express from "express";
import path from "path";
import { fileURLToPath } from "url";
import fs from "fs";
import dotenv from "dotenv";
import { connectDB } from "./lib/db.js";

dotenv.config();

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();

// Middleware to parse JSON bodies
app.use(express.json());

// Register your API routes here
app.use("/api/auth", (await import("./routes/auth.route.js")).default);
app.use("/api/users", (await import("./routes/auth.route.js")).default);

const frontendPath = path.join(__dirname, "../../frontend/dist");

// Check if frontend build exists
if (!fs.existsSync(path.join(frontendPath, "index.html"))) {
  console.error("❌ frontend/dist/index.html not found at:", frontendPath);
} else {
  console.log("✅ frontend/dist/index.html found at:", frontendPath);
}

// Serve frontend static files
app.use(express.static(frontendPath));

// Serve index.html for all other routes (SPA fallback)
app.get("*", (req, res) => {
  res.sendFile(path.join(frontendPath, "index.html"));
});

// Connect to MongoDB and start server
connectDB()
  .then(() => {
    const PORT = process.env.PORT || 5000;
    app.listen(PORT, () => {
      console.log(`✅ Server running on port ${PORT}`);
    });
  })
  .catch((err) => {
    console.error("❌ Failed to connect to MongoDB:", err);
  });
