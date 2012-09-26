package fr.webravenz.engine;

/**
 * ...
 * @author Webravenz
 */

class Engine 
{
	
	public static var scale:Float = 1;
	public static var screenWidth:Int = 800;
	public static var screenHeight:Int = 600;
	
	public static function setSize(width:Int, height:Int, pscale:Float = 1):Void {
		
		screenWidth = width;
		screenHeight = height;
		scale = pscale;
		
	}
	
}