package pixihx.demos.pixidude;

import pixi.Pixi;
import pixi.display.Sprite;
import pixi.display.Stage;
import pixi.extras.Spine;
import pixi.utils.Detector;
import pixi.loaders.AssetLoader;
import pixi.display.DisplayObjectContainer;
import js.Browser;

class Main {

    private var _loader:AssetLoader;
    private var _renderer:Dynamic;
    private var _stage:Stage;

    private var _pixie:Spine;

    private var _postition:Float = 0;
    private var _background1:Dynamic;
    private var _background2:Dynamic;
    private var _foreground1:Dynamic;
    private var _foreground2:Dynamic;


    public function new() {
        _stage = new Stage(0x00FF00);
        _renderer = Detector.autoDetectRenderer(800, 600);
        _renderer.view.style.display = "block";
        _renderer.view.style.width = "100%";
        _renderer.view.style.height = "100%";
        Browser.document.body.appendChild(_renderer.view);

        var assetsToLoader:Array<String> = ["assets/spine/data/PixieSpineData.json", "assets/spine/data/Pixie.json", "assets/spine/data/iP4_BGtile.jpg", "assets/spine/data/iP4_ground.png"];
    
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
        _background1 = Sprite.fromImage("assets/spine/data/iP4_BGtile.jpg");
        _background2 = Sprite.fromImage("assets/spine/data/iP4_BGtile.jpg");
        _stage.addChild(_background1);
        _stage.addChild(_background2);

        _foreground1 = Sprite.fromImage("assets/spine/data/iP4_ground.png");
        _foreground2 = Sprite.fromImage("assets/spine/data/iP4_ground.png");
        _stage.addChild(_foreground1);
        _stage.addChild(_foreground2);
        _foreground1.position.y = _foreground2.position.y = 640 - _foreground2.height;

        _pixie = new Spine("assets/spine/data/PixieSpineData.json");
        var scale = 0.3;

        _pixie.position.x = 1024/3;
        _pixie.position.y =  500;

        _pixie.scale.x = _pixie.scale.y = scale;

        _pixie.stateData.setMixByName("running", "jump", 0.2);
        _pixie.stateData.setMixByName("jump", "running", 0.4);

        _pixie.state.setAnimationByName("running", true);

        _stage.addChild(_pixie);
        
        _stage.click = _stageOnClick;
    }

    private function _stageOnClick():Void {
        _pixie.state.setAnimationByName("jump", false);
        _pixie.state.addAnimationByName("running", true);
    }

    private static function main() {
        new Main();
    }
}