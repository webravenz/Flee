package fr.webravenz.flee.game;

import com.haxepunk.Engine;
import com.haxepunk.HXP;

class Game extends Engine
{

	public static inline var kFrameRate:Int = 30;
	public static inline var kClearColor:Int = 0x333333;

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
		HXP.world = new GameWorld();
	}

}