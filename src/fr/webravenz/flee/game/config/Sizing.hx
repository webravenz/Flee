package fr.webravenz.flee.game.config;

/**
 * ...
 * @author Webravenz
 */

class Sizing 
{

	public static var initialHeight:Int = 800;
	public static var scale:Float;
	
	public static var galerieWidth:Int = 400;
	
	public static function init(ww:Int, wh:Int):Void {
		
		scale = wh / initialHeight;
		
	}
	
}