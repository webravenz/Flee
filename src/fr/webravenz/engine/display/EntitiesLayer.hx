package fr.webravenz.engine.display;
import fr.webravenz.engine.events.EntityEvent;

/**
 * ...
 * @author Webravenz
 */

class EntitiesLayer extends ASprite
{
	
	private var _entities:Array<Entity>;
	private var _entitiesToDelete:Array<Entity>;

	public function new() 
	{
		
		super();
		
		_entities = new Array<Entity>();
		_entitiesToDelete = new Array<Entity>();
		
	}
	
	public function update():Void {
		
		for (entityDel in _entitiesToDelete) {
			
			entityDel.removed();
			_entities.remove(entityDel);
			if(contains(entityDel)) removeChild(entityDel);
			entityDel = null;
			
		}
		
		_entitiesToDelete = new Array<Entity>();
		
		for (entity in _entities) {
			
			if(entity != null) {
			
				entity.update();
				
				if(entity.getCollideGroup() == 1) {
					_checkCollisions(entity);
					
					entity.checkCollisions();
				}
			
			}
			
		}
		
	}
	
	// ajout d'une entite dans le calque
	public function addEntity(entity:Entity):Void
	{
		
		addChild(entity);
		entity.layer = this;
		
		_entities.push(entity);
		
	}
	
	// suppression d'une entite
	public function removeEntity(entity:Entity):Void 
	{
		
		_entitiesToDelete.push(entity);
		
	}
	
	// verif des collisions sur une entite
	private function _checkCollisions(entity:Entity):Void {
		
		if (entity.getCollideGroup() != 0) {
			
			entity.collides = new Array<Entity>();
			
			// verif sur toutes les entites, qui ne sont pas du meme groupe et qui n'ont pas encore été testées
			for (entityCheck in _entities) {
				
				if (entityCheck.getCollideGroup() != 0 && entity.getCollideGroup() != entityCheck.getCollideGroup()) {
					
					if (entity.getArea().intersects(entityCheck.getArea())) {
						entity.collides.push(entityCheck);
					}
					
				}
				
			}
		}
		
	}
	
}