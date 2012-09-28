package fr.webravenz.flee.game.entities;
import fr.webravenz.engine.display.Entity;
import fr.webravenz.engine.Engine;
import fr.webravenz.flee.config.Sizing;
import fr.webravenz.flee.game.controls.Controls;
import fr.webravenz.flee.Utils;
import nme.Assets;
import nme.display.Bitmap;
import nme.geom.Point;

/**
 * ...
 * @author Webravenz
 */

class Ship extends Entity
{
	
	private var _acceleration:Float;
	private var _accelerationMax:Float;
	private var _gravity:Float;
	private var _limBottom:Int;
	private var _limTop:Int;
	
	public function new(posX:Float, posY:Float) 
	{
		
		super();
		
		_sheetName = 'ship';
		_fps = 15;
		
		x = posX;
		y = posY;
	}
	
	
	private override function _onAddedToStage():Void {
		
		super._onAddedToStage();
		
		_acceleration = 0;
		_accelerationMax = 10 * Engine.scale;
		_gravity = Engine.scale / 3;
		
		_limBottom = Math.round(Engine.screenHeight * 0.94);
		_limTop = Math.round(Engine.screenHeight * 0.1);
		
		_sheetLayer.view.x = -20;
		_sheetLayer.view.y = -10;
		
		_collideGroup = 1;
		setHitArea( -30, -30, 60, 60);
		
	}
	
	private override function _update():Void {
		
		if(Controls.isPressed()) {
			_acceleration -= _gravity;
			if (_acceleration > 0) _setAnim('up', false);
			else                   _setAnim('gaz');
		} else {
			_acceleration += _gravity;
			_setAnim('down', false);
		}
		
		_acceleration = Utils.limite(_acceleration, -_accelerationMax, _accelerationMax);
		
		y += _acceleration;
		
		y = Utils.limite(y, _limTop, _limBottom);
		
		super._update();
		
	}
	
	// collide with obstacle
	private override function _checkCollisions():Void
	{
		layer.removeEntity(this);
	}
	
}