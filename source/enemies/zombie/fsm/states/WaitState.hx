package enemies.zombie.fsm.states;

import source.enemies.zombie.Zombie;
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
		if (zombie.isChasingDistanceFromPlayer()){
			return 1;// ZombieStates.CHASE;
		}
		
		if (!zombie.path.active){ // Should ideally test if the zombie is on the ground too, but that doesn't work
			zombie.path.start();
		}
		
		return 0;// ZombieStates.WAIT;
	}
	
}