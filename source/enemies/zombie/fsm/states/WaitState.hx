package source.enemies.zombie.fsm.states;


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
	
	override public function update(elapsed:Float):Void
	{
		super(elapsed);
	}
	
}