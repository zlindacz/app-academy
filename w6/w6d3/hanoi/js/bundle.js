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

	const HanoiGame = __webpack_require__(1);
	const HanoiView = __webpack_require__(2);

	$( () => {
	  const rootEl = $('.hanoi');
	  const game = new HanoiGame();
	  new HanoiView(game, rootEl);
	});


/***/ },
/* 1 */
/***/ function(module, exports) {

	class Game {
	  constructor() {
	    this.towers = [[3, 2, 1], [], []];
	  }

	  isValidMove(startTowerIdx, endTowerIdx) {
	      const startTower = this.towers[startTowerIdx];
	      const endTower = this.towers[endTowerIdx];

	      if (startTower.length === 0) {
	        return false;
	      } else if (endTower.length == 0) {
	        return true;
	      } else {
	        const topStartDisc = startTower[startTower.length - 1];
	        const topEndDisc = endTower[endTower.length - 1];
	        return topStartDisc < topEndDisc;
	      }
	  }

	  isWon() {
	      // move all the discs to the last or second tower
	      return (this.towers[2].length == 3) || (this.towers[1].length == 3);
	  }

	  move(startTowerIdx, endTowerIdx) {
	      if (this.isValidMove(startTowerIdx, endTowerIdx)) {
	        this.towers[endTowerIdx].push(this.towers[startTowerIdx].pop());
	        return true;
	      } else {
	        return false;
	      }
	  }

	  print() {
	      console.log(JSON.stringify(this.towers));
	  }

	  promptMove(reader, callback) {
	      this.print();
	      reader.question("Enter a starting tower: ", start => {
	        const startTowerIdx = parseInt(start);
	        reader.question("Enter an ending tower: ", end => {
	          const endTowerIdx = parseInt(end);
	          callback(startTowerIdx, endTowerIdx)
	        });
	      });
	  }

	  run(reader, gameCompletionCallback) {
	      this.promptMove(reader, (startTowerIdx, endTowerIdx) => {
	        if (!this.move(startTowerIdx, endTowerIdx)) {
	          console.log("Invalid move!");
	        }

	        if (!this.isWon()) {
	          // Continue to play!
	          this.run(reader, gameCompletionCallback);
	        } else {
	          this.print();
	          console.log("You win!");
	          gameCompletionCallback();
	        }
	      });
	  }
	}

	module.exports = Game;


/***/ },
/* 2 */
/***/ function(module, exports) {

	const HanoiView = function (game, $el) {
	  this.$el = $el;
	  this.game = game;
	  this.setupTowers();
	  this.render();
	  this.clickTower();
	};

	HanoiView.prototype.setupTowers = function () {
	  for (let tower=0; tower < 3; tower++) {
	    let $ul = $("<ul></ul>");
	    $ul.data("pos", tower);
	    for (let i=0; i < 3; i++) {
	      let $li = $("<li></li>");
	      $ul.append($li);
	    }
	    this.$el.append($ul);
	  }
	};

	HanoiView.prototype.render = function () {
	  let $allDiscs = $('ul li');
	  $allDiscs.removeClass('_1 _2 _3 _undefined');
	  let $towers = $("ul");
	  $towers.each((towerIndex, tower) => {
	    let $tower = $(tower);
	    let $discs = $tower.children();
	    $discs.each((discIndex, disc) => {
	      let $disc = $(disc);
	      $disc.addClass(`_${this.game.towers[towerIndex][discIndex]}`);
	    });
	  });
	};

	HanoiView.prototype.clickTower = function () {
	  $('ul').on("click", event => {
	    if (this.startTower === undefined) {
	      $(event.currentTarget).toggleClass('clicked');
	      this.startTower = $(event.currentTarget).data("pos");
	      this.clickedTower = $(event.currentTarget);
	    } else {
	      this.endTower = $(event.currentTarget).data("pos");
	      if (this.game.isValidMove(this.startTower, this.endTower)) {
	        this.clickedTower.toggleClass('clicked');
	        this.game.move(this.startTower, this.endTower);
	        this.startTower = undefined;
	        this.render();
	        if (this.game.isWon()) {
	          $('.not-won').removeClass('not-won');
	          $(event.currentTarget).children().addClass('won');
	          $('ul').off("click");
	        }
	      } else {
	        alert("You made a bad move.");
	        this.clickedTower.toggleClass('clicked');
	        this.startTower = undefined;
	      }
	    }
	  });
	};

	module.exports = HanoiView;


/***/ }
/******/ ]);