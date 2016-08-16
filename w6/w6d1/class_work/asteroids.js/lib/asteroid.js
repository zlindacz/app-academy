const Utils = require('./utils');
const MovingObject = require('./moving_object');
const Ship = require('./ship');

function randomVelocity() {
  let xVel = Math.sin(Math.random()*2*Math.PI)*4;
  let yVel = Math.cos(Math.random()*2*Math.PI)*4;
  return [xVel, yVel];
}

const Asteroid = function (options) {
  MovingObject.call(this, {
    game: options.game,
    pos: options.pos,
    color: "#9C9C9C",
    radius: 25,
    vel: randomVelocity()
  });
};

Asteroid.prototype.collideWith = function (otherObject) {
  if (otherObject instanceof Ship) {
    otherObject.pos = this.game.randomPosition;
    otherObject.vel = 0;
  }
};

Utils.inherits(Asteroid, MovingObject);

module.exports = Asteroid;
