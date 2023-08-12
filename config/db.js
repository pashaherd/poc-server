import mysql from "mysql2";
import * as dotenv from "dotenv";
import "dotenv/config";
dotenv.config();

// Database connection
const configuration = {
  user: "CakeDBUser",
  host: "127.0.0.1",
  port: "3306",
  password: "ChocolateVanillaBlackForestCarrot2022!",
  database: "poc-database",
  connectionLimit: 10,
};

if (process.env.DATABASE_SOCKET) {
  configuration.socketPath = process.env.DB_SOCKET;
} else {
  configuration.host = process.env.DB_HOST;
}

const db = mysql.createPool(configuration);

export default db;
