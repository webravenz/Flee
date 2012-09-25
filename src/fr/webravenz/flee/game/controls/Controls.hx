package fr.webravenz.flee.game.controls;
import fr.webravenz.flee.game.config.Sizing;
import nme.display.Stage;
import nme.events.MouseEvent;
import nme.events.TouchEvent;
import nme.geom.Point;

/**
 * ...
 * @author Webravenz
 */

class Controls 
{
	
	private static var _position:Point;
	private static var _stage:Stage;
	
	private static var _fingerNum:Int = -1;
	
	public static function start(stage:Stage):Void {
		
		_stage = stage;
		
		_position = new Point(-1, -1);
		
		#if flash
		_stage.addEventListener(MouseEvent.MOUSE_DOWN, _onMouseDown);
		_stage.addEventListener(MouseEvent.MOUSE_UP, _onMouseUp);
		#else
		_stage.addEventListener(TouchEvent.TOUCH_BEGIN, _onTouchStart);
		_stage.addEventListener(TouchEvent.TOUCH_END, _onTouchEnd);
		#end
		
	}
	
	public static function stop():Void {
		
		#if flash
		_stage.removeEventListener(MouseEvent.MOUSE_DOWN, _onMouseDown);
		_stage.removeEventListener(MouseEvent.MOUSE_UP, _onMouseUp);
		_stage.removeEventListener(MouseEvent.MOUSE_MOVE, _onMouseMove);
		#else
		_stage.removeEventListener(TouchEvent.TOUCH_BEGIN, _onTouchStart);
		_stage.removeEventListener(TouchEvent.TOUCH_END, _onTouchEnd);
		_stage.removeEventListener(TouchEvent.TOUCH_MOVE, _onTouchMove);
		#end
		
	}
	
	// flash functions
	
	private static function _onMouseDown(e:MouseEvent) {
		
		_updatePos(e.stageX, e.stageY);
		
		_stage.addEventListener(MouseEvent.MOUSE_MOVE, _onMouseMove);
		
	}
	
	private static function _onMouseUp(e:MouseEvent) {
		
		_stage.removeEventListener(MouseEvent.MOUSE_MOVE, _onMouseMove);
		
	}
	
	private static function _onMouseMove(e:MouseEvent) {
		
		_updatePos(e.stageX, e.stageY);
		
	}
	
	// mobile functions
	
	#if !flash
	private static function _onTouchStart(e:TouchEvent):Void 
	{
		
		if(_fingerNum == -1) {
			_fingerNum = e.touchPointID;
			
			_updatePos(e.stageX + 100, e.stageY);
			
			_stage.addEventListener(TouchEvent.TOUCH_MOVE, _onTouchMove);
		}
		
	}
	
	private static function _onTouchEnd(e:TouchEvent):Void {
		
		if (e.touchPointID == _fingerNum) {
			_fingerNum = -1;
			_stage.removeEventListener(TouchEvent.TOUCH_MOVE, _onTouchMove);
		}
		
	}
	
	private static function _onTouchMove(e:TouchEvent):Void 
	{
		
		if(e.touchPointID == _fingerNum) {
			_updatePos(e.stageX + 100, e.stageY);
		}
		
	}
	#end
	
	// global functions
	
	public static function _updatePos(x:Float, y:Float):Void {
		
		_position.x = Math.floor(x / Sizing.scale);
		_position.y = Math.floor(y / Sizing.scale);
		
	}
	
	// getters
	
	public static function getPosition():Point {
		
		return _position;
		
	}
	
}