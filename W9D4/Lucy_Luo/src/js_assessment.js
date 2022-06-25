// Write a function, `longestSymmetricSubstring(string)`, that returns the
// longest substring that is the same forwards and in reverse (for example,
// "abba"). If two substrings are the same length, take the first one.

function longestSymmetricSubstring(string){
    if (string.length < 1) return string;
    let longest = string[0]

    for(let i = 0; i<string.length-1; i++){
        for (let j = i+1; j < string.length; j++) {
            substr = string.slice(i,j+1);
            reverse = substr.split("").reverse().join("")
            if(substr === reverse && substr.length > longest.length){
                longest = substr
            }
        }
    }

    return longest
}

// Write an `Array.prototype.myEach(callback)` method that invokes a callback
// for every element in an array and returns undefined. 
//
// **Do NOT use the built-in `Array.prototype.forEach` method in your 
// implementation.**

Array.prototype.myEach = function(callback){
    for (let i = 0; i < this.length; i++) {
        callback(this[i]) 
    }
}
// Write an `Array.prototype.myMap(callback)` method, that takes a callback and 
// returns a new array containing the result of the callback for each element in 
// the array. Use the `Array.prototype.myEach` method you defined above. 
//
// **Do NOT call the built-in `Array.prototype.forEach` or `Array.prototype.map` 
// methods in your implementation.**

Array.prototype.myMap= function(callback){
    let result = []

    this.myEach((el)=>{
        result.push(callback(el))
    })

    return result
}


// Write a function `pairMatch(array, callback)`. It should return all pairs
// of indices ([i, j]) for which `callback(array[i], array[j])` returns true.
//
// NB: Keep in mind that the order of the arguments to the callback may matter.
// e.g., callback = function(a, b) { return a < b }

function pairMatch(array, callback){

    const pairs = [];

    for (let i = 0; i < array.length; i++) {
        for (let j = 0; j < array.length; j++) {
            if (callback(array[i], array[j]) && i!==j){
                pairs.push([i,j])
            }
        }
    }

    return pairs

}

// Write a recursive function, `binarySearch(sortedArray, target)`, that returns
// the index of `target` in `sortedArray`, or -1 if it is not found. 
//
// **Do NOT use the built-in `Array.prototype.indexOf` or
// `Array.prototype.includes` methods in your implementation.**
//
// Here's a quick summary of the binary search algorithm:
//
// Start by looking at the middle item of the array. If it matches the target,
// return its index. Otherwise, recursively search either the left or the right
// half of the array until the target is found or the base case (empty array) is
// reached.

 function binarySearch (sortedArray, target){
    if (sortedArray.length ===0) return -1

    let mid = Math.floor(sortedArray.length/2)

    if (sortedArray[mid] === target){
        return mid;
    }else if (sortedArray[mid]> target){
        return binarySearch(sortedArray.slice(0,mid), target)
    }else{
        let rightResult = binarySearch(sortedArray.slice(mid+1), target)

        if (rightResult === -1){
            return -1
        }else{
            return rightResult + mid + 1
        }
    }
 }

// Write a `Function.prototype.myBind(context)` method. It should return a copy
// of the original function, where `this` is set to `context`. It should allow 
// arguments to the function to be passed both at bind-time and call-time.

Function.prototype.myBind = function(context, ...bindArgs){
    const that = this

    return function(...callArgs){
        return that.apply(context, bindArgs.concat(callArgs))
    }
}

// Write a function, `inherits(ChildClass, ParentClass)`. It should extend the
// methods of `ParentClass.prototype` to `ChildClass.prototype`. 
//
// **Do NOT use `Object.create`, `Object.assign`, `Object.setPrototypeOf`, or
// modify the `__proto__` property of any object directly.**

function inherits(ChildClass, ParentClass){
    function Surrogate(){};
    Surrogate.prototype = ParentClass.prototype
    ChildClass.prototype = new Surrogate()
    ChildClass.prototype.constructor = ChildClass
}

// Write a function `myCurry(fn, object, numArgs)`, that curries the function.
// Remember that a curried function is invoked with one argument at a time. For
// example, the curried form of `sum(1, 2, 3)` would be written as
// `curriedSum(1)(2)(3)`. After `numArgs` have been passed in, invoke the
// original `fn` with the accumulated arguments, using `object` as the
// context.

function myCurry(fn, object, numArgs){
    const args = []

    return function _myCurry(arg){
        args.push(arg)

        if(args.length === numArgs){
            return fn.apply(object, args)
        }else{
            return _myCurry
        }
    }
}

