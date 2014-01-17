package elyxis;
import freezedev.EventMap;

/**
 * ...
 * @author ...
 */
class DataModel
{
	private var data: Map<String, Dynamic>;
	public var events: EventMap;
	public var name: String;

	public function new(?name: String) 
	{
		if (name == null) {
			name = Type.getClassName(GameObject) + '-' + Date.now().getTime();
		}
		this.name = name;
		
		data = new Map<String, Dynamic>();
		events = new EventMap();
	}
	
	public function get(name: String)
	{
		var value = data.get(name);
		
		events.trigger('get', {
			name: name,
			value: value
		});
		return value;
	}
	
	public function set(name: String, value: Dynamic)
	{
		var eventData = {
			name: name,
			value: value
		};
		
		if (this.exists(name)) {
			if (this.get(name) != value) {
				data.set(name, value);
				events.trigger('set', eventData);
			}
		} else {
			data.set(name, value);
			events.trigger('set', eventData);
		}
		
	}
	
	public function exists(name: String)
	{
		return data.exists(name);
	}
	
	public function iterator(): Iterator<Dynamic>
	{
		return data.iterator();
	}
}