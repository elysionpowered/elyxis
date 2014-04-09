package ;
import elyxis.GameObject;
import elyxis.Image;
import openfl.Assets;

/**
 * ...
 * @author Johannes Stein
 */
class TestGameObject extends GameObject
{

	public function new() 
	{
		super();
		
		var image = new Image();
		image.bitmapData = Assets.getBitmapData ("assets/openfl.png");
		
		addGameObject(image);
		
		addBehavior(new TestBehavior());
	}
	
}