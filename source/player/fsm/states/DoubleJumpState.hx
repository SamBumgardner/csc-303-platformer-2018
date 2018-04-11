package player.fsm.states;

import flixel.FlxObject;
import flixel.util.FlxColor;
import player.fsm.PlayerState;

/**
 * ...
 * @author Ted Green
 */
class DoubleJumpState extends PlayerState 
{

	
	public function new(hero:Player) 
	{
		super(hero);
	}
	
	override public function handleInput(input:Input):Int 
	{
		if (this.managedHero.isTouching(FlxObject.DOWN) && managedHero.velocity.y >= 0) {
			return PlayerStates.STAND;
		}
		
		return PlayerStates.NO_CHANGE;
	}
	
	override public function update():Void 
	{
		
	}
	
	override public function transitionIn():Void 
	{
		this.managedHero.color = FlxColor.GREEN;
		this.managedHero.velocity.y = Player.JUMP_VELOCITY + 100;
	}
	
	override public function transitionOut():Void 
	{
		this.managedHero.color = FlxColor.WHITE;
	}
	
}