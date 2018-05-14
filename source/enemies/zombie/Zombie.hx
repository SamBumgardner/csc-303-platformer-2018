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
import enemies.zombie.fsm.ZombieState;
import flixel.util.FlxPath;
import flixel.math.FlxPoint;
import flixel.FlxG;
import flixel.FlxObject;
import environment.Ground;
import states.PlayState;
import player.Player;
import flixel.math.FlxMath;

/**
 * ...
 * @author Miranda McCoy 
 */
class Zombie extends FlxSprite
{
	public static var HEIGHT(default, never):Int = 20;
	public static var LENGTH(default, never):Int = 20;
	
	public static var GRAVITY(default, never):Float = 400;
	public static var MAX_Y_SPEED(default, never):Float = 300;
	public static var MAX_WALK_SPEED(default, never):Float = 75;
	public static var MAX_RUN_SPEED(default, never):Float = 100;
	
	public var chasingDistance:Int = Zombie.LENGTH + 20;
	public var enemyPlayer:Player;
	
	private var state:State;
	private var states:Array<ZombieState> = new Array<ZombieState>();

	public function new(?X:Float=0, ?Y:Float=0, player:Player) 
	{
		super(X, Y);
		
		acceleration.y = 400;
		enemyPlayer = player;
		
		maxVelocity.set(MAX_WALK_SPEED, MAX_Y_SPEED);
		
		makeGraphic(20, 20, FlxColor.GREEN, false);
		
		states[ZombieStates.WAIT] = new WaitState(this);
		states[ZombieStates.CHASE] = new ChaseState(this);
		states[ZombieStates.ATTACK] = new AttackState(this);
		states[ZombieStates.FALL] = new FallState(this);
		
		state = states[ZombieStates.WAIT];
		
		setWaitPath();
	}
	
	override public function update(elapsed:Float){
		super.update(elapsed);
		
		var newState = state.update();
		
		state = states[newState];
	}
	
	public function setWaitPath():Void{
		this.path = new FlxPath([new FlxPoint((this.getPosition().x + 100), (this.getPosition().y)), new FlxPoint((this.getPosition().x), (this.getPosition().y))]);
		this.path.speed = MAX_WALK_SPEED;
	}
	
	public function setChasePath():Void{
		this.path = new FlxPath([new FlxPoint(this.getPosition().x, this.getPosition().y),
								 new FlxPoint((enemyPlayer.getPosition().x), PlayState.GROUND_START_Y - (Zombie.HEIGHT / 2))]);
		this.path.speed = Zombie.MAX_RUN_SPEED;
	}
	
	public function isChasingDistanceFromPlayer():Bool{
		if (FlxMath.distanceBetween(this, PlayState.player) < this.chasingDistance){
			return true;
		} else {
			return false;
		}
	}
}