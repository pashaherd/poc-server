import db from './db.js'

export async function query(str,variables){
    return new Promise((res,rej) =>{
        db.query(str,variables,(err,results) =>{
            if(err){
                console.log(err)
                rej(false)
            }
            res(results)
        })
    })

}


export async function input(query,variables){
    return new Promise( async (resolve,reject) => {
        
         db.execute(query,variables,(err,result) =>{
            if(err){
                console.log(err)
                reject(err.message)
            }
            resolve(true);
         });  
        
    })
}

