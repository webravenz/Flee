package fr.webravenz.flee.game;
import com.haxepunk.World;
import fr.webravenz.flee.game.entities.Ship;

/**
 * ...
 * @author Webravenz
 */

class GameWorld extends World
{
	
	private var _ship:Ship;

	public function new() 
	{
		super();
	}
	
	public override function begin() {
		
		_ship = new Ship(200, 200);
		add(_ship);
		
	}
	
}