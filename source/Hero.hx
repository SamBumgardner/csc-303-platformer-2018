package;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.math.FlxRandom;

class Hero extends FlxSprite
{
	static var RNG:FlxRandom = new FlxRandom();
		
	private var speedX:Float = RNG.float( -5, 5);
	private var speedY:Float = RNG.float( -5, 5);
	
	public function new(?X:Float=0, ?Y:Float=0)
	{
		super(X, Y);
		this.makeGraphic(10, 10, FlxColor.WHITE);	
	}
	
	override public function update(elapsed:Float):Void
	{
		
		this.x += speedX;
		this.y += speedY;
		
		if (this.x <= 320){
			this.color = FlxColor.RED;
		}
		if (this.x >= 320){
			this.color = FlxColor.BLUE;
		}
		
		super.update(elapsed);
	}
	
}