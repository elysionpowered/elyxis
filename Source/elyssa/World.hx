package elyssa;
import freezedev.EventMap;

/**
 * ...
 * @author ...
 */
class World
{
	public var events: EventMap;
	public var data: Map<String, Dynamic>;

	public function new() 
	{
		events = new EventMap();
	}

}