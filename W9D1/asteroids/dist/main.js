/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\n\nfunction Asteroid(pos, game){\n    let options = {\n    pos : pos,\n    vel : Util.randomVec(2),\n    radius : Asteroid.RADIUS,\n    color : Asteroid.COLOR,\n    game : game\n    }\n    MovingObject.call(this, options)\n}\n\nUtil.inherits(Asteroid, MovingObject)\n\nAsteroid.COLOR = \"#187BCD\"\nAsteroid.RADIUS = 15;\n\nmodule.exports = Asteroid;\n\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\")\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\")\n\nGame.DIM_X = 700;\nGame.DIM_Y = 700;\nGame.NUM_ASTEROIDS = 10;\n\nfunction Game (ctx){\n    this.ctx = ctx\n    this.ship = new Ship(this.randomPosition(), this)\n    this.asteroids = []\n     while (this.asteroids.length < Game.NUM_ASTEROIDS) {\n       this.addAsteroids()\n    }\n    this.draw(ctx)\n}\n\nGame.prototype.allObjects = function() {\n    const obs = this.asteroids.slice()\n    obs.unshift(this.ship)\n    return obs\n}\n\nGame.prototype.addAsteroids = function(){\n    this.asteroids.push(new Asteroid(this.randomPosition(),this))\n}\n\nGame.prototype.randomPosition = function(){\n    return [Math.random() * Game.DIM_X, Math.random() * Game.DIM_Y];\n}\n\nGame.prototype.draw = function(ctx) {\n    ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y)\n    this.allObjects().forEach(el => {\n        el.draw(ctx)\n    })\n}\n\nGame.prototype.moveObjects = function() {\n    this.allObjects().forEach(el => {\n        el.move()\n    })\n}\n\nGame.prototype.wrap = function(pos) {\n    newPos1 = pos[0]\n    newPos2 = pos[1]\n    if (pos[0] > Game.DIM_X) {\n        newPos1 = 0 \n    }\n    if (pos[0] < 0) {\n        newPos1 = Game.DIM_X \n    }\n    if (pos[1]> Game.DIM_Y) {\n        newPos2 = 0 \n    }\n    if (pos[1]< 0) {\n        newPos2 = Game.DIM_Y \n    }\n    return [newPos1, newPos2]\n}\n\nGame.prototype.checkCollisions = function() {\n    for(let i=0; i<this.allObjects().length-1; i++){\n        for(let j=i+1; j<this.allObjects().length; j++){\n            if (this.allObjects()[i].isCollidedWith(this.allObjects()[j])){\n                // alert(\"COLLISION\")\n                // this.removeAsteroid(this.allObjects()[j])\n                // this.removeAsteroid(this.allObjects()[i])\n\n                if (this.allObjects()[i] instanceof Ship){\n                    this.ship.pos = this.randomPosition()\n                }else {\n                    this.allObjects()[i].bounce()\n                }\n\n                if (this.allObjects()[j] instanceof Ship){\n                    this.ship.pos = this.randomPosition()\n                }else {\n                    this.allObjects()[j].bounce()\n                }\n\n            }\n        }\n    }\n}\n\n\nGame.prototype.step = function(){\n    this.moveObjects()\n    this.checkCollisions()\n}\n\nGame.prototype.removeAsteroid = function(asteroid){\n    let idx = this.asteroids.indexOf(asteroid);\n    this.asteroids.splice(idx,1);\n}\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\n\nfunction GameView (ctx){\n    this.ctx = ctx\n    this.game = new Game(ctx);\n}\n\nGameView.prototype.start= function(){\n    setInterval(()=>{\n        this.game.step()\n        this.game.draw(this.ctx)\n    },20)\n}\n\n// GameView.prototype.animate = function\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\")\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\")\n// const mo = require(\"./moving_object.js\");\n// const  {MovingObject, mo} = require(\"./moving_object.js\");\n\nwindow.addEventListener( 'DOMContentLoaded', ()=> {\n    const canvas = document.getElementById('game-canvas')\n    const context = canvas.getContext(\"2d\")\n    \n    const mo = new MovingObject({\n        pos: [30, 30],\n        vel: [1, 1],\n        radius: 10,\n        color: \"#FE7F9C\"\n        \n    });\n\n    mo.draw(context)\n    \n    const asst = new Asteroid([50, 50])\n    asst.draw(context)\n\n    let gv = new GameView(context)\n    gv.start()\n\n    window.MovingObject = MovingObject;\n    window.mo = mo\n    window.asteroid = Asteroid;\n    window.asst = asst;\n    window.game = Game;\n    window.gv = gv\n    \n\n})\n\n\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/***/ ((module) => {

eval("const MovingObject = function(options) {\n    this.pos = options.pos;\n    this.vel = options.vel;\n    this.radius = options.radius;\n    this.color = options.color;\n    this.game = options.game;\n}\n\nMovingObject.prototype.draw = function(context) {\n    context.beginPath();\n    context.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);\n    context.fillStyle = this.color;\n    // context.strokeStyle()\n    context.fill()\n}\n\nMovingObject.prototype.move = function() {\n    this.pos[0] += this.vel[0]\n    this.pos[1] += this.vel[1]\n    this.pos = this.game.wrap(this.pos)\n\n}\n\nMovingObject.prototype.isCollidedWith = function(otherObject) {\n    let dist = Math.sqrt((this.pos[0] - otherObject.pos[0]) ** 2 + (this.pos[1] - otherObject.pos[1]) ** 2 )\n    if (dist < this.radius + otherObject.radius){\n        return true;\n    }\n    return false;\n}\n\nMovingObject.prototype.bounce = function() {\n    // if (this.vel[0] > this.vel[1]) {\n    //     this.vel = [this.vel[0], -this.vel[1]]\n    //     otherObject.vel = [otherObject.vel[0], -otherObject.vel[1]]\n\n    // } else {\n    //     this.vel = [-this.vel[0], this.vel[1]]\n    //     otherObject.vel = [-otherObject.vel[0], otherObject.vel[1]]\n    // }\n    this.vel = [-this.vel[0], -this.vel[1]]\n    // otherObject.vel = [-otherObject.vel[0], -otherObject.vel[1]]\n}\n\nmodule.exports = MovingObject;\n// module.exports = mo;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\n\nfunction Ship(pos, game){\n    let options = {\n    pos : pos,\n    vel : [0, 0],\n    radius : Ship.RADIUS,\n    color : Ship.COLOR,\n    game : game\n    }\n    MovingObject.call(this, options)\n}\n\nShip.prototype.resetPos = function() {\n    this.pos = this.game.randomPosition()\n}\n\nUtil.inherits(Ship, MovingObject)\n\nShip.COLOR = \"#FE7F9C\";\nShip.RADIUS = 10;\n\n\n\n\nmodule.exports = Ship;\n\n\n//# sourceURL=webpack:///./src/ship.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/***/ ((module) => {

eval("\nconst Util = {\n    inherits(childClass, parentClass){\n        function Surrogate (){};\n        Surrogate.prototype = parentClass.prototype;\n        childClass.prototype = new Surrogate();\n        childClass.prototype.constructor = childClass;\n    },\n\n    randomVec(length) {\n        const deg = 2 * Math.PI * Math.random();\n        return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n      },\n\n      // Scale the length of a vector by the given amount.\n      scale(vec, m) {\n        return [vec[0] * m, vec[1] * m];\n      }\n}\n\nmodule.exports = Util;\n\n\n//# sourceURL=webpack:///./src/utils.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;