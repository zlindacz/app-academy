/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	const GameView = __webpack_require__(1);
	const Game = __webpack_require__(2);


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


/***/ },
/* 1 */
/***/ function(module, exports, __webpack_require__) {

	const Game = __webpack_require__(2);

	const GameView = function(game, ctx) {
	  this.game = game;
	  this.ctx = ctx;
	};

	GameView.prototype.start = function () {
	  window.setInterval( () => {
	    this.game.step();
	    this.game.draw(this.ctx);
	  }, 20);
	};

	module.exports = GameView;


/***/ },
/* 2 */
/***/ function(module, exports, __webpack_require__) {

	const Ship = __webpack_require__(3);
	const Bullet = __webpack_require__(6);
	const Asteroid = __webpack_require__(7);

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


/***/ },
/* 3 */
/***/ function(module, exports, __webpack_require__) {

	const Utils = __webpack_require__(4);
	const MovingObject = __webpack_require__(5);

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


/***/ },
/* 4 */
/***/ function(module, exports) {

	const Utils = {
	  inherits (childClass, parentClass) {
	    function Surrogate() {}
	    Surrogate.prototype = parentClass.prototype;
	    childClass.prototype = new Surrogate();
	    childClass.prototype.constructor = childClass;
	  },

	  dist (pos1, pos2) {
	    let xDelta = pos1[0] - pos2[0];
	    let yDelta = pos1[1] - pos2[1];
	    return Math.sqrt(Math.pow(xDelta, 2) + Math.pow(yDelta, 2));
	  }
	};

	module.exports = Utils;


/***/ },
/* 5 */
/***/ function(module, exports, __webpack_require__) {

	const Utils = __webpack_require__(4);

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


/***/ },
/* 6 */
/***/ function(module, exports, __webpack_require__) {

	const Utils = __webpack_require__(4);
	const MovingObject = __webpack_require__(5);

	function Bullet(pos) {
	  MovingObject.call(this, {
	    pos: pos,
	    radius: 2
	  });
	}

	Utils.inherits(Bullet, MovingObject);
	module.exports = Bullet;


/***/ },
/* 7 */
/***/ function(module, exports, __webpack_require__) {

	const Utils = __webpack_require__(4);
	const MovingObject = __webpack_require__(5);
	const Ship = __webpack_require__(3);

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


/***/ }
/******/ ]);