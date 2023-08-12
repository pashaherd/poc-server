import db from "../config/db.js";
import { nanoid } from "nanoid";
import {
  validateEmail,
  hashPassword,
  verifyPassword,
} from "../helpers/authentication.js";
import { generateAccessToken } from "../helpers/authorization.js";
import { formatDate } from "../helpers/global.js";

// 1. Login user - Frontend: Login.jsx
export const loginUser = async (req, res) => {
  const { email, password } = req.body;

  // Checks email and password are present in request.
  if (!email || !password) {
    return res
      .status(400)
      .json({ error: "Email and/or password not provided." });
  }
  // Checks that email is valid
  if (validateEmail(email)) {
    const query = "SELECT * from users WHERE email = ?";
    db.query(query, email, async (error, result) => {
      if (error) {
        return res.status(400).json({
          error: error,
        });
      }
      // Checks that result was found and user is active
      if (result.length > 0 && result[0].status === "active") {
        const hashOnFile = result[0].password;
        const isValidPassword = await verifyPassword(hashOnFile, password);
        // Checks password matches stored hash and returns items to set localStorage user profile
        if (isValidPassword) {
          const token = await generateAccessToken(result[0].userId);
          return res.status(200).json({
            userId: result[0].userId,
            firstName: result[0].firstName,
            currency: result[0].currency,
            account: result[0].accountType,
            profilePhoto: result[0].profilePhoto,
            token: token,
          });
        } else {
          return res.status(404).json({
            error: "Incorrect password",
          });
        }
      } else {
        res.status(400).json({
          error: `User does not exist or has been deactivated.`,
        });
      }
    });
  } else {
    res.status(400).json({
      error: `${email} is not a valid email.`,
    });
  }
};

// 2. Signup contractor - Signup.jsx
export const signupContractor = async (req, res) => {
  const {
    username,
    firstName,
    lastName,
    company,
    email,
    password,
    location,
    city,
    accountType,
    status,
    phone,
    dateOfBirth,
  } = req.body;

  // Checks to ensure required fields are present in request.
  if (
    !username ||
    !firstName ||
    !lastName ||
    !email ||
    !password ||
    !accountType ||
    !location ||
    !dateOfBirth
  ) {
    return res.status(400).json({ error: "Missing required field(s)." });
  }

  // Validates email
  if (!validateEmail(email)) {
    return res.status(400).json({ error: "Valid email address required." });
  }

  // Validates password - 8-20 characters, with at least 1 letter and 1 number
  if (!/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,20}$/.test(password)) {
    return res.status(400).json({
      error:
        "Password must be 8-20 characters & contain at least 1 letter and number.",
    });
  }

  // Creates userId, formats date and hashes password
  const userId = nanoid();
  const dateJoined = formatDate();
  const hashedPassword = await hashPassword(password);

  // Query one checks if user already exists.
  const queryOne = `SELECT * FROM users WHERE email = ?`;

  db.query(queryOne, email, (error, result) => {
    if (error) {
      console.log(error);
      res.status(400).json({ error: error });
    }

    if (result.length > 0) {
      return res.status(400).json({ error: `User account already exists.` });
    } else {
      // Query two executes if no existing user found.
      const queryTwo = `INSERT INTO users (userId, firstName, lastName, email, password, accountType, dateJoined, company, country, city, phone, status, dateOfBirth, userName) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;

      db.query(
        queryTwo,
        [
          userId,
          firstName,
          lastName,
          email,
          hashedPassword,
          accountType,
          dateJoined,
          company,
          location,
          city,
          phone,
          status,
          dateOfBirth,
          username,
        ],
        (error, result) => {
          if (error) {
            console.log(error);
            res.status(400).json({ error: error });
          } else {
            res.status(201).json({
              message: `Account successfully created.`,
            });
          }
        }
      );
    }
  });
};

// 3. Forgot Password
export const forgotPassword = (req, res) => {};

// 4. Reset Password
export const resetPassword = (req, res) => {};

// 5. Logout
export const logoutUser = (req, res) => {};

// 6. Get all profile details - Frontend: Profile.jsx
export const getProfileDetails = (req, res) => {
  const userId = req.params.userId;

  const query = `SELECT * FROM users WHERE userId = ?`;

  db.query(query, userId, (error, result) => {
    if (error) {
      return res.status(400).json({
        error: "Database query could not be completed.",
      });
    }
    if (result.length > 0) {
      return res.status(200).json(result);
    } else {
      return res.status(404).json({ message: "User not found." });
    }
  });
};

export const validateUsername = (req, res) => {
  const username = req.params.username;
  const query = `SELECT * FROM users WHERE userName = ?`;
  db.query(query, username, (error, result) => {
    if (error) {
      return res.status(400).json({
        error: "Database query could not be completed.",
      });
    }
    if (result.length > 0) {
      return res.status(200).json({ error: "Username already exists." });
    } else {
      return res.status(200).json({ message: "Username is available." });
    }
  });
};
