package elyssa;
import elyssa.types.Size;
import flash.display.Sprite;

/**
 * ...
 * @author ...
 */
class Game extends Sprite
{
	public var director: SceneDirector;
	public var camera: Camera;
	public var screen(get, never): Size;
	
	function get_screen() {
		return new Size(stage.stageWidth, stage.stageHeight);
	}
	
	
	public function new() 
	{
		super();
		
		camera = new Camera();
		this.addChild(camera);
		
		director = new SceneDirector(camera, this);
	}
	
}