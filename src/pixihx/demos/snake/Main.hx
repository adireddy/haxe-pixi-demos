package pixihx.demos.snake;

import pixi.Pixi;
import pixi.display.Sprite;
import pixi.display.Stage;
import pixi.textures.Texture;
import pixi.utils.Detector;
import pixi.core.Point;
import pixi.extras.Rope;
import pixi.display.DisplayObjectContainer;
import js.Browser;

class Main {

    private var _renderer:Dynamic;
    private var _stage:Stage;

    private var _count:Float;
    private var _points:Array<Dynamic>;

	public function new() {
		_stage = new Stage(0x00FF00);
        _renderer = Detector.autoDetectRenderer(Browser.window.innerWidth, Browser.window.innerHeight);
        Browser.document.body.appendChild(_renderer.view);

        _count = 0;
        // build a rope!
        var length = 918 / 20;
        _points = [];
        for (i in 0...20) {
            var segSize = length;
            _points.push(new Point(i * length, 0));
        };

        var strip = new Rope(Texture.fromImage("assets/snake/snake.png"), _points);
        strip.x = -918/2;
        
        var snakeContainer = new DisplayObjectContainer();
        snakeContainer.position.x = Browser.window.innerWidth / 2;
        snakeContainer.position.y = Browser.window.innerHeight / 2;

        snakeContainer.scale.set(Browser.window.innerWidth / 1100);
        _stage.addChild(snakeContainer);

        snakeContainer.addChild(strip);
        
        Browser.window.requestAnimationFrame(cast animate);
	}

	private function animate():Void {
        Browser.window.requestAnimationFrame(cast animate);
        
        _count += 0.1;       

        var length = 918 / 20;
        for (i in 0..._points.length) {
            _points[i].y = Math.sin(i * 0.5  + _count) * 30;
            _points[i].x = i * length + Math.cos(i * 0.3  + _count) * 20;
        };

        _renderer.render(_stage);
    }

	private static function main() {
		new Main();
	}
}