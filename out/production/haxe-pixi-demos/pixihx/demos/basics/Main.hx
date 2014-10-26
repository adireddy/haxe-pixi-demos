package pixihx.demos.basics;

import pixi.display.Sprite;
import pixi.display.Stage;
import pixi.textures.Texture;
import pixi.utils.Detector;
import js.Browser;

class Main {

    var _bunny:Sprite;
    var _renderer:Dynamic;
    var _stage:Stage;

	public function new() {
		_stage = new Stage(0x00FF00);
        _renderer = Detector.autoDetectRenderer(800, 600);
        Browser.document.body.appendChild(_renderer.view);
        
        var texture = Texture.fromImage("assets/basics/bunny.png");
        _bunny = new Sprite(texture);
        _bunny.anchor.x = _bunny.anchor.y = 0.5;
        _bunny.position.x = 400;
        _bunny.position.y = 300;
        _bunny.scale.x = _bunny.scale.y = 2;
        
        _stage.addChild(_bunny);
        
        Browser.window.requestAnimationFrame(cast animate);
	}

	function animate() {
        Browser.window.requestAnimationFrame(cast animate);
        _bunny.rotation += 0.1;  
        _renderer.render(_stage);
    }

    static function main() {
		new Main();
	}
}