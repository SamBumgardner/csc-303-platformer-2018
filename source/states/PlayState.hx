package states;

import environment.Ground;
import flixel.FlxCamera.FlxCameraFollowStyle;
import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import haxe.Constraints.FlatEnum;
import haxe.io.Float32Array;
import player.Player;
import enemies.zombie.Zombie;
import flixel.FlxObject;

class PlayState extends FlxState
{
	private static var GROUND_TILE_COUNT(default, never):Int = 18;
	private static var GROUND_START_X(default, never):Float = 32;
	public static var GROUND_START_Y(default, never):Float = 320;
	
	private static var WALL_TILE_COUNT(default, never):Int = 3;
	private static var WALL_START_X(default, never):Float = 240;
	private static var WALL_START_Y(default, never):Float = 192;
	
	private static var HERO_START_X(default, never):Float = 320;
	private static var HERO_START_Y(default, never):Float = 256;
	
	private static var ZOMBIE_COUNT(default, never):Int = 4;
	private static var ZOMBIE_START_X(default, never):Array<Float> = [HERO_START_X + 50, HERO_START_X + 100, HERO_START_X + 150, HERO_START_X + 200];
	private static var ZOMBIE_START_Y(default, never):Array<Float> = [GROUND_START_Y - 100, GROUND_START_Y -(Zombie.HEIGHT), GROUND_START_Y - (Zombie.HEIGHT), GROUND_START_Y - (Zombie.HEIGHT / 2)];
	
	public static var player:Player;
	private var groundGroup:FlxTypedGroup<Ground>;
	private var zombieGroup:FlxTypedGroup<Zombie>;
	
	override public function create():Void {
		instantiateEntities();
		addEntities();
		
		FlxG.camera.follow(player, FlxCameraFollowStyle.PLATFORMER, 1);
		FlxG.camera.zoom = 2;
		
		FlxG.sound.playMusic(AssetPaths.closeStars_v6__wav);
		
		super.create();
	}
	
	/**
	 * Helper function that generates all starting objects.
	 */
	private function instantiateEntities():Void {
		player = new Player(HERO_START_X, HERO_START_Y);
		
		groundGroup = new FlxTypedGroup<Ground>();
		for (i in 0...GROUND_TILE_COUNT) {
			groundGroup.add(new Ground(GROUND_START_X + Ground.LENGTH * i, GROUND_START_Y));
		}
		for (i in 0...WALL_TILE_COUNT) {
			groundGroup.add(new Ground(WALL_START_X, WALL_START_Y + Ground.HEIGHT * i));
		}
	}
	
	/**
	 * Helper function that adds all starting objects to the Scene.
	 */
	private function addEntities():Void {
		add(player);
		add(groundGroup);
		
		// For some reason, it crashes if I try and add zombies the way you have added ground...
		for (i in 0...ZOMBIE_COUNT){
			add(new Zombie(ZOMBIE_START_X[i], ZOMBIE_START_Y[i], player));
		}
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		FlxG.collide(player, groundGroup);
		FlxG.collide(zombieGroup, groundGroup);
		FlxG.collide(zombieGroup, player);
		
		if (FlxG.keys.justPressed.N) {
			FlxG.switchState(new ArrayLoadedState());
		}
	}
}
