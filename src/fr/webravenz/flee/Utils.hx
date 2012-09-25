package fr.webravenz.flee;

/**
 * ...
 * @author Webravenz
 */

class Utils 
{
	
	/**
	 * 
	 * generate an array of all integers between from and to
	 * 
	 * @param	from
	 * @param	to
	 * @return array of integers
	 */
	public static function arrayFromTo(from:Int, to:Int):Array<Int> {
		
		var result:Array<Int> = new Array<Int>();
		
		while (from <= to) {
			result.push(from);
			from++;
		}
		
		return result;
		
	}
	
}