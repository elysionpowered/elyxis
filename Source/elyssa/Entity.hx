package elyssa;
import flash.display.Sprite;
import freezedev.EventMap;

/**
 * ...
 * @author ...
 */
class Entity extends Sprite
{
	public var children: EntityManager;
	public var components: ComponentManager;
	public var events: EventMap;
	
	public function new(?name: String) 
	{
		super();
		
		if (name == null) {
			name = Type.getClassName(Entity) + '-' + Date.now().getTime();
		}
		this.name = name;
		
		children = new EntityManager();
		components = new ComponentManager();
	}
	
	public function addComponent(component: Component)
	{
		components.add(component.name, component);
	}
	
	public function addEntity(entity: Entity)
	{
		children.add(entity.name, entity);
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
		
		for (c in components) {
			c.update(deltaTime);
		}
	}
}