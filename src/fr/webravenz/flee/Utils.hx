package fr.webravenz.flee;

/**
 * ...
 * @author Webravenz
 */

class Utils 
{

	public static function limite(number:Float, min:Float, max:Float):Float {
		
		if (number < min) return min;
		if (number > max) return max;
		
		return number;
		
	}
	
	public static function rand(min:Float, max:Float):Float {
		
		return Math.random() * (max - min) + min;
		
	}
	
}