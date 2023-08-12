import db from "../config/db.js";
import sendEmail from "../helpers/emailSender.js";

const getAdminEmails = async () => {
  const query = "SELECT email FROM users WHERE accountType = 'admin'";
  return await db
    .promise()
    .query(query)
    .then((data) => {
      const emails = data[0].map((r) => r.email);
      return emails.toString();
    })
    .catch((error) => console.log(error));
};

const getContractorNameById = async (userId) => {
  const query = "SELECT firstName, lastName FROM users WHERE userId = ?";
  return await db
    .promise()
    .query(query, [userId])
    .then((data) => {
      return `${data[0][0].firstName} ${data[0][0].lastName}`;
    })
    .catch((error) => console.log(error));
};

const sendNewPaymentRequestReminderToAdmins = async (
  userId,
  payrollDate,
  hoursWorked
) => {
  const adminEmails = await getAdminEmails();
  const contractFullName = await getContractorNameById(userId);

  if (adminEmails === undefined || contractFullName === undefined) {
    console.log("Not enought information to send emails.");
  } else {
    const emailTitle = `New payment request from ${contractFullName}`;
    const emailText = "";
    const emailHtml = `<div>
      <p>Hi,</p>
      <p>You have recieved new payment request for ${contractFullName}.</p>
      <p>Please find the details as below:</p>
      <br/>
      <table>
        <tr>
          <td>Contractor Name: </td>
          <td><b>${contractFullName}</b></td>
        </tr>
        <tr>
          <td>Payroll Date: </td>
          <td><b>${new Date(payrollDate).toLocaleDateString()}</b></td>
        </tr>
        <tr>
          <td>Hours Worked: </td>
          <td><b>${hoursWorked}</b></td>
        </tr>
      </table>
      <br/>
      <p>To find more information, please login to your account.</p>
      <p>This is auto generated email. Please do not reply to this email.</p>
      <p>Thank you,</p>
      <p>Team Piece of Cake</p>
    </div>`;
    const emailSent = sendEmail(adminEmails, emailTitle, emailText, emailHtml);
    if (!emailSent) console.log("Email couldn't send successfully.");
  }
};

export default sendNewPaymentRequestReminderToAdmins;
