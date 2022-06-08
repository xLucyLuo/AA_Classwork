Array.prototype.bubbleSort = function(){
    let sorted = false;
    while(!sorted)
    {
        sorted = true;
        for(let i = 0; i < this.length - 1; i++)
        {
            if (this[i] > this[i+1])
            {
                sorted = false;
                temp = this[i];
                this[i] = this[i+1];
                this[i+1] = temp;
            }
        }
    }
    return this;
}

console.log([6,1,4,3,2,5].bubbleSort());

String.prototype.substrings = function(){
    let answer = [""];

    for(let len = 1; len <= this.length; len++){
        for(let j = 0; len+j <= this.length; j++){
            answer.push(this.substring(j, j+len));
        }
    }
    return answer;
}

console.log("abcdefg".substrings());