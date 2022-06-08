function range(start, end){
    // console.log(end);
    if (start >= end)
    {
        return [end];
    }
    let x = range(start, end - 1);
    // console.log(x);
    x.push(end);
    return x;
} 

console.log(range(5,13));

function sumRec(arr){
    // console.log(arr[arr.length-1])
    if (arr.length === 0){
        return 0;
    }
    return arr.pop() + sumRec(arr);
}

console.log(sumRec([6,1,4,3,2,5]));

function exponent1(base, exp){
    if (exp === 0)
    {
        return 1
    }
    else
    {
        return base*exponent1(base, exp-1);
    }
}

console.log(exponent1(3,4));

function exponent2(base, exp){
    if (exp === 0){
        return 1;
    }else if (exp === 1){
        return base;
    }else if (exp % 2 === 0){
        return exponent2(base, exp/2)**2
    }else{
        return base * (exponent2(base,((exp-1)/2)**2))
    }
    
}
console.log(exponent2(3,5));

function fibonacci(n){
    if (n === 1)
        return [1];
    else if (n === 2)
        return [1,1];
    
    let previous = fibonacci(n-1);
    let len = previous.length;
    previous.push(previous[len-1] + previous[len-2]);
    return previous;
}

console.log(fibonacci(7));

function deepDup(arr){
    if (Array.isArray(arr)){
        let newArray = [];
        arr.forEach(el => {newArray.push(deepDup(el))})
        return newArray;
    }else {
        return arr;
    }
}

// a = [1, [2], [3, [4]], 5, [6] , 7]
// b = deepDup(a)

// a[2][1][0] = 0
 
// console.log(a);
// console.log(b);

function bsearch(arr, target)
{
    // console.log(arr);
    let mid = Math.floor(arr.length / 2);
    if (arr.length === 0)
        return -1;
    if(target === arr[mid])
    {
        return mid;
    }
    else if(target < arr[mid])
    {
        return bsearch(arr.slice(0,mid), target);
    }
    else
    {
        let right = bsearch(arr.slice(mid+1,arr.length), target);
        if (right === -1){
            return -1;
        } else{
            return mid + 1 + right;
        }
    }
}

console.log(bsearch([10, 20, 30, 50, 60, 80, 110, 130, 140, 170], x = 110))
console.log(bsearch([10, 20, 30, 50, 60, 80, 110, 130, 140, 170], x = 170))
console.log(bsearch([10, 20, 30, 50, 60, 80, 110, 130, 140, 170], x = 10))
console.log(bsearch([10, 20, 30, 50, 60, 80, 110, 130, 140, 170], x = 80))
// // Output: 6
// // Explanation: Element x is present at index 6. 

console.log(bsearch([10, 20, 30, 40, 60, 110, 120, 130, 170], 160));

function mergesort(arr){
    if (arr.length <= 1){
        return arr;
    }
    let mid = Math.floor(arr.length/2);
    let left = arr.slice(0,mid);
    let right = arr.slice(mid,arr.length);

    return merge(mergesort(left), mergesort(right));

}

function merge(left, right){
    let combo = []
    let i = 0;
    let j = 0;

    while (i < left.length && j < right.length){
        if (left[i] < right[j]){
            combo.push(left[i]);
            i+=1;
        } else {
            combo.push(right[j]);
            j+=1;
        }
    }

    while (i < left.length){
        combo.push(left[i]);
        i+=1;
    }

    while (j < right.length){
        combo.push(right[j]);
        j+=1;
    }
    return combo;
}

console.log(mergesort([6,1,4,3,2,5]));
