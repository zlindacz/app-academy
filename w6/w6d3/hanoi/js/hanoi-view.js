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
