package environment;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * Simple sprite used for ground and / or walls for the PlatformerHero.
 * @author Samuel Bumgardner
 */
class Wall extends Ground
{
	public function new(?X:Float = 0, ?Y:Float = 0, c = FlxColor.RED){
		super(X, Y,FlxColor.WHITE);
		this.color = c;
	}
}