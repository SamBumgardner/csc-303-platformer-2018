package player;

using flixel.FlxG;
using flixel.util.FlxColor;
using flixel.math.FlxRandom;
using flixel.math.FlxMath;

/**
 * Hero that moves like a character in a classic, top-down Legend of Zelda game.
 * @author Samuel Bumgardner
 */
class TopDownHero extends Hero
{
	var speed:Float = 200;

	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
	}
	
	override public function update(elapsed:Float):Void 
	{
		movement();
		
		var spacePressed = false;
		spacePressed = FlxG.keys.pressed.SPACE;
		
		if (spacePressed){
			changeColor();
		}
		
		super.update(elapsed);
	}
	
	public function movement():Void
	{
		var up:Bool = false;
		var down:Bool = false;
		var left:Bool = false;
		var right:Bool = false;
		
		up = FlxG.keys.anyPressed([UP, W]);
		down = FlxG.keys.anyPressed([DOWN, S]);
		left = FlxG.keys.anyPressed([LEFT, A]);
		right = FlxG.keys.anyPressed([RIGHT, D]);
		
		// If no keys pressed
		if (!up && !down && !left && !down){
			this.velocity.x = 0;
			this.velocity.y = 0;
		} else if (down && up){
			this.velocity.y = 0;
		} else if (left && right){
			this.velocity.x = 0;
		} else if (up){
			this.velocity.y = -speed;
		} else if (down){
			this.velocity.y = speed;
		} else if (left){
			this.velocity.x = -speed;
		} else if (right){
			this.velocity.x = speed;
		}
	}
	
	
	public function changeColor():Void{
		var ran:FlxRandom = new FlxRandom();
		
		this.color = ran.color();
	}
}