package states;

import environment.Ground;
import environment.Wall;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import player.PlatformerHero;
import player.TopDownHero;
import flixel.FlxG;
import flixel.util.FlxCollision;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	private static var GROUND_TILE_COUNT(default, never):Int = 10;
	private static var GROUND_START_X(default, never):Float = 128;
	private static var GROUND_START_Y(default, never):Float = 320;
	
	private static var TOP_DOWN_HERO_START_X(default, never):Float = 100;
	private static var TOP_DOWN_HERO_START_Y(default, never):Float = 100;
	
	private static var PLATFORMER_HERO_START_X(default, never):Float = 300;
	private static var PLATFORMER_HERO_START_Y(default, never):Float = 200;
	
	private static var ORANGE_WALL_TILE_COUNT:Int = 4;
	private static var ORANGE_WALL_START:Float = 200;
	private static var GREEN_WALL_TILE_COUNT:Int = 4;
	private static var GREEN_WALL_START:Float = 300;
	private static var PURPLE_WALL_TILE_COUNT:Int = 4;
	private static var PURPLE_WALL_START:Float = 400;
	
	
	private var topDownHero:TopDownHero;
	private var platformerHero:PlatformerHero;
	private var groundGroup:FlxTypedGroup<Ground>;
	private var orangeWallGroup:FlxTypedGroup<Wall>;
	private var greenWallGroup:FlxTypedGroup<Wall>;
	private var purpleWallGroup:FlxTypedGroup<Wall>;
	
	override public function create():Void {
		super.create();
		instantiateEntities();
		addEntities();
	}
	
	/**
	 * Helper function that generates all starting objects.
	 */
	private function instantiateEntities():Void {
		topDownHero = new TopDownHero(TOP_DOWN_HERO_START_X, TOP_DOWN_HERO_START_Y);
		platformerHero = new PlatformerHero(PLATFORMER_HERO_START_X, PLATFORMER_HERO_START_Y);
		
		groundGroup = new FlxTypedGroup<Ground>();
		for (i in 0...GROUND_TILE_COUNT) {
			groundGroup.add(new Ground(GROUND_START_X + Ground.LENGTH * i, GROUND_START_Y));
		}
		
		orangeWallGroup = new FlxTypedGroup<Wall>();
		for (i in 1...ORANGE_WALL_TILE_COUNT) {
			orangeWallGroup.add(new Wall(ORANGE_WALL_START, GROUND_START_Y - Wall.HEIGHT * i, FlxColor.ORANGE));
		}
		
		greenWallGroup = new FlxTypedGroup<Wall>();
		for (i in 1...GREEN_WALL_TILE_COUNT) {
			greenWallGroup.add(new Wall(GREEN_WALL_START, GROUND_START_Y - Wall.HEIGHT * i, FlxColor.GREEN));
		}
		
		purpleWallGroup = new FlxTypedGroup<Wall>();
		for (i in 1...PURPLE_WALL_TILE_COUNT) {
			purpleWallGroup.add(new Wall(PURPLE_WALL_START, GROUND_START_Y - Wall.HEIGHT * i, FlxColor.PURPLE));
		}
	}
	
	/**
	 * Helper function that adds all starting objects to the Scene.
	 */
	private function addEntities():Void {
		add(topDownHero);
		add(platformerHero);
		add(groundGroup);
		add(orangeWallGroup);
		add(greenWallGroup);
		add(purpleWallGroup);
	}

	override public function update(elapsed:Float):Void {
		FlxG.collide(topDownHero, groundGroup);
		
		if (FlxG.overlap(topDownHero, orangeWallGroup)){
			if (topDownHero.color != FlxColor.ORANGE){
				FlxG.collide(topDownHero, orangeWallGroup);
			}
		}
		
		if (FlxG.overlap(topDownHero, greenWallGroup)){
			if (topDownHero.color != FlxColor.GREEN){
				FlxG.collide(topDownHero, greenWallGroup);
			}
		}
		
		if (FlxG.overlap(topDownHero, purpleWallGroup)){
			if (topDownHero.color != FlxColor.PURPLE){
				FlxG.collide(topDownHero, purpleWallGroup);
			}
		}
		
		super.update(elapsed);
	}
	
}
