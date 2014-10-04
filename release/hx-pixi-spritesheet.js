(function () { "use strict";
var pixihx = {};
pixihx.demos = {};
pixihx.demos.spritesheet = {};
pixihx.demos.spritesheet.Main = function() {
	this._stage = new PIXI.Stage(65280);
	this._renderer = PIXI.autoDetectRenderer(800,600);
	window.document.body.appendChild(this._renderer.view);
	var assetsToLoader = ["assets/spritesheet/SpriteSheet.json"];
	this._loader = new PIXI.AssetLoader(assetsToLoader);
	this._loader.onComplete = $bind(this,this.onAssetsLoaded);
	this._loader.load();
	this._count = 0;
	this._aliens = [];
	this._alienFrames = ["eggHead.png","flowerTop.png","helmlok.png","skully.png"];
	this._alienContainer = new PIXI.DisplayObjectContainer();
	this._alienContainer.position.x = 400;
	this._alienContainer.position.y = 300;
	this._stage.addChild(this._alienContainer);
	window.requestAnimationFrame($bind(this,this.animate));
};
pixihx.demos.spritesheet.Main.main = function() {
	new pixihx.demos.spritesheet.Main();
};
pixihx.demos.spritesheet.Main.prototype = {
	animate: function() {
		window.requestAnimationFrame($bind(this,this.animate));
		var _g = 0;
		while(_g < 100) {
			var i = _g++;
			var alien = this._aliens[i];
			alien.rotation += 0.1;
		}
		this._count += 0.01;
		this._alienContainer.scale.x = Math.sin(this._count);
		this._alienContainer.scale.y = Math.sin(this._count);
		this._alienContainer.rotation += 0.01;
		this._renderer.render(this._stage);
	}
	,onAssetsLoaded: function() {
		var _g = 0;
		while(_g < 100) {
			var i = _g++;
			var frameName = this._alienFrames[i % 4];
			var alien = PIXI.Sprite.fromFrame(frameName);
			alien.position.x = Math.random() * 800 - 400;
			alien.position.y = Math.random() * 600 - 300;
			alien.anchor.x = 0.5;
			alien.anchor.y = 0.5;
			this._aliens.push(alien);
			this._alienContainer.addChild(alien);
		}
		window.requestAnimationFrame($bind(this,this.animate));
	}
};
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; }
Math.NaN = Number.NaN;
Math.NEGATIVE_INFINITY = Number.NEGATIVE_INFINITY;
Math.POSITIVE_INFINITY = Number.POSITIVE_INFINITY;
Math.isFinite = function(i) {
	return isFinite(i);
};
Math.isNaN = function(i1) {
	return isNaN(i1);
};
pixihx.demos.spritesheet.Main.main();
})();

//# sourceMappingURL=hx-pixi-spritesheet.js.map