package elyssa;

import freezedev.EventMap;

/**
 * ...
 * @author ...
 */
class Component
{
	public var children: ComponentManager;
	public var events: EventMap;
	public var name: String;
	
	public function new(?name: String) 
	{
		if (name == null) {
			name = Type.getClassName(Entity) + '-' + Date.now().getTime();
		}
		this.name = name;
		
		children = new ComponentManager();
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