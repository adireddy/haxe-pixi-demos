(function () { "use strict";
var pixihx = {};
pixihx.demos = {};
pixihx.demos.bitmaptext = {};
pixihx.demos.bitmaptext.Main = function() {
	this._stage = new PIXI.Stage(65280);
	this._renderer = PIXI.autoDetectRenderer(800,600);
	this._renderer.view.style.display = "block";
	window.document.body.appendChild(this._renderer.view);
	var assetsToLoader = ["assets/fonts/desyrel.xml"];
	this._loader = new PIXI.AssetLoader(assetsToLoader);
	this._loader.onComplete = $bind(this,this.onAssetsLoaded);
	this._loader.load();
	window.requestAnimationFrame($bind(this,this.animate));
};
pixihx.demos.bitmaptext.Main.main = function() {
	new pixihx.demos.bitmaptext.Main();
};
pixihx.demos.bitmaptext.Main.prototype = {
	animate: function() {
		window.requestAnimationFrame($bind(this,this.animate));
		this._renderer.render(this._stage);
	}
	,onAssetsLoaded: function() {
		var bitmapFontText = new PIXI.BitmapText("bitmap fonts are\n now supported!",{ font : "35px Desyrel", align : "right"});
		bitmapFontText.position.x = 620 - bitmapFontText.width - 20;
		bitmapFontText.position.y = 20;
		this._stage.addChild(bitmapFontText);
	}
};
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; }
pixihx.demos.bitmaptext.Main.main();
})();

//# sourceMappingURL=hx-pixi-demo.js.map