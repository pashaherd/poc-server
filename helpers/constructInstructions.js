export default function constructInstructions(questions,nest){
   for(let i = 0; i < questions.length; i++){
     if(questions[i].type === 'Multiple Choice'){
        questions[i].nest = nest[i]; 
     }
   }
   
   questions.pop(); 
   return questions
}