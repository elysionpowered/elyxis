package ;
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
		
		var image = new Image();
		image.bitmapData = Assets.getBitmapData ("assets/openfl.png");
		
		addChild (image);
		
		//image.x = (stage.stageWidth - image.width) / 2;
		//image.y = (stage.stageHeight - image.height) / 2;
	}
	
}