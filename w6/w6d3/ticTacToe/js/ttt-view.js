var View = function (game, $el) {
  this.$el = $el;
  this.game = game;
  this.setupBoard();
  this.bindEvents();
};

View.prototype.endGame = function () {
  $(".ttt li").off('click');
  let $message = $(".message");
  let $squares = $(".ttt li");
  if (this.game.board.winner()) {
    $squares.each((_, square) => {
      const $square = $(square);
      if ($square.text() === this.game.board.winner()) {
        $square.addClass("win");
      } else {
        $square.addClass("lose");
      }
    });
    $message.text(`${this.game.board.winner()} wins!`);
  } else {
    $squares.each((_, square) => {
      const $square = $(square);
      $square.addClass("lose");
    });
    $message.text("It's a tie!");
  }
};

View.prototype.bindEvents = function () {
  $(".ttt li").on('click', event => {
    const $currentTarget = $(event.currentTarget);
    if ($currentTarget.text()) {
      alert("Invalid Move!");
    } else {
      this.makeMove($currentTarget);
      if (this.game.isOver()) {
        this.endGame();
      }
    }
  });
};

View.prototype.makeMove = function ($square) {
  let pos = $square.data("pos");
  let mark = this.game.currentPlayer;
  this.game.playMove(pos);
  $square.text(mark);
  $square.addClass("clicked");
};

View.prototype.setupBoard = function () {
  let $ul = $("<ul></ul>");
  for (let i=0; i < 9; i++) {
    let $li = $("<li></li>");
    $li.data("pos", [Math.floor(i / 3), i % 3]);
    $ul.append($li);
  }
  this.$el.append($ul);
};

module.exports = View;
