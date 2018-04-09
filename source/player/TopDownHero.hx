package player;

import flixel.FlxG;

/**
 * Hero that moves like a character in a classic, top-down Legend of Zelda game.
 * @author Samuel Bumgardner
 */
class TopDownHero extends Hero
{

	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
	}
	
	override public function update(elapse:Float):Void
	{
		if (FlxG.keys.anyPressed([UP, W])){
		this.y += -1;
		}
		if (FlxG.keys.anyPressed([DOWN, S])){
		this.y += 1;
		}
		if (FlxG.keys.anyPressed([RIGHT, D])){
		this.x += 1;
		}
		if (FlxG.keys.anyPressed([LEFT, A])){
		this.x += -1;
		}
	}
}