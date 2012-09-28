package fr.webravenz.flee.game.controls;
import fr.webravenz.flee.config.Sizing;
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
	
	private static var _stage:Stage;
	
	private static var _pressed:Bool = false;
	
	public static function start(stage:Stage):Void {
		
		_stage = stage;
		
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
		#else
		_stage.removeEventListener(TouchEvent.TOUCH_BEGIN, _onTouchStart);
		_stage.removeEventListener(TouchEvent.TOUCH_END, _onTouchEnd);
		#end
		
	}
	
	// flash functions
	
	private static function _onMouseDown(e:MouseEvent) {
		
		_pressed = true;
		
	}
	
	private static function _onMouseUp(e:MouseEvent) {
		
		_pressed = false;
		
	}
	
	// mobile functions
	
	#if !flash
	private static function _onTouchStart(e:TouchEvent):Void 
	{
		
		_pressed = true;
		
	}
	
	private static function _onTouchEnd(e:TouchEvent):Void {
		
		_pressed = false;
		
	}
	#end
	
	// getters
	
	public static function isPressed():Bool {
		
		return _pressed;
		
	}
	
}