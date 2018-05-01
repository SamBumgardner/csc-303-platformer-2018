package source.enemies.zombie;

import flixel.util.FlxColor;
import flixel.FlxSprite;

/**
 * ...
 * @author 
 */
class Zombie extends FlxSprite
{
	public static var HEIGHT(default, never):Int = 20;
	public static var LENGTH(default, never):Int = 20;
	
	public static var GRAVITY(default, never):Float = 400;
	public static var MAX_Y_SPEED(default, never):Float = 300;
	public static var MAX_WALK_SPEED(default, never):Float = 75;
	public static var MAX_RUN_SPEED(default, never):Float = 100;

	public function new(?X:Float=0, ?Y:Float=0)  
	{
		super(X, Y);
		
		makeGraphic(20, 20, FlxColor.GREEN, false);
		
		acceleration.x += GRAVITY;
		velocity.x = GRAVITY;
		//maxVelocity.set(MAX_WALK_SPEED, MAX_Y_SPEED);
	}
	
	override public function update(elapsed:Float){
		
	}
}