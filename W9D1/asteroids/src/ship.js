
const MovingObject = require("./moving_object.js");
const Util = require("./utils.js");

function Ship(pos, game){
    let options = {
    pos : pos,
    vel : [0, 0],
    radius : Ship.RADIUS,
    color : Ship.COLOR,
    game : game
    }
    MovingObject.call(this, options)
}

Ship.prototype.resetPos = function() {
    this.pos = this.game.randomPosition()
}

Util.inherits(Ship, MovingObject)

Ship.COLOR = "#FE7F9C";
Ship.RADIUS = 10;




module.exports = Ship;
