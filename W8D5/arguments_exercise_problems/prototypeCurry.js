Function.prototype.curry = function(numArgs) {
    const eles = [];
    const that = this;
    return function _curry(ele) {
        eles.push(ele);
        if (numArgs === eles.length) {
            let acc = 0;
            eles.forEach((ele) => {
                acc = that.apply(null, [acc, ele]);
            });
            return acc;
        } else {
            return _curry
        }
    }
}

const sumFunc = sum.curry(4)
console.log(sumFunc(5)(30)(20)(1)); // => 56




//*****SOLUTION*******/
// using spread
Function.prototype.curry0 = function (numArgs) {
    const args = [];
    const fn = this;
  
    function _curriedFn(arg) {
      args.push(arg);
  
      if (args.length === numArgs) {
        return fn(...args);
      } else {
        return _curriedFn;
      }
    }
  
    return _curriedFn;
  };
  
  // using apply
  Function.prototype.curry1 = function (numArgs) {
    const args = [];
    const fn = this;
    function _curriedFn(arg) {
      args.push(arg);
      if (args.length === numArgs) {
        return fn.apply(null, args);
      } else {
        return _curriedFn;
      }
    }
    return _curriedFn;
  };

Function.prototype.curry2 = function (nArg) {
    const argArray = [];
    const _curriedFn = (arg) => {
      argArray.push(arg);
      if (argArray.length === nArg) {
        // spreading the array into individual arguments
        return this(...argArray); 
      } else {
        return _curriedFn;
      }
    };
    return _curriedFn;
  };
  

function sum(num1, num2) {
    return num1 + num2;
}

const sumFunc0 = sum.curry0(4)
console.log(sumFunc0(5)(30)(20)(1)); // => 56
const sumFunc1 = sum.curry1(4)
console.log(sumFunc1(5)(30)(20)(1)); // => 56
const sumFunc2 = sum.curry2(4)
console.log(sumFunc2(5)(30)(20)(1)); // => 56