package enemies.zombie.fsm;

import source.enemies.zombie.Zombie;
import enemies.zombie.fsm.State;

/**
 * ...
 * @author Miranda McCoy
 */

class ZombieState implements State
{
	private var facing:Int;
	private var zombie:Zombie;

	public function new(zombie:Zombie) 
	{
		this.zombie = zombie;
	}
	
	public function update():Int { return ZombieStates.NO_CHANGE; }
	
	public function transitionIn():Void {}
	
	public function transitionOut():Void {}
	
}