package fr.webravenz.flee.game;
import fr.webravenz.engine.display.EntitiesLayer;
import fr.webravenz.engine.Engine;
import fr.webravenz.flee.game.data.GameVars;
import fr.webravenz.flee.game.data.ObstaclesSequences;
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
	private var _sequenceX:Int;

	public function new(layer:EntitiesLayer) 
	{
		
		_layer = layer;
		
		_sequenceX = Engine.screenWidth;
		
	}
	
	public function update():Void {
		
		_sequenceX -= GameVars.SCROLL_SPEED;
		
		if (_sequenceX < Engine.screenWidth) _newSequence();
		
	}
	
	
	// affiche une nouvelle sequence d'obstacle
	private function _newSequence():Void {
		
		var sequence:Dynamic = ObstaclesSequences.getSequence();
		
		var seqWidth:Int = Math.round(sequence.width * Engine.scale);
		var seqHeight:Int = Engine.screenHeight;
		
		_sequenceX = Engine.screenWidth + seqWidth;
		
		var obstacles:Array<Dynamic> = sequence.obstacles;
		
		var x:Float;
		var y:Float;
		
		for (obstacle in obstacles) {
			
			x = Engine.screenWidth + obstacle.x * seqWidth;
			y = obstacle.y * seqHeight;
			
			switch(obstacle.type) {
				case 'stalactite' :
					_layer.addEntity(new Stalactite(x, y, obstacle.scale));
				case 'stalacmite' :
					_layer.addEntity(new Stalacmite(x, y, obstacle.scale));
			}
		}
		
	}
	
}