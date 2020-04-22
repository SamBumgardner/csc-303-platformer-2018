package states;

import flixel.FlxObject;
import flixel.FlxCamera.FlxCameraFollowStyle;
import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmo3Loader;
import flixel.tile.FlxTilemap;
import player.Player;

/**
 * ...
 * @author Samuel Bumgardner
 */
class Ogmo3LoadedState extends FlxState
{
	private var player:Player;
	private var levelLoader:FlxOgmo3Loader;
	private var map:FlxTilemap;
	
	override public function create():Void {
		instantiateEntities();
		setUpLevel();
		addAll();
		
		FlxG.camera.follow(player, FlxCameraFollowStyle.PLATFORMER, 1);
		FlxG.camera.zoom = 2;
		
		FlxG.sound.playMusic(AssetPaths.rightHandMate_v8__wav);
		
		super.create();
	}
	
	/**
	 * Helper function that generates all starting objects.
	 */
	private function instantiateEntities():Void {
		player = new Player();
	}
	
	/**
	 * 
	 */
	private function setUpLevel():Void {
		levelLoader = new FlxOgmo3Loader(AssetPaths.csc_303_platformer_2018__ogmo, 
			AssetPaths.ogmo3_brickland__json);
		
		FlxG.worldBounds.setSize(
			levelLoader.getLevelValue("width"), levelLoader.getLevelValue("height"));
		
		map = levelLoader.loadTilemap(AssetPaths.Brick__png, "terrain");
		map.setTileProperties(1, FlxObject.ANY);
		
		levelLoader.loadEntities(placeEntities, "entities");
	}
	
	private function placeEntities(entityData:EntityData):Void {
		if (entityData.name == "Player") {
			player.x = entityData.x - entityData.originX + Player.OFFSET_X;
			player.y = entityData.y - entityData.originY + Player.OFFSET_Y;
		}
	}
	
	/**
	 * Helper function that adds all starting objects to the Scene.
	 */
	private function addAll():Void {
		add(player);
		add(map);
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		FlxG.collide(player, map);
		
		if (FlxG.keys.justPressed.N) {
			FlxG.switchState(new PlayState());
		}
	}
}