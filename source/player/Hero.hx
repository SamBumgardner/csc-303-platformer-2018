package player;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import haxe.ds.Vector;
import player.fsm.PlayerStates;
import player.fsm.State;
import player.fsm.states.CrouchState;
import player.fsm.states.JumpState;
import player.fsm.states.RunState;
import player.fsm.states.StandState;
import player.fsm.states.SlideDashState;

/**
 * Base hero class that player-controlled objects should descend from.
 * @author Samuel Bumgardner
 */
class Hero extends FlxSprite
{
	public static var LENGTH(default, never):Int = 32;
	public static var HEIGHT(default, never):Int = 64;
	public static var CROUCH_HEIGHT(default, never):Float = 32;
	
	public static var MAX_RUN_SPEED(default, never):Float = 200;
	public static var MAX_Y_SPEED(default, never):Float = 350;
	public static var JUMP_VELOCITY(default, never):Float = -350;
	public static var GRAVITY(default, never):Float = 400;
	public static var STANDING_DECELERATION(default, never):Float = 500;
	public static var CROUCHING_DECELERATION(default, never):Float = 200;
	
	private var states:Vector<State> = new Vector<State>(8);
	
	private var state:State;
	
	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		makeGraphic(LENGTH, HEIGHT);
		acceleration.y = GRAVITY;
		maxVelocity.set(MAX_RUN_SPEED, MAX_Y_SPEED);
		
		states[PlayerStates.STAND] = new StandState(this);
		states[PlayerStates.RUN] = new RunState(this);
		states[PlayerStates.JUMP] = new JumpState(this);
		states[PlayerStates.CROUCH] = new CrouchState(this);
		states[PlayerStates.SLIDEDASH] = new SlideDashState(this);
		
		state = states[PlayerStates.STAND];
	}
	
	/**
	 * Helper function to gather player-relevant inputs needed each update.
	 * @return Input object describing the state of all buttons.
	 */
	private inline function captureInput():Input {
		var input:Input = new Input();
		
		input.leftJustPressed = FlxG.keys.justPressed.LEFT;
		input.rightJustPressed = FlxG.keys.justPressed.RIGHT;
		input.downJustPressed = FlxG.keys.justPressed.DOWN;
		input.jumpJustPressed = FlxG.keys.justPressed.SPACE;
		
		input.leftPressed = FlxG.keys.pressed.LEFT;
		input.rightPressed = FlxG.keys.pressed.RIGHT;
		input.downPressed = FlxG.keys.pressed.DOWN;
		input.jumpPressed = FlxG.keys.pressed.SPACE;
		
		input.leftJustReleased = FlxG.keys.justReleased.LEFT;
		input.rightJustReleased = FlxG.keys.justReleased.RIGHT;
		input.downJustReleased = FlxG.keys.justReleased.DOWN;
		input.jumpJustReleased = FlxG.keys.justReleased.SPACE;
		
		return input;
	}
	
	/**
	 * Helper function to separate this messy FSM logic from the rest of the update code.
	 */
	private inline function applyInputAndTransitionStates(input:Input):Void {
		var nextState:Int;
		do {
			nextState = state.handleInput(input);
			if (nextState != PlayerStates.NO_CHANGE) {
				state.transitionOut();
				state = states[nextState];
				state.transitionIn();
			}
		} while (nextState != PlayerStates.NO_CHANGE);
	}
	
	override public function update(elapsed:Float) {
		var input:Input = captureInput();
		applyInputAndTransitionStates(input);
		state.update();
		
		super.update(elapsed);
	}
}