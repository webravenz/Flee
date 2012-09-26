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
	
	private var _image:Bitmap;
	
	public function new(top:Bool)
	{
		
		super();
		
		y = top ? 0 : Engine.screenHeight * Engine.scale;
		
		var folder = top ? 'top' : 'bottom';
		
		_image = new Bitmap(Assets.getBitmapData('gfx/entities/galerie/' + folder + '/1.png'));
		_image.smoothing = true;
		addChild(_image);
		
	}
	
	public override function update():Void {
		
		x -= GameVars.SCROLL_SPEED;
		
		super.update();
		
		if (x < -width) layer.removeEntity(this);
		
	}
	
}