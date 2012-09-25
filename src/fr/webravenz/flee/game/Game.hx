package fr.webravenz.flee.game;

import com.haxepunk.Engine;
import com.haxepunk.HXP;
import fr.webravenz.flee.game.config.Sizing;
import fr.webravenz.flee.game.controls.Controls;

class Game extends Engine
{

	public static inline var kFrameRate:Int = 30;
	public static inline var kClearColor:Int = 0xffc038;

	public function new(width, height)
	{
		super(width, height, kFrameRate, false);
	}

	override public function init()
	{
#if debug
	#if flash
		if (flash.system.Capabilities.isDebugger)
	#end
		{
			HXP.console.enable();
		}
#end
		HXP.screen.color = kClearColor;
		HXP.screen.scale = 1;
		HXP.screen.smoothing = true;
		HXP.world = new GameWorld();
		
		Controls.start(stage);
		
	}

}