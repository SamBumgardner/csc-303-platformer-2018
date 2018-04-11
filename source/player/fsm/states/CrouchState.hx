package player.fsm.states;

import flixel.math.FlxRect;
import flixel.util.FlxColor;
import player.fsm.PlayerState;

/**
 * State for when the player is ducking. Also allows sliding. Fun!
 * @author Samuel Bumgardner
 */
class CrouchState extends PlayerState
{
	private static var topHalfOfGraphicRect(default, never) = new FlxRect(0, 0, 32, 32);
	
	public function new(hero:Hero) 
	{
		super(hero);
	}
	
	override public function handleInput(input:Input):Int 
	{
		
		var horizontalInput:Int = 0;
		if (input.leftPressed) {
			horizontalInput--;
		}
		if (input.rightPressed) {
			horizontalInput++;
		}
		
		if (horizontalInput != 0) {
			this.managedHero.facing = horizontalInput;
		}
		
		if (input.jumpJustPressed) {
			return PlayerStates.SLIDEDASH;
		}
		
		if (!input.downPressed) {
			return PlayerStates.STAND;
		}
		
		return PlayerStates.NO_CHANGE;
	}
	
	override public function update():Void {}
	
	override public function transitionIn():Void 
	{
		this.managedHero.color = FlxColor.RED;
		
		this.managedHero.height = Hero.CROUCH_HEIGHT;
		this.managedHero.clipRect = topHalfOfGraphicRect;
		this.managedHero.y += Hero.HEIGHT - Hero.CROUCH_HEIGHT;
		
		this.managedHero.drag.x = Hero.CROUCHING_DECELERATION;
	}
	
	override public function transitionOut():Void 
	{
		this.managedHero.color = FlxColor.WHITE;
		
		this.managedHero.height = Hero.HEIGHT;
		this.managedHero.clipRect = null;
		this.managedHero.y -= Hero.HEIGHT - Hero.CROUCH_HEIGHT;
		
		this.managedHero.drag.x = 0;
	}
	
}