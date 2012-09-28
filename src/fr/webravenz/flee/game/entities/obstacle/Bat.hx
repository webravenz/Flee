package fr.webravenz.flee.game.entities.obstacle;
import fr.webravenz.engine.display.Entity;
import fr.webravenz.engine.Engine;
import fr.webravenz.flee.game.data.GameVars;

/**
 * ...
 * @author Webravenz
 */

class Bat extends Entity
{
	
	public function new(posX:Float, posY:Float) 
	{
		super();
		
		x = posX;
		y = posY;
		
		_sheetName = 'bat';
		_fps = 20;
		
		_collideGroup = 2;
		setHitArea(-25, -5, 50, 30);
	}
	
	private override function _update():Void {
		
		x -= GameVars.SCROLL_SPEED;
		
		super._update();
		
		if (x < -width) layer.removeEntity(this);
		
	}
	
}