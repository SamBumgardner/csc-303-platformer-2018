package player;

using flixel.FlxG;
using flixel.util.FlxColor;
using flixel.math.FlxRandom;
using flixel.math.FlxMath;
using flixel.util.FlxCollision;
using flixel.FlxObject;

/**
 * Hero that moves like a character in a classic, top-down Legend of Zelda game.
 * @author Samuel Bumgardner
 */
class TopDownHero extends Hero
{
	var speed:Float = 200;
	var acc:Float = 400;
	var colorNum:Int = 0;
	var gravityAcc = 40;

	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		this.maxVelocity.x = speed;
		this.maxVelocity.y = speed;
	}
	
	override public function update(elapsed:Float):Void 
	{
		movement();
		
		var spacePressed = false;
		spacePressed = FlxG.keys.justPressed.SPACE;
		
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
		if (!up && !down && !left && !right){
			this.velocity.x = 0;
			this.acceleration.x = 0;
			
			if(!isTouching(FlxObject.DOWN)){
				// Gravity
				this.acceleration.y = gravityAcc;
			}
		} else if (down && up){
			this.velocity.y = 0;
		} else if (left && right){
			this.velocity.x = 0;
		} else if (up){
			this.acceleration.y = -acc;
		} else if (down){
			this.acceleration.y = acc;
		} else if (left){
			this.acceleration.x = -acc;
		} else if (right){
			this.acceleration.x = acc;
		}
		
		// Continue falling after jumping
		if (FlxG.keys.justReleased.UP){
			this.velocity.y = 0;
		}
	}
	
	
	public function changeColor():Void{
		var colors:Array<FlxColor> = [FlxColor.RED, FlxColor.ORANGE, FlxColor.YELLOW, FlxColor.GREEN, FlxColor.BLUE, FlxColor.PURPLE];

		this.color = colors[colorNum];
		colorNum++;
		
		if (colorNum == colors.length){
			colorNum = 0;
		}
	}
}