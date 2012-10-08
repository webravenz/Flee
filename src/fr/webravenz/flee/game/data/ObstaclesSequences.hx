package fr.webravenz.flee.game.data;
import haxe.Json;
import nme.Assets;

/**
 * ...
 * @author Webravenz
 */

class ObstaclesSequences 
{
	
	private static var json:Dynamic;

	// load and parse json
	public static function init():Void {
		
		var jsonString:String = Assets.getText('data/obstacles_sequences.json');
		json = Json.parse(jsonString);
		
	}
	
	// get a sequence
	public static function getSequence():Dynamic {
		
		var num:Int = Math.floor(Math.random() * json.sequences.length);
		
		return json.sequences[num];
		
	}
	
}