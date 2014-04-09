package ;
import elyxis.GameObject;
import elyxis.Scene;
import elyxis.Image;
import openfl.Assets;

/**
 * ...
 * @author ...
 */
class TestScene extends Scene
{

	public function new() 
	{
		super();
		
		var myThing = new TestGameObject();
		
		addGameObject(myThing);
		
		//image.x = (stage.stageWidth - image.width) / 2;
		//image.y = (stage.stageHeight - image.height) / 2;
	}
	
}