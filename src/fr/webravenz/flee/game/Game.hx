package fr.webravenz.flee.game;

import fr.webravenz.engine.display.ASprite;
import fr.webravenz.engine.display.EntitiesLayer;
import fr.webravenz.flee.config.Sizing;
import fr.webravenz.flee.game.controls.Controls;
import fr.webravenz.flee.game.data.GameVars;
import fr.webravenz.flee.game.entities.Ship;
import nme.events.Event;
import fr.webravenz.flee.game.layer.Galeries;

class Game extends ASprite
{
	
	private var _galeriesLayer:Galeries;
	private var _frontLayer:EntitiesLayer;
	private var _ship:Ship;

	public function new()
	{
		super();
	}

	private override function _onAddedToStage():Void {
		
		Controls.start(stage);
		
		GameVars.init();
		
		// layer for scrolling landscape
		_galeriesLayer = new Galeries();
		addChild(_galeriesLayer);
		
		// layer for ship and obstacles
		_frontLayer = new EntitiesLayer();
		addChild(_frontLayer);
		
		// init ship
		_ship = new Ship(200, 200);
		_frontLayer.addEntity(_ship);
		
		// start game loop
		addEventListener(Event.ENTER_FRAME, _update);
		
	}
	
	private function _update(e:Event):Void 
	{
		
		_galeriesLayer.update();
		_frontLayer.update();
		
	}

}