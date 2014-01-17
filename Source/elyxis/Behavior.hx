package elyxis;

import freezedev.EventMap;

/**
 * ...
 * @author ...
 */
class Behavior
{
	public var children: BehaviorManager;
	public var events: EventMap;
	public var name: String;
	
	public function new(?name: String) 
	{
		if (name == null) {
			name = Type.getClassName(GameObject) + '-' + Date.now().getTime();
		}
		this.name = name;
		
		children = new BehaviorManager();
		events = new EventMap();
	}
	
	public function update(doubleTime: Float)
	{
		events.trigger('update', doubleTime);
		
		for (child in children) {
			child.update(doubleTime);
		}
	}
	
}