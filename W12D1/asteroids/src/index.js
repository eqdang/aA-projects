// console.log("Webpack is really working!")

const GameView = require("./game_view.js");

window.addEventListener("DOMContentLoaded", function() { 
  	const canvasEl = document.getElementById("game-canvas");
	// canvasEl.style.height = "1000px";
	// canvasEl.style.width = "1000px";
	const ctx = canvasEl.getContext("2d");
	const gameView = new GameView(ctx);
	// debugger
	gameView.start();
})
