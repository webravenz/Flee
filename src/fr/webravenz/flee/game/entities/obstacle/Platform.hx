package fr.webravenz.flee.game.entities.obstacle;
import fr.webravenz.engine.display.Entity;
import fr.webravenz.engine.Engine;
import fr.webravenz.flee.game.data.GameVars;

/**
 * ...
 * @author Webravenz
 */

class Platform extends Entity
{
	
	private var _type:Int;
	
	public function new(posX:Float, posY:Float, scale:Float, type:Int) 
	{
		super();
		
		x = posX;
		scaleX *= scale;
		scaleY *= scale;
		_type = type;
		
		_showImage('gfx/entities/plateforme/'+_type+'.png');
		
		y = posY;
		
		_collideGroup = 2;
		
		switch(_type) {
			case 1:
				setHitArea(10, 10, 210, 60);
			case 2:
				setHitArea(20, 10, 420, 80);
			case 3:
				setHitArea(60, 20, 660, 390);
			case 4:
				setHitArea(125, 0, 590, 340);
		}
	}
	
	private override function _update():Void {
		
		x -= GameVars.SCROLL_SPEED;
		
		super._update();
		
		if (x < -width) layer.removeEntity(this);
		
	}
	
}