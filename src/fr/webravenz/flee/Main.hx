package fr.webravenz.flee;

import fr.webravenz.engine.Engine;
import fr.webravenz.flee.config.Sizing;
import fr.webravenz.flee.game.Game;
import nme.display.FPS;
import nme.display.Sprite;
import nme.events.Event;
import nme.Lib;

/**
 * ...
 * @author Webravenz
 */

class Main extends Sprite 
{
	
	private var _game:Game;
	
	public function new() 
	{
		super();
		#if iphone
		Lib.current.stage.addEventListener(Event.RESIZE, init);
		#else
		addEventListener(Event.ADDED_TO_STAGE, init);
		#end
	}

	private function init(e) 
	{
		
		// get window size
		var ww:Int = stage.stageWidth;
		var wh:Int = stage.stageHeight;
			
		if (wh > ww) {
			var t:Int = ww;
			ww = wh;
			wh = t;
		}
		
		// init sizing variables
		Sizing.init(ww, wh);
		
		Engine.setSize(ww, wh, wh / Sizing.initialHeight);
		
		// init game
		_game = new Game();
		addChild(_game);
		
		// debug
		addChild(new FPS(10, 10, 0xFFFFFF));
	}
	
	static public function main() 
	{
		var stage = Lib.current.stage;
		stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
		stage.align = nme.display.StageAlign.TOP_LEFT;
		
		Lib.current.addChild(new Main());
	}
	
}
