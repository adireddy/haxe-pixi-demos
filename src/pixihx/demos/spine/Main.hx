package pixihx.demos.spine;

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

    private var _spineBoy:Spine;

    public function new() {
        _stage = new Stage(0x00FF00);
        _renderer = Detector.autoDetectRenderer(800, 600);
        _renderer.view.style.display = "block";
        Browser.document.body.appendChild(_renderer.view);

        var assetsToLoader:Array<String> = ["assets/spine/data/spineboy.json", "assets/spine/data/spineboySpineData.json"];
    
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
        _spineBoy = new Spine("assets/spine/data/spineboySpineData.json");
        
        _spineBoy.position.x = 400;
        _spineBoy.position.y = 600;
        
        _spineBoy.stateData.setMixByName("walk", "jump", 0.2);
        _spineBoy.stateData.setMixByName("jump", "walk", 0.4);
        
        _spineBoy.state.setAnimationByName("walk", true);
        
        _stage.addChild(_spineBoy);
        
        _stage.click = _stageOnClick;
    }

    private function _stageOnClick():Void {
        _spineBoy.state.setAnimationByName("jump", false);
        _spineBoy.state.addAnimationByName("walk", true);
    }

    private static function main() {
        new Main();
    }
}