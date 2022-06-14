function curriedSum(numArgs){
    const numbers = [];
    function _curriedSum(num){
        numbers.push(num);
        let sum = 0;
        if (numbers.length===numArgs){
            numbers.forEach(num => sum+=num);
            return sum;
        }else{
            return _curriedSum;
        }
    }
    return _curriedSum;
}

const sum = curriedSum(4);
console.log(sum(5)(30)(20)(1)); // => 56