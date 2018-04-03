package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSprite.IFlxSprite;
import flixel.FlxState;
import flixel.math.FlxPoint;
import flixel.math.FlxRandom;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import source.Hero;
import source.SomeText;



class PlayState extends FlxState
{
	
	override public function create():Void
	{
		super.create();
		
		var txt:SomeText = new SomeText(350, 250, 150, "Hello World","Arial",40,FlxColor.RED);
		add(txt);
		
		var hero:Hero;
		
		for (i in 0...50){
			hero = new Hero(100, 100);
			add(hero);
		}
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
