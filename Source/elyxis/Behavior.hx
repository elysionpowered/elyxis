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
	public var gameObject: GameObject;
	
	public function new(?name: String) 
	{
		if (name == null) {
			name = Type.getClassName(GameObject) + '-' + Date.now().getTime();
		}
		this.name = name;
		
		gameObject = null;
		children = new BehaviorManager();
		events = new EventMap();
	}
	
	public function add(behavior: Behavior)
	{
		behavior.gameObject = gameObject;
		children.add(behavior.name, behavior);
	}
	
	public function update(doubleTime: Float)
	{
		events.trigger('update', doubleTime);
		
		for (child in children) {
			child.update(doubleTime);
		}
	}
	
}