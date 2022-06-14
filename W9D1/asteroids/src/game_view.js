const Game = require('./game.js');

function GameView (ctx){
    this.ctx = ctx
    this.game = new Game(ctx);
}

GameView.prototype.start= function(){
    setInterval(()=>{
        this.game.step()
        this.game.draw(this.ctx)
    },20)
}

// GameView.prototype.animate = function

module.exports = GameView;