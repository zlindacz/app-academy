const GameView = require('./lib/game_view.js');
const Game = require('./lib/game.js');


document.addEventListener("DOMContentLoaded", function() {
  let canvas = document.getElementById("game-canvas");
  canvas.width = Game.DIM_X;
  canvas.height = Game.DIM_Y;

  let ctx = canvas.getContext("2d");
  let game = new Game();
  window.game = game;
  let gameView = new GameView(game, ctx);
  gameView.start();
});
