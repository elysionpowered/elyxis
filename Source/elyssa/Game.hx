package elyssa;
import flash.display.Sprite;

/**
 * ...
 * @author ...
 */
class Game extends Sprite
{
	public var director: SceneDirector;
	
	public function new() 
	{
		super();
		
		director = new SceneDirector(this);
	}
	
}