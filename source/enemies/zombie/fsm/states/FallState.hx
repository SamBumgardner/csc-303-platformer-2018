package enemies.zombie.fsm.states;

import enemies.zombie.fsm.ZombieState;
import source.enemies.zombie.Zombie;
import flixel.FlxObject;
import flixel.util.FlxColor;

/**
 * ...
 * @author Miranda McCoy
 * 
 * This is the state for the zombie falling while it is not on the ground.
 */
class FallState extends ZombieState
{

	public function new(zombie:Zombie) 
	{
		super(zombie);
	}
	
	override public function update():Int 
	{
		if (!zombie.isTouching(FlxObject.DOWN)){
			trace("no change");
			return ZombieStates.NO_CHANGE;
		} else {
			trace("wait");
			return ZombieStates.WAIT;
		}
		
		return ZombieStates.NO_CHANGE;
	}
	
}