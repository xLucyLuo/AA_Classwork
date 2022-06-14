const Asteroid = require("./asteroid.js")
const Ship = require('./ship.js')

Game.DIM_X = 700;
Game.DIM_Y = 700;
Game.NUM_ASTEROIDS = 10;

function Game (ctx){
    this.ctx = ctx
    this.ship = new Ship(this.randomPosition(), this)
    this.asteroids = []
     while (this.asteroids.length < Game.NUM_ASTEROIDS) {
       this.addAsteroids()
    }
    this.draw(ctx)
}

Game.prototype.allObjects = function() {
    const obs = this.asteroids.slice()
    obs.unshift(this.ship)
    return obs
}

Game.prototype.addAsteroids = function(){
    this.asteroids.push(new Asteroid(this.randomPosition(),this))
}

Game.prototype.randomPosition = function(){
    return [Math.random() * Game.DIM_X, Math.random() * Game.DIM_Y];
}

Game.prototype.draw = function(ctx) {
    ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y)
    this.allObjects().forEach(el => {
        el.draw(ctx)
    })
}

Game.prototype.moveObjects = function() {
    this.allObjects().forEach(el => {
        el.move()
    })
}

Game.prototype.wrap = function(pos) {
    newPos1 = pos[0]
    newPos2 = pos[1]
    if (pos[0] > Game.DIM_X) {
        newPos1 = 0 
    }
    if (pos[0] < 0) {
        newPos1 = Game.DIM_X 
    }
    if (pos[1]> Game.DIM_Y) {
        newPos2 = 0 
    }
    if (pos[1]< 0) {
        newPos2 = Game.DIM_Y 
    }
    return [newPos1, newPos2]
}

Game.prototype.checkCollisions = function() {
    for(let i=0; i<this.allObjects().length-1; i++){
        for(let j=i+1; j<this.allObjects().length; j++){
            if (this.allObjects()[i].isCollidedWith(this.allObjects()[j])){
                // alert("COLLISION")
                // this.removeAsteroid(this.allObjects()[j])
                // this.removeAsteroid(this.allObjects()[i])

                if (this.allObjects()[i] instanceof Ship){
                    this.ship.pos = this.randomPosition()
                }else {
                    this.allObjects()[i].bounce()
                }

                if (this.allObjects()[j] instanceof Ship){
                    this.ship.pos = this.randomPosition()
                }else {
                    this.allObjects()[j].bounce()
                }

            }
        }
    }
}


Game.prototype.step = function(){
    this.moveObjects()
    this.checkCollisions()
}

Game.prototype.removeAsteroid = function(asteroid){
    let idx = this.asteroids.indexOf(asteroid);
    this.asteroids.splice(idx,1);
}

module.exports = Game;