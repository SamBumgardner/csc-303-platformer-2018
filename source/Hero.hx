package;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.math.FlxRandom;

class Hero extends FlxSprite
{
	
	public function new(?X:Float=0, ?Y:Float=0)
	{
		super(X, Y);
		this.makeGraphic(10, 10, FlxColor.GREEN);	
	}
	
	override public function update(elapsed:Float):Void
	{
		var RNG:FlxRandom = new FlxRandom();
		
		var speedX:Float = RNG.float( -5, 5);
		var speedY:Float = RNG.float( -5, 5);
		
		this.x += speedX;
		this.y += speedY;
		
		this.color = x;
		
		super.update(elapsed);
	}
	
}