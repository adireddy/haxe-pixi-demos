package pixihx.demos.bitmaptext;

import pixi.renderers.webgl.WebGLRenderer;
import pixi.display.Stage;
import pixi.utils.Detector;
import pixi.loaders.AssetLoader;
import pixi.text.BitmapText;
import js.Browser;

class Main {

	var _loader:AssetLoader;
	var _renderer:WebGLRenderer;
	var _stage:Stage;

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

	function animate() {
		Browser.window.requestAnimationFrame(cast animate);
		_renderer.render(_stage);
	}

	function onAssetsLoaded() {
		var bitmapFontText = new BitmapText("bitmap fonts are\n now supported!", {font: "35px Desyrel", align: "right"});
		bitmapFontText.position.x = 620 - bitmapFontText.width - 20;
		bitmapFontText.position.y = 20;
		_stage.addChild(bitmapFontText);
	}

	static function main() {
		new Main();
	}
}