(function () { "use strict";
var Main = function() {
	this._stage = new PIXI.Stage(65280);
	this._renderer = PIXI.autoDetectRenderer(800,600);
	window.document.body.appendChild(this._renderer.view);
	var texture = PIXI.Texture.fromImage("bunny.png");
	this._bunny = new PIXI.Sprite(texture);
	this._bunny.anchor.x = this._bunny.anchor.y = 0.5;
	this._bunny.position.x = 400;
	this._bunny.position.y = 300;
	this._bunny.scale.x = this._bunny.scale.y = 2;
	this._stage.addChild(this._bunny);
	window.requestAnimationFrame($bind(this,this.animate));
};
Main.main = function() {
	new Main();
};
Main.prototype = {
	animate: function() {
		window.requestAnimationFrame($bind(this,this.animate));
		this._bunny.rotation += 0.1;
		this._renderer.render(this._stage);
	}
};
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; }
Main.main();
})();

//# sourceMappingURL=hx-pixi-test.js.map