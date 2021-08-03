const MovingObject = require("./moving_object.js");
const Util = require("./util.js");

const DEFAULT = {
    COLOR: "blue",
    RADIUS: 10,
    SPEED: 1
}


function Asteroid (pos) {
//   options.color = this.COLOR;
//   options.radius = this.RADIUS;
//   options.pos = options.pos;
//   options.vel = Util.randomVec(1)

  MovingObject.call(this, {
      pos: pos,
      vel: Util.randomVec(DEFAULT.SPEED),
      radius: DEFAULT.RADIUS,
      color: DEFAULT.COLOR
    });
}

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;
