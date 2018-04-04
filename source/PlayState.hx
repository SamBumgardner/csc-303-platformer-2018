package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	override public function create():Void
	{
		super.create();
		var helloText = new flixel.text.FlxText(150, 200, 0, "hello world", 50);
		helloText.color = FlxColor.RED;
		add(helloText);
		
		var hero = new Hero(100, 100);
		var hero2 = new Hero(500, 100);
		var hero3 = new Hero(100, 500);
		var hero4 = new Hero(500, 500);
		add(hero);
		add(hero2);
		add(hero3);
		add(hero4);
		
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
