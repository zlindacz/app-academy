const Utils = require("./utils");

const MovingObject = function (options) {
  let colorArray = [
    '#ff33ff',
    '#66ffe0',
    '#4dff79',
    '#ff1a1a',
    '#ffd11a'
  ];

  this.game = options.game;
  this.pos = options.pos;
  this.vel = options.vel || 0;
  this.radius = options.radius;
  this.color = options.color;
};

MovingObject.prototype.draw = function(ctx) {
  ctx.fillStyle = this.color;
  ctx.beginPath();

  ctx.arc(
    this.pos[0],
    this.pos[1],
    this.radius,
    0,
    2 * Math.PI,
    false
  );

  ctx.fill();
};

MovingObject.prototype.move = function () {
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];
  if (this.game.isOutOfBounds(this.pos)) {
    this.pos = this.game.wrap(this.pos);
  }
};

MovingObject.prototype.isCollidedWith = function (otherObject) {
  return (Utils.dist(this.pos, otherObject.pos) <
    (this.radius + otherObject.radius));
};

MovingObject.prototype.collideWith = function (otherObject) {

};

module.exports = MovingObject;
