package pixihx.demos.spritesheet;

import pixi.Pixi;
import pixi.display.Sprite;
import pixi.display.Stage;
import pixi.textures.Texture;
import pixi.utils.Detector;
import pixi.loaders.AssetLoader;
import pixi.display.DisplayObjectContainer;
import js.Browser;

class Main {

	private var _loader:AssetLoader;
    private var _alienContainer:DisplayObjectContainer;
    private var _renderer:Dynamic;
    private var _stage:Stage;

    private var _count:Float;
    private var _aliens:Array<Dynamic>;
    private var _alienFrames:Array<String>;

	public function new() {
		_stage = new Stage(0x00FF00);
        _renderer = Detector.autoDetectRenderer(800, 600);
        Browser.document.body.appendChild(_renderer.view);

        var assetsToLoader:Array<String> = ["assets/spritesheet/SpriteSheet.json"];
    
        _loader = new AssetLoader(assetsToLoader);
        _loader.onComplete = onAssetsLoaded;
        _loader.load();
        
        _count = 0;
        _aliens = [];
        _alienFrames = ["eggHead.png", "flowerTop.png", "helmlok.png", "skully.png"];
        
        // create an empty container
        _alienContainer = new DisplayObjectContainer();
        _alienContainer.position.x = 400;
        _alienContainer.position.y = 300;
    
        _stage.addChild(_alienContainer);
        
        Browser.window.requestAnimationFrame(cast animate);
	}

	private function animate():Void {
        Browser.window.requestAnimationFrame(cast animate);
        for (i in 0...100) {
            var alien = _aliens[i];
            alien.rotation += 0.1;
        }
        
        _count += 0.01;
        _alienContainer.scale.x = Math.sin(_count);
        _alienContainer.scale.y = Math.sin(_count);
        
        _alienContainer.rotation += 0.01;
        _renderer.render(_stage);
    }

    private function onAssetsLoaded():Void {
        for (i in 0...100) {
            var frameName:String = _alienFrames[i % 4];
            
            // create an alien using the frame name..
            var alien = Sprite.fromFrame(frameName);
            
            /*
             * fun fact for the day :)
             * another way of doing the above would be
             * var texture = PIXI.Texture.fromFrame(frameName);
             * var alien = new PIXI.Sprite(texture);
             */
            
            alien.position.x = Math.random() * 800 - 400;
            alien.position.y = Math.random() * 600 - 300;
            alien.anchor.x = 0.5;
            alien.anchor.y = 0.5;
            _aliens.push(alien);
            _alienContainer.addChild(alien);
        }

        Browser.window.requestAnimationFrame(cast animate);
    }

	private static function main() {
		new Main();
	}
}