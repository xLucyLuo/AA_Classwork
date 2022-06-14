
Function.prototype.inherits = function(SuperClass){
    function Surrogate(){};
    Surrogate.prototype = SuperClass.prototype;
    this.prototype = new Surrogate();
    this.prototype.constructor = this;
}

function MovingObject () {}

MovingObject.prototype.move = function (){
    console.log("i moved");
}

function Ship () {}
Ship.inherits(MovingObject);

Ship.prototype.swim= function (){
    console.log("i can move on water");
}



function Asteroid () {}
Asteroid.inherits(MovingObject);

Asteroid.prototype.fly= function (){
    console.log("i can fly high");
}

s = new Ship();
a = new Asteroid();
m = new MovingObject();

s.move();
s.swim();
// s.fly();

a.move();
// a.swim();
a.fly();

m.move();
// m.swim();
// m.fly();





Function.prototype.inheritsObj = function(SuperClass){
    this.prototype = Object.create(SuperClass.prototype)
    this.prototype.constructor = this;
}


function MovingObject1 () {}

MovingObject1.prototype.move = function (){
    console.log("i moved");
}

function Ship1 () {}
Ship1.inheritsObj(MovingObject1);

Ship1.prototype.swim= function (){
    console.log("i can move on water");
}



function Asteroid1 () {}
Asteroid1.inheritsObj(MovingObject1);

Asteroid1.prototype.fly= function (){
    console.log("i can fly high");
}

s1 = new Ship1();
a1 = new Asteroid1();
m1 = new MovingObject1();

s1.move();
s1.swim();
// s1.fly();

a1.move();
// a1.swim();
a1.fly();

m1.move();
// m1.swim();
// m1.fly();