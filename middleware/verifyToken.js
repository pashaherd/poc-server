import jwt from "jsonwebtoken";
import * as dotenv from "dotenv";
import "dotenv/config";
dotenv.config();

// Verify JWT token
export const verifyToken = (req, res, next) => {
  const bearerToken = req.headers.authorization.split(" ")[1];

  if (bearerToken !== "undefined") {
    jwt.verify(bearerToken, "12345abscdgehdug", (error, authData) => {
      if (error) {
        res.status(403).json({ error: "Valid token not provided" });
      } else {
        next();
      }
    });
  } else {
    res.status(403).json({ error: "valid token not provided" });
  }
};
