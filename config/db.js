import mysql from "mysql2";
import * as dotenv from "dotenv";
import "dotenv/config";
dotenv.config();

// Database connection
const configuration = {
  user: "root",
  host: "172.17.0.2",
  port: "3306",
  password: "GrilledCheeseOnFrenchBread000",
  database: "poc",
  connectionLimit: 10,
};

/* 
if (process.env.DATABASE_SOCKET) {
  configuration.socketPath = process.env.DB_SOCKET;
} else {
  configuration.host = process.env.DB_HOST;
}
*/ 

const db = mysql.createPool(configuration)


export default db;
