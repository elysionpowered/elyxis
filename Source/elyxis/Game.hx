package elyxis;
import elyxis.types.Size;
import flash.display.Sprite;

/**
 * ...
 * @author ...
 */
class Game extends Sprite
{
	public var director: SceneDirector;
	public var viewport: Viewport;
	public var screen(get, never): Size;
	
	function get_screen() {
		return new Size(stage.stageWidth, stage.stageHeight);
	}
	
	
	public function new() 
	{
		super();
		
		camera = new Camera();
		this.addChild(viewport);
		
		director = new SceneDirector(viewport, this);
	}
	
}