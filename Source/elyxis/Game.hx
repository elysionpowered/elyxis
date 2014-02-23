package elyxis;
import elyxis.types.Size;
import flash.display.Sprite;
import flash.events.Event;
import flash.Lib;

/**
 * ...
 * @author ...
 */
class Game extends Sprite
{
	public var director: SceneDirector;
	public var viewport: Viewport;
	public var screen(get, never): Size;
	private var lastTick: Float;
	
	function get_screen() {
		return new Size(stage.stageWidth, stage.stageHeight);
	}
	
	
	public function new() 
	{
		super();
		
		lastTick = 0;
		
		viewport = new Viewport();
		this.addChild(viewport);
		
		director = new SceneDirector(viewport, this);
		
		this.addEventListener(Event.ENTER_FRAME, function(e) {
			var delta = Lib.getTimer() - lastTick;
			update(delta);
			lastTick = Lib.getTimer();
		});
	}
	
	public function update(dt) {
		if (director.currentScene != null) {
			director.currentScene.update(dt);
		}
	}
	
}