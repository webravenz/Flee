package fr.webravenz.flee.game;
import fr.webravenz.engine.display.EntitiesLayer;
import fr.webravenz.engine.Engine;
import fr.webravenz.flee.game.entities.obstacle.Bat;
import fr.webravenz.flee.game.entities.obstacle.Stalacmite;
import fr.webravenz.flee.game.entities.obstacle.Stalactite;

/**
 * ...
 * @author Webravenz
 */

class ObstacleGenerator 
{
	
	private var _layer:EntitiesLayer;

	public function new(layer:EntitiesLayer) 
	{
		
		_layer = layer;
		
	}
	
	public function update():Void {
		
		if (Math.random() < 0.01) {
			_layer.addEntity(new Stalactite(Engine.screenWidth, Utils.rand(0.3, 1)));
		}
		
		if (Math.random() < 0.01) {
			_layer.addEntity(new Stalacmite(Engine.screenWidth, Utils.rand(0.3, 1)));
		}
		
		if (Math.random() < 0.01) {
			_layer.addEntity(new Bat(Engine.screenWidth, Utils.rand(50, 700)));
		}
		
	}
	
}