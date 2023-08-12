import db from "../config/db.js";
import { nanoid } from "nanoid";
import { formatDate } from "../helpers/global.js";
import sendNewPaymentRequestReminderToAdmins from "../services/notifications.js";

// 1. GET payment count by user id - Frontend: ConOverview.jsx
export const getPaymentCountById = (req, res) => {
  const userId = req.params.userId;

  const query = `SELECT COUNT(paymentId) as paymentCount, status FROM payment WHERE userId = ? GROUP BY status`;

  db.query(query, userId, (error, result) => {
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
        .json({ message: "User does not have any payments in the database" });
    }
  });
};

// 2. GET all payments based on payment status and user id - Frontend: ConPendingPayments.jsx and ConPaymentHistory.jsx
export const getPaymentsByStatusAndUserId = (req, res) => {
  const { userId, status } = req.params;
  let query;

  if (status === "pending") {
    query = `SELECT p.paymentId, p.userId, p.status, p.payrollDate, p.hoursWorked, p.requestDate, wi.item_description as itemDescription, prj.project_name as projectName, prj.program as programName
    FROM payment as p
    INNER JOIN work_item AS wi
    ON p.paymentId = wi.payment_id
    INNER JOIN project as prj
    ON prj.id = wi.project_id
    AND p.userId = ?
    AND (p.status = "pending" OR p.status = "declined")
    group by paymentId`;
  } else {
    query = `SELECT p.paymentId, p.userId, p.status, p.payrollDate, p.hoursWorked, p.requestDate, wi.item_description as itemDescription, prj.project_name as projectName, prj.program as programName
    FROM payment as p
    INNER JOIN work_item AS wi
    ON p.paymentId = wi.payment_id
    INNER JOIN project as prj
    ON prj.id = wi.project_id
    AND p.userId = ?
    AND (p.status = "paid" OR p.status = "in progress")
    group by paymentId`;
  }

  db.query(query, userId, (error, result) => {
    if (error) {
      return res.status(400).json({
        error: "Database query could not be completed.",
      });
    }

    if (result.length > 0) {
      res.status(200).json(result);
    } else {
      return res.status(200).json({
        message:
          "User does not have any payments of this type in the database.",
      });
    }
  });
};

// 3. GET payment request details by payment id - Frontend: ConPaymentDetail.jsx
export const getPaymentDetail = (req, res) => {
  const paymentId = req.params.paymentId;

  const query = `SELECT payment.*, users.firstName, users.lastName FROM payment LEFT JOIN users ON users.userId = payment.reviewedBy WHERE payment.paymentId = ?`;

  db.query(query, paymentId, (error, result) => {
    if (error) {
      return res
        .status(400)
        .json({ error: "Database query could not be completed." });
    }
    if (result.length > 0) {
      return res.status(200).json(result);
    } else {
      return res.status(400).json({ error: "Payment not found." });
    }
  });
};

// 4. POST a new payment request - Frontend: ConPaymentRequest.jsx
export const submitPaymentRequest = (req, res) => {
  const userId = req.params.userId;
  const { status, hoursWorked, description, payrollDate, currency, bonus } =
    req.body;

  // Checks for required fields
  if (!status || !hoursWorked || !description || !payrollDate || !currency) {
    return res.status(400).json({ error: "Missing required field(s)." });
  }

  // creates paymentId, formats paydate and creates request date
  const paymentId = nanoid();
  const payDate = payrollDate.slice(0, 10);
  const requestDate = formatDate();

  const query = `INSERT INTO payment (paymentId, userId, requestDate, status, hoursWorked, payrollDate, currency, bonus) VALUES (?, ?, ?, ?, ?, ?, ?, ?)`;

  db.query(
    query,
    [
      paymentId,
      userId,
      requestDate,
      status,
      hoursWorked,
      payDate,
      currency,
      bonus,
    ],
    (error, result) => {
      if (error) {
        return res
          .status(400)
          .json({ error: "Payment query could not be completed." });
      }
    }
  );

  if (paymentId !== undefined) {
    const workItems = JSON.parse(description);
    const workItemKeys = Object.keys(workItems);
    workItemKeys.forEach((wi) => {
      const { itemId, itemHours, itemProject, itemDescription } = workItems[wi];
      const query = `INSERT INTO work_item (id, project_id, item_description, payment_id, hours) values(?, ?, ?, ?, ?)
      `;
      db.query(
        query,
        [itemId, itemProject, itemDescription, paymentId, itemHours],
        (error, result) => {
          if (error) {
            return res
              .status(400)
              .json({ error: "Work Item query could not be completed." });
          }
        }
      );
    });
    sendNewPaymentRequestReminderToAdmins(userId, payrollDate, hoursWorked);
    res
      .status(200)
      .json({ message: "Payment request successfully submitted." });
  }
};

// 5. PATCH profile - Frontend: ConProfile.jsx
export const updateContractorProfile = (req, res) => {
  if (req.file === undefined) {
    res
      .status(400)
      .json({ error: "No file selected. Please select image file." });
  } else if (
    !req.file.originalname.match(/\.(jpg|JPG|jpeg|JPEG|png|PNG|gif|GIF)$/)
  ) {
    res
      .status(400)
      .json({ error: "Only image files (jpg, jpeg, png) are allowed!" });
  } else {
    const userId = req.params.userId;
    const profilePhoto = req.file.filename;
    const { email, company, country, city, phone, currency } = req.body;

    const query = `UPDATE users SET email = ?, company = ?, country = ?, city = ?, phone = ?, currency = ?, profilePhoto = ? WHERE userId = ?`;

    db.query(
      query,
      [email, company, country, city, phone, currency, profilePhoto, userId],
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
  }
};

// 6. DELETE a payment request by payment id - Frontend: ConPendingPayments.jsx
export const deletePaymentRequest = (req, res) => {
  const paymentId = req.params.paymentId;

  const query = `DELETE FROM payment WHERE paymentId = ?`;

  db.query(query, paymentId, (error, result) => {
    if (error) {
      return res
        .status(400)
        .json({ error: "Database query could not be completed." });
    }

    if (result.affectedRows > 0) {
      return res
        .status(200)
        .json({ message: "Payment request has been successfully deleted." });
    } else {
      return res
        .status(404)
        .json({ message: "Payment does not exist and could not be deleted." });
    }
  });
};

export const getProjects = (req, res) => {
  const query = "SELECT id, project_name, program FROM project";
  db.query(query, (error, result) => {
    if (error) {
      return res
        .status(400)
        .json({ error: "Database query could not be completed." });
    }
    if (result.length > 0) {
      return res.status(200).json(result);
    } else {
      return res.status(400).json({ error: "Project not found." });
    }
  });
};
