function Board () {
  let arr = [['', '', ''], ['', '', ''], ['', '', '']];
  this.grid = arr;
}

Board.prototype.won = function () {
  // this.grid.every(arg => {
  //   arg.every(arg2 => {
  //     arg2.length !== 0;
  //   });
  // });
};
// module.exports = board;
