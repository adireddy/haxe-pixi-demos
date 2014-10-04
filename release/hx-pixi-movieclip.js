(function () { "use strict";
var pixihx = {};
pixihx.demos = {};
pixihx.demos.movieclip = {};
pixihx.demos.movieclip.Main = function() {
	this._stage = new PIXI.Stage(65280);
	this._renderer = PIXI.autoDetectRenderer(800,600);
	window.document.body.appendChild(this._renderer.view);
	var assetsToLoader = ["assets/movieclip/SpriteSheet.json"];
	this._loader = new PIXI.AssetLoader(assetsToLoader);
	this._loader.onComplete = $bind(this,this.onAssetsLoaded);
	this._loader.load();
	window.requestAnimationFrame($bind(this,this.animate));
};
pixihx.demos.movieclip.Main.main = function() {
	new pixihx.demos.movieclip.Main();
};
pixihx.demos.movieclip.Main.prototype = {
	animate: function() {
		window.requestAnimationFrame($bind(this,this.animate));
		this._renderer.render(this._stage);
	}
	,onAssetsLoaded: function() {
		var explosionTextures = [];
		var _g = 0;
		while(_g < 26) {
			var i = _g++;
			var texture = PIXI.Texture.fromFrame("Explosion_Sequence_A " + (i + 1) + ".png");
			explosionTextures.push(texture);
		}
		var _g1 = 0;
		while(_g1 < 50) {
			var i1 = _g1++;
			var explosion = new PIXI.MovieClip(explosionTextures);
			explosion.position.x = Math.random() * 800;
			explosion.position.y = Math.random() * 600;
			explosion.anchor.x = 0.5;
			explosion.anchor.y = 0.5;
			explosion.rotation = Math.random() * Math.PI;
			explosion.scale.x = explosion.scale.y = 0.75 + Math.random() * 0.5;
			explosion.gotoAndPlay(Math.random() * 27);
			this._stage.addChild(explosion);
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
pixihx.demos.movieclip.Main.main();
})();

//# sourceMappingURL=hx-pixi-movieclip.js.map