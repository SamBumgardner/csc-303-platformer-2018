package;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.math.FlxRandom;

class Hero extends FlxSprite
 
{
	static var RNG:FlxRandom = new FlxRandom();
	
	private var FloatX:Float = RNG.float(-2, 2);
	private var FloatY:Float = RNG.float(-2, 2);


	public function new(X:Float, Y:Float) 
	{
		super(X, Y);
		
		
		this.makeGraphic(10, 10, FlxColor.BLUE);
		
	}
	
	override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
		if (this.y >= 150)
			this.color = FlxColor.RED;
		if (this.y < 150)
			this.color = FlxColor.BLUE;
			
		this.y += FloatY;
		this.x += FloatX;
		super.update(elapsed);
    }
	
}