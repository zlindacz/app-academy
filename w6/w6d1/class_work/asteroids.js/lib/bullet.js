const Utils = require('./utils');
const MovingObject = require('./moving_object');

function Bullet(pos) {
  MovingObject.call(this, {
    pos: pos,
    radius: 2
  });
}

Utils.inherits(Bullet, MovingObject);
module.exports = Bullet;
