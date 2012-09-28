package fr.webravenz.flee.game;

import fr.webravenz.engine.data.Sheets;
import fr.webravenz.engine.display.ASprite;
import fr.webravenz.engine.display.EntitiesLayer;
import fr.webravenz.flee.config.Sizing;
import fr.webravenz.flee.game.controls.Controls;
import fr.webravenz.flee.game.data.GameVars;
import fr.webravenz.flee.game.entities.Ship;
import haxe.Timer;
import nme.display.Sprite;
import nme.events.Event;
import fr.webravenz.flee.game.layer.Galeries;
import nme.geom.Rectangle;

class Game extends ASprite
{
	
	private var _galeriesLayer:Galeries;
	private var _frontLayer:EntitiesLayer;
	private var _ship:Ship;
	
	private var _obstaclesGenerator:ObstacleGenerator;
	
	private var _sheetsToLoad:Array<Dynamic>;
	
	private var _debugSprite:Sprite;

	public function new()
	{
		
		_sheetsToLoad = [
			{ folder: 'ship', name: 'ship' },
			{ folder: 'obstacles', name: 'bat' }
		];
		
		super();
	}

	private override function _onAddedToStage():Void {
		
		_loadSheets();
		
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
		
		// init obstacles generation
		_obstaclesGenerator = new ObstacleGenerator(_frontLayer);
		
		_debugSprite = new Sprite();
		addChild(_debugSprite);
		
		// start game loop
		addEventListener(Event.ENTER_FRAME, _update);
		
	}
	
	// load all the sprite sheets needed for the game
	private function _loadSheets() 
	{
		for (sheetInfos in _sheetsToLoad) {
			
			Sheets.loadSheet(sheetInfos.folder, sheetInfos.name);
			
		}
		
	}
	
	private function _update(e:Event):Void 
	{
		
		_obstaclesGenerator.update();
		
		_galeriesLayer.update();
		_frontLayer.update();
		
		/*
		var a:Rectangle = _ship.getArea();
		_debugSprite.graphics.clear();
		_debugSprite.graphics.beginFill(0xff0000, 0.5);
		_debugSprite.graphics.drawRect(a.x, a.y, a.width, a.height);
		_debugSprite.graphics.endFill();
		*/
	}
	
	private override function _onRemovedFromStage():Void {
		
		Controls.stop();
		
		_removeSheets();
		
	}
	
	// remove all the sprite sheets needed for the game
	private function _removeSheets() 
	{
		for (sheetInfos in _sheetsToLoad) {
			
			Sheets.removeSheet(sheetInfos.name);
			
		}
	}

}