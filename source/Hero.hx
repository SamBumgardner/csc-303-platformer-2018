package source;

/**
 * ...
 * @author Joshua Ellis
 */

import flixel.FlxSprite;
import flixel.util.FlxColor;
import Std.int;
import flixel.math.FlxRandom;
import flixel.FlxG;

class Hero extends FlxSprite
{

	public function new(x:Float,y:Float) 
	{
		super(x, y);
		
		var rng:FlxRandom = new FlxRandom();
		
		this.velocity.x = rng.int( -50, 50);
		this.velocity.y = rng.int( -50, 50);
		
		super.makeGraphic(10, 10);
	}
	
	override public function update(elapsed:Float):Void
	{
		if (this.x > 800) this.x = 0;
		if (this.x < 0) this.x = 800;
		if (this.y > 600) this.y = 0;
		if (this.y < 0) this.y = 600;
		
		if (FlxG.keys.pressed.DOWN){
			this.velocity.y += 5;
		}
		if (FlxG.keys.pressed.UP){
			this.velocity.y -= 5;
		}
		if (FlxG.keys.pressed.RIGHT){
			this.velocity.x += 5;
		}
		if (FlxG.keys.pressed.LEFT){
			this.velocity.x -= 5;
		}
		
		this.color = 0xffffff & (((int(this.y)%255) << 8 )+int(this.x)%255);
		super.update(elapsed);
	}
}