package elyxis;
import flash.display.Bitmap;
import flash.display.BitmapData;

/**
 * ...
 * @author ...
 */
class Image extends GameObject
{
	private var bitmap: Bitmap;
	public var bitmapData(get, set): BitmapData;
	
	public function get_bitmapData() {
		return bitmap.bitmapData;
	}
	
	public function set_bitmapData(bd: BitmapData): BitmapData {
		bitmap.bitmapData = bd;
		
		return bitmap.bitmapData;
	}

	public function new(?name: String) 
	{
		super(name);
		bitmap = new Bitmap();
		addChild(bitmap);
	}
	
}