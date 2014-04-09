package elyxis;
import flash.display.Sprite;
import flash.events.MouseEvent;
import freezedev.EventMap;

/**
 * ...
 * @author ...
 */
class GameObject extends Sprite
{
	public var children: GameObjectManager;
	public var behaviors: BehaviorManager;
	public var data: DataModelManager;
	
	public var events: EventMap;
	
	public function new(?name: String) 
	{
		super();
		
		if (name == null) {
			name = Type.getClassName(GameObject) + '-' + Date.now().getTime();
		}
		this.name = name;
		
		events = new EventMap();
		children = new GameObjectManager();
		behaviors = new BehaviorManager();
		data = new DataModelManager();
		
		this.addEventListener(MouseEvent.CLICK, function(event) { events.trigger('click', event); });
	}
	
	public function addBehavior(behavior: Behavior)
	{
		behavior.gameObject = this;
		behaviors.add(behavior.name, behavior);
	}
	
	public function addGameObject(gameObject: GameObject)
	{
		children.add(gameObject.name, gameObject);
		addChild(gameObject);
	}
	
	public function addData(d: DataModel)
	{
		data.add(d.name, d);
	}
	
	public function broadcast(name: String, eventData: Dynamic)
	{
		for (c in children) {
			c.events.trigger(name, eventData);
		}
		
		for (b in behaviors) {
			b.events.trigger(name, eventData);
		}
		
		for (d in data) {
			d.events.trigger(name, eventData);
		}
	}
	
	// TODO: Reflect if a draw is really needed
	public function draw()
	{
		events.trigger('draw');
		
		for (e in children) {
			e.draw();
		}
	}
	
	public function update(deltaTime: Float)
	{
		events.trigger('update', deltaTime);
		
		for (e in children) {
			e.update(deltaTime);
		}
		
		for (b in behaviors) {
			b.update(deltaTime);
		}
	}
}