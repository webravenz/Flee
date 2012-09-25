package fr.webravenz.flee.game.entities;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;
import fr.webravenz.flee.game.config.Sizing;
import fr.webravenz.flee.game.controls.Controls;
import nme.geom.Point;

/**
 * ...
 * @author Webravenz
 */

class Ship extends Entity
{

	private var _sprite:Spritemap;
	
	public function new(x:Float, y:Float) 
	{
		super(x, y);
		
		_sprite = new Spritemap("gfx/entities/ship.png", 123, 104);
		_sprite.add('fly', [0]);
		_sprite.play('fly');
		_sprite.x = -75;
		_sprite.y = -55;
		
		_graphic = _sprite;
		
	}
	
	public override function update():Void {
		
		var pos:Point = Controls.getPosition();
		
		if(pos.x != -1 && pos.y != -1) {
			x = pos.x;
			y = pos.y;
		}
		
		super.update();
		
	}
	
}