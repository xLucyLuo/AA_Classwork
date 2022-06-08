Array.prototype.uniq = function() {
    let uniqueArray = [];
    this.forEach((ele) => {
        if ( uniqueArray.includes(ele))
        {
         uniqueArray.push(ele);
        }
    })
    return uniqueArray;
}

// console.log([1,2,2,3,3,3].uniq());


Array.prototype.twoSum = function(){
    let hash = {};
    let answer = [];

    this.forEach((el, i) => {
        // console.log("a");
        // console.log(hash);
        // console.log(el);
        // console.log(i);
        if ((el*-1) in hash){
            hash[el*-1].forEach(j => {
                answer.push([i,j]);
            })
        }

        if (el in hash){
            // console.log(el, "hellooo");
            // console.log(hash, "hi");
            hash[el].push(i);  
        }
        else {
            hash[el] =[i];
        }
    })
    return answer;
}

console.log([5,1,-3,-5,1,5,5].twoSum());

Array.prototype.transpose = function(){
    //let transposeArray = [...Array(this[0].length)].map(x=>Array(this.length));
    let transposeArray = (new Array(this[0].length).fill(0)).map(x=>new Array(this.length));


    // console.log(transposeArray)
    for(let i = 0; i < this.length; i++)
    {
        for(let j = 0; j < this[0].length; j++)
        {
            transposeArray[j][i] = this[i][j];
        }
    }
    return transposeArray;
}

console.log([[1,2,3],[4,5,6]].transpose());
