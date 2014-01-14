package elyssa;
import flash.display.Sprite;

/**
 * ...
 * @author ...
 */
class SceneDirector extends Manager<Scene>
{
	public var game: Game;

	public function new(parent: Sprite, ?game: Game) 
	{
		super();
		this.game = game;
		
		events.on('add', function(item) {
			var displayObject = item.value;
			
			parent.addChild(displayObject);
			displayObject.visible = false;
			if (this.game != null) {
				item.game = this.game;
			}
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