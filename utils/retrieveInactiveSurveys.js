
export default function retrieveInactiveSurveys(employee,arr){
    let inactive = []; 
    const attempts = arr.map(({survey_title,survey_attempts}) => {
        return {survey_title, attempts:JSON.parse(survey_attempts)}
    })
    
    console.log(attempts); 
   for(let i = 0; i < attempts.length; i++){
     if(attempts[i]["attempts"] === null){
        inactive.push(attempts[i]["survey_title"])
        continue
     }
     const isPresent = attempts[i]["attempts"].some((att) => att.id === employee); 

     if(!isPresent){
        inactive.push(attempts[i]["survey_title"])
     }
   }
   
   // Produce Clause String 
   let clause = ''
   for(let i = 0; i < inactive.length; i++){
      if(inactive[i + 1]){
        clause = clause.concat('survey_title = ? OR ')
      } else{
        clause = clause.concat('survey_title = ?')
      }
   }
   return {clause, inactive};
}