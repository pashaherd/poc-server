
export default function sortGoals(arr){
    let sortedGoals = []
    for(let i = 0; i < 3; i++){
        let sort; 
        switch(i){
            case 0:
                sort = arr.filter((goal) => goal.goal_type === 'Personal');
            break; 
            case 1:
                sort = arr.filter((goal) => goal.goal_type === 'Team')
            break; 
            case 2:
                sort = arr.filter((goal) => goal.goal_type === 'Assignment')
            break;  
        }
        sortedGoals.push(sort)
    }

    return sortedGoals
}