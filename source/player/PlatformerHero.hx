package player;

import environment.Ground;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

import flixel.FlxG;

/**
 * Hero that moves like a typical 2-D platformer character.
 * @author Samuel Bumgardner
 */
class PlatformerHero extends Hero
{
	public var jumped = 0;
	public var onGround:Bool = false;
	public var doubleJumped:Bool = true;
	
	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
	}
	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		if (FlxG.keys.pressed.LEFT){
			this.velocity.x =Math.max(-400, this.velocity.x - 200);
		}if (FlxG.keys.pressed.RIGHT){
			this.velocity.x =Math.min(400, this.velocity.x + 200);
		}
		this.velocity.x /= 2;
		
		if (this.velocity.y > 200){
			this.velocity.y-=5;
		}else{
			this.velocity.y+=5;
		}
		
		//Jump and Double Jump
		if (jumped == 0){
			if (FlxG.keys.justPressed.Z && onGround){
				jumped = 1;
				this.velocity.y =-150;
			}else if (FlxG.keys.pressed.Z && jumped< 30){
				jumped += 1;
				this.velocity.y =-150;
			}
		}else if (jumped < 30){
			if (FlxG.keys.pressed.Z){
				jumped += 1;
				this.velocity.y =-150;
			} else {
				jumped = 30;
			}
		} else {
			jumped = 30;
			if (FlxG.keys.justPressed.Z && !doubleJumped){
				doubleJumped = true;
				jumped = 1;
				this.velocity.y =-150;
			}
		}
		
		//Dive
		if (FlxG.keys.pressed.DOWN && !onGround){
			this.velocity.y =1000;
		}
		
		onGround = false;
	}
	
	public function HitGround(me:PlatformerHero, ground:Ground){
		jumped = 0;
		onGround = true;
		doubleJumped = false;
	}
	
}