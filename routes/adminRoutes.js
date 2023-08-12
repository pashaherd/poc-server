import express from "express";
import { verifyToken } from "../middleware/verifyToken.js";
import {
  getAllUsersByAccountType,
  getPendingPaymentRequestsCount,
  getActiveUserCountByAccountType,
  getUserById,
  getAllPaymentsAndUserDetailsBasedOnStatus,
  getAllPaymentAndUserDetails,
  getPaymentSumBasedOnPaymentType,
  addAdministrator,
  addBonusPayment,
  updateUserDetails,
  totalHoursWorked,
  updatePendingPaymentAfterReview,
  updatePaymentWithSingleField,
  getWorkItems,
} from "../controllers/admin.js";

const router = express.Router();

// 1. GET all users based on accountType - Frontend: AdminContractors.jsx and Administrators.jsx
router.get("/users/:accountType", verifyToken, getAllUsersByAccountType);

// 2. GET payment count by status - Frontend: AdminOverview.jsx
router.get(
  "/pending-request-count",
  verifyToken,
  getPendingPaymentRequestsCount
);

// 3. GET active users count by account type and status- Frontend: AdminOverview.jsx
router.get(
  "/active-users-count/:accountType",
  verifyToken,
  getActiveUserCountByAccountType
);

// 4. GET user by id - Frontend: AdminConDetail.jsx && AdministratorDetail.jsx
router.get("/user-detail/:userId", verifyToken, getUserById);

// 5. GET all payments by status - Frontend: AdminPendingPayments.jsx
router.get("/all-payments/:status", getAllPaymentsAndUserDetailsBasedOnStatus);

// 6. GET payment and user details by payment id - Frontend: AdminPaymentDetail.jsx
router.get("/payment-user-details/:paymentId", getAllPaymentAndUserDetails);

// 7. GET total payments sum by payroll date - Frontend: LastPayrollTotalWidget.jsx && NextPayrollTotalWidget.jsx displayed on AdminOverview.jsx
router.get("/payment-sum/:payrollDate/:bonus", getPaymentSumBasedOnPaymentType);

// 8. GET total hours count in date range by user Id - Frontend: AddBonusPayment.jsx
router.get(
  "/hours-worked/:userId/:startDate/:endDate",
  verifyToken,
  totalHoursWorked
);

// 9. POST a new administrator
router.post("/add-administrator", verifyToken, addAdministrator);

// 10. POST a quarterly bonus payment
router.post("/add-bonus-payment", verifyToken, addBonusPayment);

// 11. PATCH user details - Frontend: AdminConDetail.jsx && AdministratorDetail.jsx
router.patch("/update-user/:userId", verifyToken, updateUserDetails);

// 12. PATCH payment after admin review - Frontend:
router.patch(
  "/payment-review/:paymentId",
  verifyToken,
  updatePendingPaymentAfterReview
);

// 13. PATCH payment for singular field update
router.patch(
  "/update-payment/:paymentId",
  verifyToken,
  updatePaymentWithSingleField
);

// 14. GET all work items
router.get("/payment-work-items/:paymentId", getWorkItems);

export default router;
