package fr.webravenz.engine.display;
import aze.display.SparrowTilesheet;
import aze.display.TileClip;
import aze.display.TileLayer;
import fr.webravenz.engine.data.Sheets;
import fr.webravenz.engine.Engine;
import fr.webravenz.engine.events.EntityEvent;
import nme.display.Sprite;
import nme.geom.Rectangle;

/**
 * ...
 * @author Webravenz
 */

class Entity extends ASprite
{
	
	public var layer:EntitiesLayer;
	
	private var _speedX:Float = 0;
	private var _speedY:Float = 0;
	
	private var _displayed:Bool = false;
	private var _life:Int = 100;
	
	// animation
	private var _fps:Int = 8;
	private var _currentAnim:String = '';
	private var _sheetName:String;
	private var _sheetLayer:TileLayer;
	private var _sheetClip:TileClip;
	
	// ocllisions
	private var _collideGroup:Int = 0;
	public var collides:Array<Entity> = null;
	private var _area:Rectangle;
	
	public function new() 
	{
		super();
		
	}
	
	private override function _onAddedToStage():Void {
		
		scaleX = scaleY = Engine.scale;
		
		if (_sheetName != null) _initClip();
		
		_displayed = true;
		
	}
	
	private override function _onRemovedFromStage():Void {
		
		_displayed = false;
		
	}
	
	private function _initClip():Void {
		
		var sheet:SparrowTilesheet = Sheets.getSheet(_sheetName);
		
		if (sheet != null) {
			
			_sheetLayer = new TileLayer(sheet);
			_sheetClip = new TileClip(_currentAnim, _fps);
			_sheetLayer.addChild(_sheetClip);
			
			addChild(_sheetLayer.view);
			_sheetLayer.view.y = -_sheetClip.height / 2;
			
		}
		
	}
	
	// update call each frame
	public function update():Void {
		
		if (_displayed) {
			_update();
		}
		
	}
	
	private function _update():Void {
		
		x += _speedX;
		y += _speedY;
		
		if(_sheetLayer != null) _sheetLayer.render();
		
	}
	
	// check collisions with other entities
	public function checkCollisions():Void {
		
		if (_collideGroup != 0 && collides != null && collides.length > 0) {
			
			_checkCollisions();
			
		}
		
	}
	
	private function _checkCollisions():Void
	{
		
	}
	
	// remove entity
	private function _remove():Void {
		
		layer.removeEntity(this);
		
	}
	
	// on entity removed
	public function removed():Void {
		
	}
	
	// lose life, if 0 you're dead bastard
	public function hit(power:Int):Void {
		
		_life -= power;
		
		if (_life <= 0) {
			
			_collideGroup = 0;
			_remove();
			
		}
		
	}
	
	// set collide area
	private function setHitArea(ax:Float, ay:Float, aw:Int, ah:Int):Void {
		
		_area = new Rectangle(ax * Engine.scale, ay * Engine.scale, aw * Engine.scale, ah * Engine.scale);
		
	}
	
	// getters
	
	public function getCollideGroup():Int {
		return _collideGroup;
	}
	
	public function getArea():Rectangle {
		return new Rectangle(x + _area.x, y + _area.y, _area.width, _area.height);
	}
	
}