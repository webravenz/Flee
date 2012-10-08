package fr.webravenz.flee.game.entities.obstacle;
import fr.webravenz.engine.display.Entity;
import fr.webravenz.engine.Engine;
import fr.webravenz.flee.game.data.GameVars;

/**
 * ...
 * @author Webravenz
 */

class Stalacmite extends Entity
{
	
	public function new(posX:Float, posY:Float, scale:Float) 
	{
		super();
		
		scale = Math.round(scale * 10) / 10;
		
		x = posX;
		scaleX *= scale;
		scaleY *= scale;
		
		_showImage('gfx/entities/stalacmite/1.png');
		
		y = posY - height;
		
		_collideGroup = 2;
		setHitArea(130, 20, 50, 550);
	}
	
	private override function _update():Void {
		
		x -= GameVars.SCROLL_SPEED;
		
		super._update();
		
		if (x < -width) layer.removeEntity(this);
		
	}
	
}