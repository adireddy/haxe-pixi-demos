package pixihx.demos.bitmaptext;

import pixi.Pixi;
import pixi.display.Stage;
import pixi.utils.Detector;
import pixi.loaders.AssetLoader;
import pixi.text.BitmapText;
import js.Browser;

class Main {

    private var _loader:AssetLoader;
    private var _renderer:Dynamic;
    private var _stage:Stage;

    public function new() {
        _stage = new Stage(0x00FF00);
        _renderer = Detector.autoDetectRenderer(800, 600);
        _renderer.view.style.display = "block";
        Browser.document.body.appendChild(_renderer.view);

        var assetsToLoader:Array<String> = ["assets/fonts/desyrel.xml"];
    
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
        var bitmapFontText = new BitmapText("bitmap fonts are\n now supported!", {font: "35px Desyrel", align: "right"});
        bitmapFontText.position.x = 620 - bitmapFontText.width - 20;
        bitmapFontText.position.y = 20;
        _stage.addChild(bitmapFontText);
    }

    private static function main() {
        new Main();
    }
}