const MovingObject = require("./moving_object.js");
const Util = require("./utils.js");

function Asteroid(pos, game){
    let options = {
    pos : pos,
    vel : Util.randomVec(2),
    radius : Asteroid.RADIUS,
    color : Asteroid.COLOR,
    game : game
    }
    MovingObject.call(this, options)
}

Util.inherits(Asteroid, MovingObject)

Asteroid.COLOR = "#187BCD"
Asteroid.RADIUS = 15;

module.exports = Asteroid;
