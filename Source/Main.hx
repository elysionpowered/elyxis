package;


import elyxis.GameObject;
import elyxis.GameObjectManager;
import elyxis.Game;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import openfl.Assets;


class Main extends Game {
	
	
	public function new () {
		
		super ();
		
		var bitmap = new Bitmap (Assets.getBitmapData ("assets/openfl.png"));
		
		addChild (bitmap);
		
		bitmap.x = (stage.stageWidth - bitmap.width) / 2;
		bitmap.y = (stage.stageHeight - bitmap.height) / 2;
		
		var sprite = new GameObject();
		trace(sprite.name);
		
		var eman = new GameObjectManager();
	}
	
	
}