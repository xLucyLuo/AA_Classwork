const MovingObject = function(options) {
    this.pos = options.pos;
    this.vel = options.vel;
    this.radius = options.radius;
    this.color = options.color;
    this.game = options.game;
}

MovingObject.prototype.draw = function(context) {
    context.beginPath();
    context.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);
    context.fillStyle = this.color;
    // context.strokeStyle()
    context.fill()
}

MovingObject.prototype.move = function() {
    this.pos[0] += this.vel[0]
    this.pos[1] += this.vel[1]
    this.pos = this.game.wrap(this.pos)

}

MovingObject.prototype.isCollidedWith = function(otherObject) {
    let dist = Math.sqrt((this.pos[0] - otherObject.pos[0]) ** 2 + (this.pos[1] - otherObject.pos[1]) ** 2 )
    if (dist < this.radius + otherObject.radius){
        return true;
    }
    return false;
}

MovingObject.prototype.bounce = function() {
    // if (this.vel[0] > this.vel[1]) {
    //     this.vel = [this.vel[0], -this.vel[1]]
    //     otherObject.vel = [otherObject.vel[0], -otherObject.vel[1]]

    // } else {
    //     this.vel = [-this.vel[0], this.vel[1]]
    //     otherObject.vel = [-otherObject.vel[0], otherObject.vel[1]]
    // }
    this.vel = [-this.vel[0], -this.vel[1]]
    // otherObject.vel = [-otherObject.vel[0], -otherObject.vel[1]]
}

module.exports = MovingObject;
// module.exports = mo;