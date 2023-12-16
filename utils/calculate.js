

export function calculateContributions(arr){
    const timestamps = arr.map(({timestamp_c}) => new Date(timestamp_c).getMonth());
    
    let counts = {}; 
    for(let i = 0; i < timestamps.length; i++){
        if(!counts.hasOwnProperty(timestamps[i])){
            counts[timestamps[i]] = 1; 
        } else {
            counts[timestamps[i]] += 1; 
        }
    }

    let contributions  = new Array(12).fill(0); 
    let monthCounts = Object.values(counts); 

    for(let i = 0; i < monthCounts.length; i++){
        contributions[i] = monthCounts[i]
    }

    return contributions

}

export function calculateRate(arr){
     const thisMonth = new Date(Date.now()).getMonth(); 
     const contributions = arr.map(({timestamp}) => new Date(timestamp).getMonth())
     .filter((num) => num === thisMonth); 

     const thisMonthsRate =  contributions.length / 30; 
     const lastMonthContributions =  arr.map(({timestamp}) => new Date(timestamp).getMonth())
     .filter((num) => num === thisMonth === 0 ? 11 : thisMonth - 1);
     
     const lastMonthsRate = lastMonthContributions.length / 30; 
     return {currentRate:thisMonthsRate, lastRate:lastMonthsRate}
    } 