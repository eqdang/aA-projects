class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    // this.game.playMove();
    this.$el.on("click", "li", event => {
      const currentTarget = $(event.currentTarget);
      this.makeMove(currentTarget);
    })
  }

  makeMove($square) {
    const pos = $square.data("pos");
    
    this.game.playMove(pos);
    $square.addClass("selected")
    $square.addClass(`${this.game.currentPlayer}`)

    // if {
    //   alert("invalid move")
    // }

    let $fig = $("<figcaption>");
    if (this.game.isOver()) {
      this.$el.off("click");
      $square.addClass(`${this.game.currentPlayer}`)
      $fig.html("game over. " + `${this.game.winner()}` + " is the wiener!");
    }
    $fig.appendTo(this.$el)
  }



  setupBoard() {
    const $ul = $("<ul>");
    
    for (let rowIdx = 0; rowIdx < 3; rowIdx++) {
      for (let colIdx = 0; colIdx < 3; colIdx++) {
        let $li = $("<li>");
          $li.data( "pos", [rowIdx, colIdx]);
          $li.appendTo($ul)
      }
    }
    $ul.appendTo(this.$el)
  }
}

module.exports = View;
