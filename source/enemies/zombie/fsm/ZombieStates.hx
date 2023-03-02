package enemies.zombie.fsm;

/**
 * @author 
 */
@:enum
class ZombieStates 
{
	public static var NO_CHANGE(default, never):Int = -1;
	public static var WAIT(default, never):Int =  0;
	public static var CHASE(default, never):Int = 1;
	public static var ATTACK(default, never):Int = 2;
	public static var FALL(default, never):Int = 3;
}