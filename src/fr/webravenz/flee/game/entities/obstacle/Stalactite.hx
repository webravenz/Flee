package fr.webravenz.flee.game.entities.obstacle;
import fr.webravenz.engine.display.Entity;
import fr.webravenz.flee.game.data.GameVars;

/**
 * ...
 * @author Webravenz
 */

class Stalactite extends Entity
{
	
	public function new(posX:Float, posY:Float, scale:Float) 
	{
		super();
		
		x = posX;
		y = posY;
		scaleX *= scale;
		scaleY *= scale;
		
		_showImage('gfx/entities/stalactite/1.png');
		
		_collideGroup = 2;
		setHitArea(110, 0, 30, 500);
	}
	
	private override function _update():Void {
		
		x -= GameVars.SCROLL_SPEED;
		
		super._update();
		
		if (x < -width) layer.removeEntity(this);
		
	}
	
}