function sum(nums){
    let total = 0;
    let args = Array.prototype.slice.call(arguments);
    args.forEach((num) => {total+=num});

    return total;
}

console.log(sum2(1, 2, 3, 4) === 10);
console.log(sum2(1, 2, 3, 4, 5) === 15);

function sum2(...nums) {
    let total = 0;
    nums.forEach((num) => {total += num});

    return total;
}

