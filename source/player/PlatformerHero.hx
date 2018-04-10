package player;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * Hero that moves like a typical 2-D platformer character.
 * @author Samuel Bumgardner
 */
class PlatformerHero extends Hero
{

	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		this.acceleration.y = 980;
	}
	
	
	override public function update(elapsed:Float):Void
	{
		if (FlxG.keys.pressed.LEFT){
			this.x += -10;
		}
		if (FlxG.keys.pressed.RIGHT){
			this.x += 10;
		}
		if (FlxG.keys.pressed.Z){
			this.velocity.y = -500;
		}
		
		super.update(elapsed);
	}
}