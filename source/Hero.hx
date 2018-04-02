package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import flixel.math.FlxRandom;

class Hero extends FlxSprite
{
	public function create()
	{
		super.create();
		
		var count = 0;
		var RNG:FlxRandom = new FlxRandom();
		
		while (count <= 5){
			
			var randX:Float = RNG.float(0, 630);
			var randY:Float = RNG.float(0, 480);
			
			var speedX:Float = RNG.float( -5, 5);
			var speedY:Float = RNG.float( -5, 5);
			
			var hero:FlxSprite = new FlxSprite(randX, randY);	
			hero.makeGraphic(100, 100, FlxColor.CYAN);
			
			hero.velocity(speedX, speedY);
			
			add(hero);
			count++;
		}
		
		
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
}