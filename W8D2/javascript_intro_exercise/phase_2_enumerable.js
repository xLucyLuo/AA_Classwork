
Array.prototype.myEach = function(callback){
    for(let i=0; i < this.length; i++){
        callback(this[i]); 
    }
}

// function logIfEven(num) {
//     if (num % 2 === 0) {
//       console.log(`${num} is an even number!`);
//     }
//   }

// [1, 2, 3, 4, 5].myEach(logIfEven);

function doubler(num) {
    return num*2;
}

Array.prototype.myMap = function(callback){
    newArray = [];

    this.myEach(el => {
        newArray.push(callback(el));
    })
    return newArray;
}

console.log([1, 2, 3, 4, 5].myMap(doubler));

//undefined if nothing passed in
Array.prototype.myReduce = function(callback, initialValue){
    let j = 0;
    if (initialValue === undefined){
        initialValue = this[0];
        j = 1;
    }
    for(let i = j; i < this.length; i++){
        initialValue = callback(initialValue, this[i]);
    }
    return initialValue;
}   

console.log([1, 2, 3].myReduce(function(acc, el) {
    return acc + el;
  })); // => 6
  
  // with initialValue
console.log([1, 2, 3].myReduce(function(acc, el) {
    return acc + el;
  }, 25)); // => 31

