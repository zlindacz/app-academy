function TowersOfHanoi () {
  let arr = [[1,2,3],[],[]];
  this.stack = arr;
}

TowersOfHanoi.prototype.promptMove = function(reader, callback) {
  console.log(this.stack);
  reader.question("Which stack do you want to take from? ( 0 - 2 )", function(from_stack) {
    let startTowerIdx = parseInt(from_stack);
    reader.question("Which stack do you want to move to? (0-2)", function(to_stack) {
      let endTowerIdx = parseInt(to_stack);
      console.log(this.isValidMove(startTowerIdx, endTowerIdx));
      callback(startTowerIdx, endTowerIdx);
    }.bind(this));
  }.bind(this));
};

TowersOfHanoi.prototype.isValidMove = function(startTowerIdx, endTowerIdx) {
  if (this.stack[startTowerIdx].length !== 0) {
    if (this.stack[endTowerIdx].length === 0) {
      return true;
    }
    return (this.stack[startTowerIdx][0] < this.stack[endTowerIdx][0]);
  }
  return false;
};

TowersOfHanoi.prototype.move = function(startTowerIdx, endTowerIdx) {
  if (this.isValidMove(startTowerIdx, endTowerIdx)) {
    this.stack[endTowerIdx].unshift(this.stack[startTowerIdx].shift());
  }
};

TowersOfHanoi.prototype.print = function (arr) {
  console.log("Current stack: " + JSON.stringify(arr));
};

TowersOfHanoi.prototype.isWon = function () {
  // this.move(0,1);
  // this.move(0,2);
  // this.move(1,2);
  // this.move(0,1);
  // this.move(2,0);
  // this.move(2,1);
  // this.move(0,1);
  if (this.stack[0].length === 0) {
    if (this.stack[1].length === 3 || this.stack[2].length === 3 ) {
      return true;
    }
  }
  return false;
};

TowersOfHanoi.prototype.run = function (reader, completionCallback) {
    this.promptMove( reader, (start, end) => {
      this.move(start, end);
      if (!this.isWon()) {
        this.run(reader, completionCallback);
      } else {
        completionCallback('You win!');
      }
    });
};
module.exports = TowersOfHanoi;
