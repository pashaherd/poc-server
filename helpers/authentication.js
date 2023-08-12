import * as argon2 from "argon2";

// Validates email address is valid
export const validateEmail = (email) => {
  const regex = new RegExp(
    "([!#-'*+/-9=?A-Z^-~-]+(.[!#-'*+/-9=?A-Z^-~-]+)*|\"([]!#-[^-~ \t]|(\\[\t -~]))+\")@([!#-'*+/-9=?A-Z^-~-]+(.[!#-'*+/-9=?A-Z^-~-]+)*|[[\t -Z^-~]*])"
  );

  if (!regex.test(email)) {
    return false;
  } else {
    return true;
  }
};

// Hashes plain text password
export const hashPassword = async (password) => {
  try {
    const hash = await argon2.hash(password);
    return hash;
  } catch {
    return { error: "Error encountered when hashing password." };
  }
};

// Verifies password provided matches hash on file
export const verifyPassword = async (hashOnFile, enteredPassword) => {
  try {
    if (await argon2.verify(hashOnFile, enteredPassword)) {
      return true;
    } else {
      return false;
    }
  } catch (error) {
    return { error: "Internal error. Cannot verify password." };
  }
};
