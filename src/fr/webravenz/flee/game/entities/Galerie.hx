package fr.webravenz.flee.game.entities;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import fr.webravenz.flee.game.config.Sizing;
import fr.webravenz.flee.game.data.GameVars;

/**
 * ...
 * @author Webravenz
 */

class Galerie extends Entity
{
	
	private var _image:Image;

	public function new(x:Int, top:Bool)
	{
		
		var y:Int = top ? 0 : Sizing.initialHeight - 100;
		
		var folder = top ? 'top' : 'bottom';
		
		_image = new Image('gfx/entities/galerie/' + folder + '/1.png');
		
		_graphic = _image;
		
		super(x, y);
		
	}
	
	public override function update():Void {
		
		x -= GameVars.SCROLL_SPEED;
		
		super.update();
		
		if (x < -Sizing.galerieWidth) world.remove(this);
		
	}
	
}