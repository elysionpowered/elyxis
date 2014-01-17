package elyxis;

import freezedev.EventMap;

/**
 * ...
 * @author ...
 */
class Manager<T>
{
	private var items: Map<String, T>;
	public var events: EventMap;
	
	public function new()
	{
		events = new EventMap();
		
		items = new Map<String, T>();
	}
	
	public function add(name: String, item: T)
	{
		if (!exists(name)) {	
			items.set(name, item);
			
			events.trigger('add', {
				name: name,
				value: item
			});
		}
	}
	
	public function remove(name: String)
	{
		if (exists(name)) {		
			items.remove(name);
			
			events.trigger('remove', name);
		}
	}
	
	public function iterator(): Iterator<T>
	{
		return items.iterator();
	}
	
	public function exists(name: String)
	{
		return items.exists(name);
	}
}