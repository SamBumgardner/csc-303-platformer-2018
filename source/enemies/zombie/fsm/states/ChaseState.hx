package enemies.zombie.fsm.states;

import enemies.zombie.fsm.ZombieState;
import enemies.zombie.Zombie;
import flixel.util.FlxPath;
import states.PlayState;
import flixel.math.FlxPoint;
import flixel.math.FlxMath;

/**
 * ...
 * @author Miranda McCoy
 * 
 * This is the state for the zombie chasing the player after the player has been spotted.
 */
class ChaseState extends ZombieState
{

	public function new(zombie:Zombie) 
	{
		super(zombie);
	}
	
	override public function update():Int 
	{
		zombie.setChasePath();
		zombie.path.start();	
		
		if (!zombie.isChasingDistanceFromPlayer()){
			zombie.setWaitPath();
			return 0; //ZombieStates.Wait;
		}
		
		return 1;//ZombieStates.CHASE;
	}
	
}