package fr.webravenz.flee.game;
import com.haxepunk.World;
import fr.webravenz.flee.game.entities.Joueur;

/**
 * ...
 * @author Webravenz
 */

class GameWorld extends World
{
	
	private var _joueur:Joueur;

	public function new() 
	{
		super();
	}
	
	public override function begin() {
		
		_joueur = new Joueur(200, 200);
		add(_joueur);
		
	}
	
}