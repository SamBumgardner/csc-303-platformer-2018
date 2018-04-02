package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.math.FlxRandom;

/**
 * ...
 * @author Ted Green
 * Assignment 2-2
 * 
1. Create a new file in the project's source directory called Hero.hx.
2. In that file, create the Hero class that extends FlxSprite.
3. Inside the Hero's new() function, use makeGraphic() to give it a simple rectangle graphic.
4. Inside the Hero's update() function, set the Hero objects color to a value determined by screen position.
		Hint: Look at the PlayState class for an example of overriding and update function.
6. Make Hero-class objects move automatically each frame.
7. Randomize the direction of its movement when it is created.
8. Add multiple Hero objects to the PlayState.
 */
class Hero extends FlxSprite
{

	public function create()
	{
		var count = 0;
		var RNG:FlxRandom = new FlxRandom();
		
		while (count <= 5){
			
			var randX:Float = RNG.float(0, 640);
			var randY:Float = RNG.float(0, 480);
			
			var speedX:Float = RNG.float( -5, 5);
			var speedY:Float = RNG.float( -5, 5);
			
			var hero:FlxSprite = new FlxSprite(randX, randY);	
			hero.makeGraphic(100, 100, FlxColor.CYAN);
			
			hero.velocity(speedX, speedY);
			
			add(Hero);
			count++;
		}
		
		
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
}