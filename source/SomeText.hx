package source;

/**
 * ...
 * @author Joshua Ellis
 */

import flixel.text.FlxText;
import flixel.util.FlxColor;
import Std.int;
import flixel.math.FlxRandom;
import flixel.FlxG;

class SomeText extends FlxText
{

	public function new(x:Float, y:Float, width:Float
	,txt:String,font:String,fontSize:Int,color:Int) 
	{
		
		var rng:FlxRandom = new FlxRandom();
		
		super(x, y, width, txt, 1);
		super.setFormat(font, fontSize, color);
		
		this.velocity.x = rng.int( -50, 50);
		this.velocity.y = rng.int( -50, 50);
		this.moves = true;
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
		
		super.update(elapsed);
	}
}