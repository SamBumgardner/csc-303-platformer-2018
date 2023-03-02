package enemies.zombie.fsm.states;

import enemies.zombie.Zombie;
import enemies.zombie.fsm.ZombieState;
import flixel.FlxObject;
import flixel.util.FlxColor;
import flixel.math.FlxMath;
import states.PlayState;


/**
 * ...
 * @author Miranda McCoy
 * 
 * This is the state for the zombie "waiting" on something the happen.
 * This is the walking back and forth.
 */
class WaitState extends GroundState
{	
	public function new(zombie:Zombie) 
	{
		super(zombie);
	}
	
	public override function update():Int{
		if (!zombie.path.active){
			zombie.path.start();
		}
		
		if (!zombie.isTouching(FlxObject.DOWN)){
			return 3; // ZombieStates.FALL;
		}
		
		if (zombie.isChasingDistanceFromPlayer()){
			return 1;// ZombieStates.CHASE;
		}
		
		return 0;// ZombieStates.WAIT;
	}
	
}