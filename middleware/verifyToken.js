import jwt from "jsonwebtoken";
import * as dotenv from "dotenv";
import "dotenv/config";
dotenv.config();

// Verify JWT token
export const verifyToken = (req, res, next) => {
  if(!req.headers.authorization){
    return res.status(403).json({ok:false, msg:'Forbidden'})
  }
  const bearerToken = req.headers.authorization.split(" ")[1];

  if (bearerToken !== "undefined") {
    jwt.verify(bearerToken, "12345abscdgehdug", (error, token) => {
      if (error) {
        res.status(403).json({ok:false ,msg: "Valid token not provided" });
        return 
      } 
      
      const currentTime = Date.now(); 
      const twentyFourHoursAgo = Date.now() - (1000 * 60 * 60 * 24); 
       
      if((currentTime - twentyFourHoursAgo) > token.iat){
        return res.status(400).json({ok:false, expired:true, msg:'Session Expired'})
      }
        next();
      
    });
  } else {
    res.status(403).json({ ok:false ,msg: "valid token not provided" });
  }
};
