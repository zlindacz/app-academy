let TowersOfHanoi = require('./towers_of_hanoi.js');

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// HanoiGame.prototype.run
let game = new TowersOfHanoi();
game.run(reader, message => {
  console.log(message);
  reader.close();
});
