import express from "express";
import { getProfileDetails, validateUsername } from "../controllers/public.js";
import { loginUser, signupContractor } from "../controllers/public.js";

const router = express.Router();

// 1. Login - Frontend: Login.jsx
router.post("/login", loginUser);

// 2. Signup - Frontend: Signup.jsx
router.post("/signup", signupContractor);

// 3. Forgot password - Frontend: ResetPassword.jsx
router.post("/forgot-password");

// 4. Reset password - No frontend route. Rendered on backend
router.post("/reset-password");

// 5. Logout - Frontend: via Navbar or Header dropdown menu
router.post("/logout");

// 6. Get profile details
router.get("/profile/:userId", getProfileDetails);

// 7. Validate username
router.get("/username-validate/:username", validateUsername);

export default router;
