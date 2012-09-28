package fr.webravenz.flee.game.entities;
import fr.webravenz.engine.Engine;
import fr.webravenz.flee.config.Sizing;
import fr.webravenz.flee.game.data.GameVars;
import fr.webravenz.engine.display.Entity;
import nme.Assets;
import nme.display.Bitmap;

/**
 * ...
 * @author Webravenz
 */

class Galerie extends Entity
{
	
	public function new(top:Bool)
	{
		
		super();
		
		y = top ? 0 : Engine.screenHeight - Math.floor(40 * Engine.scale);
		
		var folder = top ? 'top' : 'bottom';
		
		_showImage('gfx/entities/galerie/' + folder + '/1.png');
		
	}
	
	private override function _update():Void {
		
		x -= GameVars.SCROLL_SPEED;
		
		super._update();
		
		if (x < -width) layer.removeEntity(this);
		
	}
	
}