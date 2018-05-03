package source.enemies.zombie;

import enemies.zombie.fsm.State;
import enemies.zombie.fsm.states.WaitState;
import enemies.zombie.fsm.states.AttackState;
import enemies.zombie.fsm.states.ChaseState;
import enemies.zombie.fsm.states.FallState;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import haxe.ds.Vector;
import enemies.zombie.fsm.ZombieStates;

/**
 * ...
 * @author 
 */
class Zombie extends FlxSprite
{
	public static var HEIGHT(default, never):Int = 20;
	public static var LENGTH(default, never):Int = 20;
	
	public static var GRAVITY(default, never):Float = 400;
	public static var MAX_Y_SPEED(default, never):Float = 300;
	public static var MAX_WALK_SPEED(default, never):Float = 75;
	public static var MAX_RUN_SPEED(default, never):Float = 100;
	
	private var state:State;
	private var states:Vector<State> = new Vector<State>(4);

	public function new(?X:Float=0, ?Y:Float=0)  
	{
		super(X, Y);
		
		acceleration.y = 400;
		
		maxVelocity.set(MAX_WALK_SPEED, MAX_Y_SPEED);
		
		makeGraphic(20, 20, FlxColor.GREEN, false);
		
		states[ZombieStates.WAIT] = new WaitState(this);
		states[ZombieStates.CHASE] = new ChaseState(this);
		states[ZombieStates.ATTACK] = new AttackState(this);
		states[ZombieStates.FALL] = new FallState(this);
	}
	
	override public function update(elapsed:Float){
		
		super.update(elapsed);
	}
}