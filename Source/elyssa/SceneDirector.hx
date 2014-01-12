package elyssa;
import flash.display.Sprite;

/**
 * ...
 * @author ...
 */
class SceneDirector extends Manager<Scene>
{

	public function new(parent: Sprite) 
	{
		super();
		
		events.on('add', function(item) {
			var displayObject = item.value;
			
			parent.addChild(displayObject);
			displayObject.visible = false;
		} );
	}
	
	public function show(name: String)
	{
		if (exists(name)) {
			for (i in items) {
				i.visible = false;
			}
			
			items.get(name).visible = true;
		}
	}
	
}