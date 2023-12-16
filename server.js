import express from "express";
import cors from "cors";
import compression from "compression";
import * as dotenv from "dotenv";
import path from "path";
import { fileURLToPath } from "url";
import "dotenv/config";
import adminRoutes from "./routes/adminRoutes.js";
import capstoneRoute from './routes/capstoneProject.js'
import contractorRoutes from "./routes/contractorRoutes.js";
import publicRoutes from "./routes/publicRoutes.js";

// Express middleware setup
const app = express();

// Gzip compression middleware
app.use(compression());

// Cors setup
app.use(
  cors({
    origin: ["*"],
    methods: ["GET", "POST", "PATCH", "PUT", "DELETE"],
    credentials: true,
  })
);

// Parses incoming JSON requests
app.use(express.json());

const __filename = fileURLToPath(import.meta.url);

const __dirname = path.dirname(__filename);
app.use(
  "/assets/",
  express.static(path.join(__dirname, "./assets/profilePhotos/"))
);
app.use((req, res, next) => {
  // Check if the requested file has a .js or .jsx extension
  if (req.url.endsWith('.js') || req.url.endsWith('.jsx')) {
    // Set the Content-Type header to 'application/javascript'
    res.set('Content-Type', 'application/javascript');
  }

  // Move to the next middleware
  next();
});
// Config dotenv
dotenv.config();

// host and port environment variables
const HOST = "http://localhost";
const PORT = process.env.PORT || 5000;

//Routes

// Public routes (login, signup, forgot password, etc.)
app.use("/", publicRoutes);

// Administrator routes
app.use("/admin", adminRoutes);

// Contractor routes
app.use("/contractor", contractorRoutes);

// Capstone Route 
app.use("/capstone", capstoneRoute)
// Default route
app.get("/", (req, res) =>
  res.status(200).json(`Mode and Express server running on port: ${PORT}`)
);

// Global error handler
app.use((error, req, res, next) => {
  console.error(error.stack);
  return res
    .status(500)
    .json({ error: "Internal server error. Something went wrong." });
});

// Bind app and listen for connections on port 8080
app.listen(PORT, () => console.log(`Cake server is ready on ${HOST}:${PORT}`));
