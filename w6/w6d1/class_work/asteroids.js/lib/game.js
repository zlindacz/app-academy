const Ship = require('./ship.js');
const Bullet = require('./bullet.js');
const Asteroid = require('./asteroid.js');

const Game = function () {
  this.allObjects = [];
  this.addAsteroids();
  this.ship = new Ship({
    pos: this.randomPosition(),
    game: this
  });
  window.ship = this.ship;
};

Game.DIM_X = 1000;
Game.DIM_Y = 600;
Game.NUM_ASTEROIDS = 10;
Game.BG_COLOR = "#000033";

Game.prototype.randomPosition = function () {
  let xPos = Math.floor(Math.random() * Game.DIM_X);
  let yPos = Math.floor(Math.random() * Game.DIM_Y);
  return [xPos, yPos];
};

Game.prototype.addAsteroids = function() {
  for(let i = 0; i < Game.NUM_ASTEROIDS; i++) {
    this.allObjects.push(new Asteroid({
      game: this,
      pos: this.randomPosition()
    }));
  }
};

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0,0,Game.DIM_X, Game.DIM_Y);
  ctx.fillStyle = Game.BG_COLOR;
  ctx.fillRect(0,0,Game.DIM_X, Game.DIM_Y);
  this.allObjects.forEach((el) => {
    el.draw(ctx);
  });
  this.ship.draw(ctx);
};

Game.prototype.moveObjects = function () {
  this.allObjects.forEach(el => el.move());
};

Game.prototype.wrap = function (pos) {
  return [Game.DIM_X-pos[0], Game.DIM_Y-pos[1]];
};

Game.prototype.isOutOfBounds = function (pos) {
  return (pos[0] >= Game.DIM_X ||
          pos[0] < 0 ||
          pos[1] >= Game.DIM_Y ||
          pos[1] < 0);
};

Game.prototype.checkCollisions = function () {
  this.allObjects.forEach((object1) => {
    this.allObjects.forEach((object2) => {
      if (!(object1 === object2) && object1.isCollidedWith(object2)) {
        object1.collideWith(object2);
      }
    });
  });
};

Game.prototype.step = function () {
  this.moveObjects();
  this.checkCollisions();
};

Game.prototype.remove = function (object) {
  let index = this.allObjects.indexOf(object);
  this.allObjects.splice(index, 1);
};

Game.prototype.allObjects = function () {
  this.asteroids.concat(this.ship);
};

module.exports = Game;
