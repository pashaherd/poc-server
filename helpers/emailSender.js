import nodemailer from "nodemailer";

const transporter = nodemailer.createTransport({
  host: "mail.mindextent.com",
  port: 465,
  secure: true,
  auth: {
    user: "york@mindextent.com",
    pass: "D#K|$#@5Gz11",
  },
});

const sendEmail = async (to, subject, text, html) => {
  try {
    const info = await transporter.sendMail({
      from: '"POC No Reply" <york@mindextent.com>',
      to,
      subject,
      text,
      html,
    });

    if (info.messageId) {
      return true;
    }
  } catch (error) {
    console.log(error);
  }

  return false;
};

export default sendEmail;
