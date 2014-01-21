package elyxis;

/**
 * ...
 * @author ...
 */
class Scene extends GameObject
{
	public var game: Game;
	public var camera: Camera
	public var guiLayer: Layer;

	public function new() 
	{
		super();
		
		camera = new Camera();
		guiLayer = new Layer();
	}
	
}