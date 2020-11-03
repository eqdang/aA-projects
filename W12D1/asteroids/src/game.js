// const Asteroid = require("./asteroid.js");
const Dictionary = require("./dictionary.js")

const DEFAULT = {
  DIM_X: 1000,
  DIM_Y: 1000,
  NUM_ASTEROIDS: 100
}

function Game () {
  this.asteroids = [];
  this.addAsteroids();
}

Game.prototype.addAsteroids = function () {
  for (let i = 0; i < DEFAULT.NUM_ASTEROIDS; i++) {
    let ast = new Dictionary(this.randomPosition())
    this.asteroids.push(ast);
  }
}

Game.prototype.randomPosition = function () {
  return [Math.random()*DEFAULT.DIM_X, Math.random()*DEFAULT.DIM_Y];
}

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, DEFAULT.DIM_X, DEFAULT.DIM_Y);
  this.asteroids.forEach(ast => ast.draw(ctx));
}

Game.prototype.moveObjects = function () {
  this.asteroids.forEach(ast => ast.move());
}

module.exports = Game;