package fr.webravenz.flee.game;
import com.haxepunk.HXP;
import com.haxepunk.World;
import fr.webravenz.flee.game.config.Sizing;
import fr.webravenz.flee.game.data.GameVars;
import fr.webravenz.flee.game.entities.Galerie;
import fr.webravenz.flee.game.entities.Ship;

/**
 * ...
 * @author Webravenz
 */

class GameWorld extends World
{
	
	private var _ship:Ship;
	private var _lastGalerie:Galerie;

	public function new() 
	{
		super();
	}
	
	public override function begin() {
		
		GameVars.init();
		
		// galeries
		var i:Int = 0;
		while ( i <= HXP.width) {
			_addGaleriePart(i);
			
			i += Sizing.galerieWidth;
		}
		
		//ship
		_ship = new Ship(200, 200);
		add(_ship);
		
	}
	
	public override function update():Void {
		
		super.update();
		
		if (_lastGalerie.x < HXP.width - Sizing.galerieWidth) {
			_addGaleriePart(Math.floor(_lastGalerie.x + Sizing.galerieWidth));
		}
		
	}
	
	// ajoute une partie de galerie en haut et en bas de l'écran
	private function _addGaleriePart(x):Void {
		
		_lastGalerie = new Galerie(x, true);
		add(_lastGalerie);
		
	}
	
}