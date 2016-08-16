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
