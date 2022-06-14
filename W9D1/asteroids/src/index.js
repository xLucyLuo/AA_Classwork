const MovingObject = require("./moving_object.js");
const Util = require("./utils.js");
const Asteroid = require("./asteroid.js");
const Game = require('./game.js');
const GameView = require('./game_view.js')
const Ship = require('./ship.js')
// const mo = require("./moving_object.js");
// const  {MovingObject, mo} = require("./moving_object.js");

window.addEventListener( 'DOMContentLoaded', ()=> {
    const canvas = document.getElementById('game-canvas')
    const context = canvas.getContext("2d")
    
    const mo = new MovingObject({
        pos: [30, 30],
        vel: [1, 1],
        radius: 10,
        color: "#FE7F9C"
        
    });

    mo.draw(context)
    
    const asst = new Asteroid([50, 50])
    asst.draw(context)

    let gv = new GameView(context)
    gv.start()

    window.MovingObject = MovingObject;
    window.mo = mo
    window.asteroid = Asteroid;
    window.asst = asst;
    window.game = Game;
    window.gv = gv
    

})


