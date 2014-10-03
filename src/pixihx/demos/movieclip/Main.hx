package pixihx.demos.movieclip;

import pixi.Pixi;
import pixi.display.MovieClip;
import pixi.display.Stage;
import pixi.textures.Texture;
import pixi.utils.Detector;
import pixi.loaders.AssetLoader;
import pixi.display.DisplayObjectContainer;
import js.Browser;

class Main {

	private var _loader:AssetLoader;
    private var _renderer:Dynamic;
    private var _stage:Stage;

	public function new() {
		_stage = new Stage(0x00FF00);
        _renderer = Detector.autoDetectRenderer(800, 600);
        Browser.document.body.appendChild(_renderer.view);

        var assetsToLoader:Array<String> = ["assets/movieclip/SpriteSheet.json"];
    
        _loader = new AssetLoader(assetsToLoader);
        _loader.onComplete = onAssetsLoaded;
        _loader.load();
        
        Browser.window.requestAnimationFrame(cast animate);
	}

	private function animate():Void {
        Browser.window.requestAnimationFrame(cast animate);
        _renderer.render(_stage);
    }

    private function onAssetsLoaded():Void {
        var explosionTextures = [];
        
        for (i in 0...26) {
            var texture = Texture.fromFrame("Explosion_Sequence_A " + (i+1) + ".png");
            explosionTextures.push(texture);
        };
        
        // create a texture from an image path
        // add a bunch of aliens
        for (i in 0...50) {
            // create an explosion MovieClip
            var explosion = new MovieClip(explosionTextures);
            explosion.position.x = Math.random() * 800;
            explosion.position.y = Math.random() * 600;
            explosion.anchor.x = 0.5;
            explosion.anchor.y = 0.5;
            
            explosion.rotation = Math.random() * Math.PI;
            explosion.scale.x = explosion.scale.y = 0.75 + Math.random() * 0.5;
            
            explosion.gotoAndPlay(Math.random() * 27);
            
            _stage.addChild(explosion);
        }

        Browser.window.requestAnimationFrame(cast animate);
    }

	private static function main() {
		new Main();
	}
}