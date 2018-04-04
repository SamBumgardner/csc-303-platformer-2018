package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.math.FlxRandom;


class PlayState extends FlxState
{
	
	private var hero:Hero;
	
	override public function create():Void
	{
		super.create();
		
		var text = new flixel.text.FlxText(0, 0, 0, "Hello World", 64);
		text.screenCenter();
		add(text);
		
		var RNG:FlxRandom = new FlxRandom();
		//var randX:Float = RNG.float(0, 640);
		//var randY:Float = RNG.float(0, 480);
		var randX = 320;
		var randY = 240;
		var count = 0;
		
		while (count <= 30){
			hero = new Hero(randX, randY);
			add(hero);
			count++;
		}
		
	/*	
		var RNG:FlxRandom = new FlxRandom();
	
		var k = 0;
		while (k <= 100) {
			
			var ranX:Float = RNG.float(0, 640);
			var ranY:Float = RNG.float(0, 480);
			var thing:FlxSprite = new FlxSprite(ranX, ranY);	
			add(thing);
			k++;
		}
		
		var thing1:FlxSprite = new FlxSprite(30, 30);
		thing1.makeGraphic(580, 70, FlxColor.CYAN);
		add(thing1);
	*/
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
