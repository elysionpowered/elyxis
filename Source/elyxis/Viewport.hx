package elyxis;
import flash.display.Sprite;

/**
 * ...
 * @author ...
 */
class Viewport extends Sprite
{
	private var behaviors: BehaviorManager;
	
	public function new() 
	{
		super();
		
		behaviors = new BehaviorManager();
	}
	
	public function addBehavior(behavior: Behavior)
	{
		
	}
	
}