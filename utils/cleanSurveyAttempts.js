
export default function cleanSurveyAttempts(employee,arr){
   return arr.map(({survey_attempts}) => {
        return JSON.parse(survey_attempts)
    })
    .flat()
    .filter((obj) => obj?.id === employee && obj?.status < 100);   
}