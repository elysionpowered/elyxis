package;

import elyxis.Game;


class Main extends Game {
	
	
	public function new () {
		
		super ();
		
		director.add('testscene', new TestScene());
		director.show('testscene');
	}
	
	
}