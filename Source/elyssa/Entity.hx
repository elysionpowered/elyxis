package elyssa;
import flash.display.Sprite;

/**
 * ...
 * @author ...
 */
class Entity extends Sprite
{
	public var children: EntityManager;
	public var components: ComponentManager;
	
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
	
	public function update(deltaTime: Float)
	{
		for (e in children) {
			e.update(deltaTime);
		}
		
		for (c in components) {
			c.update(deltaTime);
		}
	}
}