package elyxis;

/**
 * ...
 * @author ...
 */
class ViewportBehavior extends Behavior
{

	public function new() 
	{
		super();
	}
	
	public function resize()
	{
		
		
		events.trigger('resize', doubleTime);
		
		for (child in children) {
			child.update(doubleTime);
		}
	}
	
}