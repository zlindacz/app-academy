Function.prototype.inherits = function(parent) {
  function Surrogate() {}
  Surrogate.prototype = parent.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};

function MovingObject (name, position) {
  this.name = name;
  this.position = position;
}

function Ship (name, position) {
  MovingObject.call(this, name, position);
}
Ship.inherits(MovingObject);

function Asteroid (name, position) {
  MovingObject.call(this, name, position);
}
Asteroid.inherits(MovingObject);

Asteroid.prototype.fly = function() {
  console.log(`${this.name} FLYYYY`);
};

let ast = new Asteroid("Pinky", [0,0]);
let ship = new Ship("Dumbo", [0,0]);
ast.fly();
