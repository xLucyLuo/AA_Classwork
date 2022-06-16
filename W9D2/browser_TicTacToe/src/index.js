const View = require("./ttt-view.js")
const Game = require("../ttt_node/game.js")

document.addEventListener("DOMContentLoaded", () => {
  // Your code here
  let container = document.querySelector(".ttt")
  let view = new View(new Game(), container)


});


