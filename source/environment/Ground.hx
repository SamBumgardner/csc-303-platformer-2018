package environment;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * Simple sprite used for ground and / or walls for the PlatformerHero.
 * @author Samuel Bumgardner
 */
class Ground extends FlxSprite
{
	public static var LENGTH(default, never):Int = 32;
	public static var HEIGHT(default, never):Int = 32;

	public function new(?X:Float=0, ?Y:Float=0,?c=FlxColor.GRAY) {
		super(X, Y);
		makeGraphic(LENGTH, HEIGHT, c);
		this.immovable = true;
	}
	
}