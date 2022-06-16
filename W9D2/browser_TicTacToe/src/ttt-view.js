const Game = require("../ttt_node/game");

class View {
  constructor(game, el) {
    this.game = game
    this.el = el
    this.setupBoard()
    window.game = game
    this.bindEvents()
    this.winner ;
  }

  setupBoard() {
    let ul = document.createElement("ul")
    ul.style.display = "flex"
    ul.style.width = "630px"
    ul.style.flexWrap = "wrap"
    ul.className = "board"
    this.el.appendChild(ul)
    


    
    for (let x = 0; x < 3; x++) {
      for (let y = 0; y < 3; y++) {
        let li = document.createElement("li")
        li.className = `grid`
        li.id = `[${x},${y}]`
        li.style.width = "200px"
        li.style.height = "200px"
        li.style.border = "2px solid #d81b60"
        li.style.listStyle = "none"
        li.style.textAlign = "center"
        // li.style.display = "table-cell"
        // li.style.flexDirection = "column"
        // li.style.verticalAlign = "middle"
        // li.style.justifyContent = "center"
        // li.style.alignItems = "center"
        li.style.fontSize = "150px"
        // li.style.color = "white"
        ul.appendChild(li)
      }
   }
  }
  
  handleClick(e) {
    if (!this.game.isOver()){
      let mark = this.game.currentPlayer
      console.log(e.target)
      let pos = JSON.parse(e.target.id)
      console.log(this.game.isOver())
      if(this.game.board.isEmptyPos(pos)){
        this.game.playMove(pos)
        if(e.target.classList.contains("grid")){
          e.target.innerText = `${mark}`
          e.target.setAttribute("grid", "clicked")
          e.target.setAttribute("mark", `${mark}`)
        }
        if(this.game.isOver()){
          alert("GAME OVER")
          if (this.game.winner()) {
            console.log(`${this.game.winner()} has won!`);
          

            winner = document.querySelectorAll(`[mark=${this.game.winner()}]`).forEach(el => { el.setAttribute("winner", "winner") })
            winner = document.querySelectorAll(`.grid`).forEach(el => { el.setAttribute("game", "over") })
            this.winner = this.game.winner()
            alert(`${this.game.winner()} has won!`);
          } else {
            console.log('NO ONE WINS!');
            alert('NO ONE WINS!');
          }
        }
      }else if(!this.game.board.isEmptyPos(pos)){
        alert("INVALID MOVE")
      }
    } 
    
  }
  
  bindEvents() {
    let board = document.querySelector(".board")
    board.addEventListener("click", this.handleClick.bind(this))

  }
  

  makeMove(square) {}

}

module.exports = View;
