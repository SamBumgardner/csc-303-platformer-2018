package environment;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

class Wall extends FlxSprite
{
	public static var LENGTH(default, never):Int = 32;
	public static var HEIGHT(default, never):Int = 32;

	public function new(?X:Float=0, ?Y:Float=0, color:FlxColor) {
		super(X, Y);
		makeGraphic(LENGTH, HEIGHT, color);
		immovable = true;
	}
	
}