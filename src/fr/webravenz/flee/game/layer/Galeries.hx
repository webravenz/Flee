package fr.webravenz.flee.game.layer;
import fr.webravenz.engine.display.EntitiesLayer;
import fr.webravenz.engine.Engine;
import fr.webravenz.flee.game.entities.Galerie;

/**
 * ...
 * @author Webravenz
 */

class Galeries extends EntitiesLayer
{
	
	private var _lastTile:Galerie;

	public function new() 
	{
		
		super();
		
		var nextPos:Float = 0;
		
		while (nextPos < Engine.screenWidth) {
			
			createTile(nextPos);
			
			nextPos = _lastTile.x + (_lastTile.width * Engine.scale);
			
		}
		
	}
	
	public override function update():Void {
		
		if (_lastTile != null) {
			
			var tilePos:Float = _lastTile.x + _lastTile.width;
			
			if (tilePos <= Engine.screenWidth) {
				createTile(tilePos);
			}
			
		} else {
			
			createTile(Engine.screenWidth);
			
		}
		
		super.update();
		
	}
	
	private function createTile(pos:Float):Void {
		
		var tile:Galerie = new Galerie(true);
		tile.x = pos;
		addEntity(tile);
		
		_lastTile = tile;
		
	}
	
}