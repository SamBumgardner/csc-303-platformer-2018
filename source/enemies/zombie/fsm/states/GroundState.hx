package enemies.zombie.fsm.states;

import flixel.FlxObject;
import enemies.zombie.fsm.ZombieState;
import enemies.zombie.Zombie;

/**
 * ...
 * @author Miranda McCoy
 * 
 * This is checking if the zombie is on the ground or not.
 */

class GroundState extends ZombieState
{

	public function new(zombie:Zombie) 
	{
		super(zombie);
	}
	
	override public function update():Int
	{
		if (!this.zombie.isTouching(FlxObject.DOWN)){
			return ZombieStates.FALL;
		}
		
		return ZombieStates.WAIT;
	}
}