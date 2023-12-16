import express from "express";
import { verifyToken } from "../middleware/verifyToken.js";
import {
  getPaymentCountById,
  getPaymentsByStatusAndUserId,
  getPaymentDetail,
  updateContractorProfile,
  submitPaymentRequest,
  deletePaymentRequest,
  getProjects,
} from "../controllers/contractor.js";
import upload from "../middleware/photoUploader.js";

const router = express.Router();


// 1. GET payment count by user id - Frontend: ConOverview.jsx
router.get("/payment-summary/:userId", verifyToken, getPaymentCountById);

// 2. GET all payments based on payment status and user id - Frontend: ConPendingPayments.jsx and ConPaymentHistory.jsx
router.get(
  "/payments/:userId/:status",
  verifyToken,
  getPaymentsByStatusAndUserId
);

// 3. GET payment request details by payment id - Frontend: ConPaymentDetail.jsx
router.get("/payment-request-detail/:paymentId", verifyToken, getPaymentDetail);

// 4. POST a new payment request - Frontend: ConPaymentRequest.jsx
router.post(
  "/submit-payment-request/:userId",
  verifyToken,
  submitPaymentRequest
);

// 5. POST profile - Frontend: ConProfile.jsx
router.post(
  "/update-profile/:userId",
  [verifyToken, upload.single("profilePhoto")],
  updateContractorProfile
);

// 6. DELETE a payment request by payment id - Frontend: ConPendingPayments.jsx
router.delete("/delete-request/:paymentId", verifyToken, deletePaymentRequest);

router.get("/projects", verifyToken, getProjects);

export default router;
