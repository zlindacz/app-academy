const Utils = require('./utils');
const MovingObject = require('./moving_object');

const Ship = function (options) {
  let colorArray = [
    '#ff33ff',
    '#66ffe0',
    '#4dff79',
    '#ff1a1a'
  ];
  let randomColor = colorArray[Math.floor(Math.random()*colorArray.length)];

  MovingObject.call(this, {
    game: options.game,
    pos: options.pos,
    radius: 15,
    vel: [0,0],
    color: options.color || randomColor
  });
};

Ship.prototype.relocate = function () {
  this.pos = this.game.randomPosition;
};

Utils.inherits(Ship, MovingObject);
module.exports = Ship;
