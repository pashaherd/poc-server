import jwt from 'jsonwebtoken'; 
import {v4 as uuidv4} from 'uuid'; 
import * as dotenv from "dotenv";
import "dotenv/config";
dotenv.config();

const secret = process.env.JWT_SECRET; 

function signJWT(req,res,next){
   const token = uuidv4(); 


   jwt.sign({token}, secret, (err,token) =>{
      if(err){
        console.log(err); 
        return res.status(500).json({ok:false, msg:'Internal Server Error'})
      }
      
      return res.status(200).json({ok:true,token}); 
   })
}

export default signJWT