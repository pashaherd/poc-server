import jwt from "jsonwebtoken";
import * as dotenv from "dotenv";
import "dotenv/config";
dotenv.config();

//Authorization

// Generate JWT access token
export const generateAccessToken = (user) => {
  return jwt.sign({ user }, "12345abscdgehdug", {
    expiresIn: "120m",
  });
};
