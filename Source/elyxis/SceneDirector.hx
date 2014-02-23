package elyxis;
import flash.display.Sprite;

/**
 * ...
 * @author ...
 */
class SceneDirector extends Manager<Scene>
{
	public var game: Game;
	
	private var mCurrentScene: Scene;
	public var currentScene(get, never): Scene;
	
	function get_currentScene() {
		return mCurrentScene;
	}

	public function new(parent: Sprite, ?game: Game) 
	{
		super();
		this.game = game;
		mCurrentScene = null;
		
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
			
			mCurrentScene = items.get(name);
			mCurrentScene.visible = true;
		}
	}
	
}