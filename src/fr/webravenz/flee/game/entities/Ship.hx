package fr.webravenz.flee.game.entities;
import fr.webravenz.engine.display.Entity;
import fr.webravenz.flee.config.Sizing;
import fr.webravenz.flee.game.controls.Controls;
import nme.Assets;
import nme.display.Bitmap;
import nme.geom.Point;

/**
 * ...
 * @author Webravenz
 */

class Ship extends Entity
{
	
	public function new(posX:Float, posY:Float) 
	{
		super();
		
		x = posX;
		y = posY;
		
		var image:Bitmap = new Bitmap(Assets.getBitmapData('gfx/entities/ship.png'));
		image.smoothing = true;
		image.x = -80;
		image.y = -55;
		addChild(image);
	}
	
	private override function _update():Void {
		
		var pos:Point = Controls.getPosition();
		
		if(pos.x != -1 && pos.y != -1) {
			x = pos.x;
			y = pos.y;
		}
		
		super._update();
		
	}
	
}