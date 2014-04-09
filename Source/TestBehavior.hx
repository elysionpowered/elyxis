package ;
import elyxis.Behavior;

/**
 * ...
 * @author Johannes Stein
 */
class TestBehavior extends Behavior
{

	public function new() 
	{
		super();
	}
	
	public override function update(dt)
	{
		super.update(dt);
		
		gameObject.x = gameObject.x + dt * 10;
	}
}