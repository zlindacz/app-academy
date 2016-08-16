let game = require('./game.js');
let board = require('./board.js');

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// HanoiGame.prototype.run
let play = new game();
play.run(reader, message => {
  console.log(message);
  reader.close();
});
