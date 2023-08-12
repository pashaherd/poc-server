import db from "../config/db.js";
import { nanoid } from "nanoid";
import { validateEmail, hashPassword } from "../helpers/authentication.js";
import { formatDate } from "../helpers/global.js";

// 1. GET all users by accountType (contractor, admin/superAdmin) - Frontend: AdminContractors.jsx
export const getAllUsersByAccountType = (req, res) => {
  const accountType = req.params.accountType;
  let query;

  if (accountType === "contractor") {
    query = `SELECT * FROM users WHERE accountType = "contractor"`;
  } else {
    query = `SELECT * FROM users WHERE (accountType = "admin" OR accountType = "superAdmin")`;
  }

  db.query(query, (error, result) => {
    if (error) {
      return res.status(400).json({
        error: "Database query could not be completed.",
      });
    }

    if (result.length > 0) {
      return res.status(200).json(result);
    } else {
      return res
        .status(200)
        .json({ message: "There were no users of this account type found." });
    }
  });
};

// 2. GET pending requests count - Frontend: AdminOverview.jsx
export const getPendingPaymentRequestsCount = (req, res) => {
  const query = `SELECT COUNT(status) AS count FROM payment WHERE status = "pending"`;

  db.query(query, (error, result) => {
    if (error) {
      return res
        .status(400)
        .json({ error: "Database query could not be completed." });
    } else {
      return res.status(200).json(result);
    }
  });
};

// 3. GET active users count - Frontend: AdminOverview.jsx
export const getActiveUserCountByAccountType = (req, res) => {
  const accountType = req.params.accountType;
  let query;

  if (accountType === "contractor") {
    query = `SELECT COUNT(userId) AS count FROM users WHERE accountType = "contractor" AND status = "active"`;
  } else {
    query = `SELECT COUNT(userId) AS count FROM users WHERE accountType = "admin" OR accountType = "superAdmin" AND status = "active"`;
  }

  db.query(query, (error, result) => {
    if (error) {
      return res
        .status(400)
        .json({ error: "Database query could not be completed." });
    } else {
      return res.status(200).json(result);
    }
  });
};

// 4. GET user by id - Frontend: AdminConDetail.jsx and AdministratorDetail.jsx
export const getUserById = (req, res) => {
  const userId = req.params.userId;

  const query = `SELECT * FROM users WHERE userId = ?`;

  db.query(query, userId, (error, result) => {
    if (error) {
      return res
        .status(400)
        .json({ error: "Database query could not be completed." });
    } else {
      return res.status(200).json(result);
    }
  });
};

// 5. GET all pending payments - Frontend: AdminPendingPayments.jsx
export const getAllPaymentsAndUserDetailsBasedOnStatus = (req, res) => {
  let status = req.params.status;

  if (status === "progress") status = "in progress";

  const query = `SELECT payment.*, users.firstName, users.lastName, users.email FROM payment LEFT JOIN users ON users.userId = payment.userId WHERE payment.status = ?`;

  db.query(query, status, (error, result) => {
    if (error) {
      return res.status(400).json({
        error: "Database query could not be completed.",
      });
    } else {
      return res.status(200).json(result);
    }
  });
};

// 6. GET all user and payment details by paymentId - Frontend: AdminPaymentDetail.jsx
export const getAllPaymentAndUserDetails = (req, res) => {
  const paymentId = req.params.paymentId;
  const query = `SELECT payment.*, users.* FROM payment LEFT JOIN users ON users.userId = payment.userId WHERE payment.paymentId = ?`;

  db.query(query, paymentId, (error, result) => {
    if (error) {
      return res.status(400).json({
        error: "Database query could not be completed.",
      });
    } else {
      return res.status(200).json(result);
    }
  });
};

// 7. GET sum of payments for specific date, grouped by currency
export const getPaymentSumBasedOnPaymentType = (req, res) => {
  const { payrollDate, bonus } = req.params;

  const query = `SELECT SUM(totalPayment) AS total, currency from payment WHERE payrollDate = ? AND bonus = ? GROUP BY currency`;

  db.query(query, [payrollDate, bonus], (error, result) => {
    if (error) {
      return res
        .status(400)
        .json({ error: "Database query could not be completed." });
    } else {
      return res.status(200).json(result);
    }
  });
};

// 8. GET total hours worked in date range by user id - Frontend: AddBonusPayment.jsx
export const totalHoursWorked = (req, res) => {
  const { userId, startDate, endDate } = req.params;

  const query = `SELECT SUM(hoursWorked) AS hoursWorked from payment WHERE (payrollDate BETWEEN ? AND ?) AND userId = ? AND status = "paid"`;

  db.query(query, [startDate, endDate, userId], (error, result) => {
    if (error) {
      console.log(error);
      return res
        .status(400)
        .json({ error: "Database query could not be completed." });
    } else {
      return res.status(200).json(result);
    }
  });
};

// 9. POST new administrator - Frontend: AddAdmin.jsx
export const addAdministrator = async (req, res) => {
  const { firstName, lastName, email, password, accountType, company, status } =
    req.body;

  // Checks to ensure required fields are present in request.
  if (!firstName || !lastName || !email || !password || !accountType) {
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
      const queryTwo = `INSERT INTO users (userId, firstName, lastName, email, password, accountType, dateJoined, company, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`;

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
          status,
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

// 10. POST a bonus payment - Frontend: AdminBonusPayment.jsx
export const addBonusPayment = (req, res) => {
  const {
    userId,
    status,
    hoursWorked,
    requiredHours,
    payrollDate,
    baseCompensation,
    currency,
    totalPayment,
    bonus,
    reviewedBy,
    adminNotes,
  } = req.body;

  if (!status || !userId || !hoursWorked || !payrollDate) {
    res.status(400).json({ error: "Missing required field(s)." });
  }

  const paymentId = nanoid();
  const payDate = payrollDate.slice(0, 10);
  const requestAndReviewDate = formatDate();

  const query = `INSERT INTO payment (paymentId, userId, requestDate, status, hoursWorked, requiredHours, payrollDate, baseCompensation, currency, totalPayment, reviewDate, bonus, reviewedBy, adminNotes) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;

  db.query(
    query,
    [
      paymentId,
      userId,
      requestAndReviewDate,
      status,
      hoursWorked,
      requiredHours,
      payDate,
      baseCompensation,
      currency,
      totalPayment,
      requestAndReviewDate,
      bonus,
      reviewedBy,
      adminNotes,
    ],
    (error, result) => {
      if (error) {
        console.log(error);
        res.status(400).json({ error: error });
      } else {
        res.status(200).json({ message: "Bonus payment has been created." });
      }
    }
  );
};

// 11. PATCH a user's details
export const updateUserDetails = (req, res) => {
  const userId = req.params.userId;
  const { updatedFieldName, updatedFieldValue } = req.body;

  let query = `UPDATE users SET ${updatedFieldName} = ? WHERE userId = ?`;

  db.query(query, [updatedFieldValue, userId], (error, result) => {
    if (error) {
      res.status(400).json({ error: "Database query could not be completed." });
    } else {
      res.status(200).json({ message: "Contractor profile has been updated." });
    }
  });
};

// 12. PATCH pending payment once reviewed by admin - Frontend: AdminPendingDetail.jsx
export const updatePendingPaymentAfterReview = (req, res) => {
  const paymentId = req.params.paymentId;
  const { status, requiredHours, totalPayment, reviewedBy, adminNotes } =
    req.body;

  const reviewDate = formatDate();

  const query = `UPDATE payment SET status = ?, requiredHours = ?, totalPayment = ?, reviewDate = ?, reviewedBy = ?, adminNotes = ?  WHERE paymentId = ?`;

  db.query(
    query,
    [
      status,
      requiredHours,
      totalPayment,
      reviewDate,
      reviewedBy,
      adminNotes,
      paymentId,
    ],
    (error, result) => {
      if (error) {
        res
          .status(400)
          .json({ error: "Database query could not be completed." });
      } else {
        res.status(200).json(result);
      }
    }
  );
};

// 13. PATCH a singular field for payment
export const updatePaymentWithSingleField = (req, res) => {
  const paymentId = req.params.paymentId;
  const { updatedField, updatedValue } = req.body;

  const query = `UPDATE payment SET ${updatedField} = ? WHERE paymentId = ?`;

  db.query(query, [updatedValue, paymentId], (error, result) => {
    if (error) {
      res.status(400).json({ error: "Database query could not be completed." });
    } else {
      res.status(200).json(result);
    }
  });
};

// 14. GET all work items
export const getWorkItems = (req, res) => {
  const paymentId = req.params.paymentId;
  const query = `SELECT wi.id as itemId, wi.hours as itemHours, wi.item_description as itemDescription, prj.project_name as itemProject, prj.program as itemProgram from work_item AS wi
  INNER JOIN project as prj
  ON prj.id = wi.project_id
  WHERE wi.payment_id = ?`;

  db.query(query, paymentId, (error, result) => {
    if (error) {
      return res.status(400).json({
        error: "Database query could not be completed.",
      });
    } else {
      return res.status(200).json(result);
    }
  });
};
