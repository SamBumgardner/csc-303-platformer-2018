package enemies.zombie.fsm.states;

import enemies.zombie.fsm.ZombieState;
import enemies.zombie.Zombie;
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
			if (zombie.path.active){
				zombie.path.cancel();
			}	
			return 3; // ZombieStates.FALL;
		} else {
			zombie.setWaitPath();
			return 0; // ZombieStates.WAIT;
		}
	}
	
}