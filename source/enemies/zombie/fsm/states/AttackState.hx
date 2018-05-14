package enemies.zombie.fsm.states;

import enemies.zombie.fsm.ZombieState;
import enemies.zombie.Zombie;

/**
 * ...
 * @author Miranda McCoy
 * 
 * This is the state for the zombie attacking the player when near enough.
 */

class AttackState extends ZombieState
{

	public function new(zombie:Zombie) 
	{
		super(zombie);
	}
	
}