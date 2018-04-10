package player;
import environment.Ground;
import flixel.FlxG;
import flixel.util.FlxColor;

/**
 * Hero that moves like a character in a classic, top-down Legend of Zelda game.
 * @author Samuel Bumgardner
 */
class TopDownHero extends Hero
{
	var colors:Array<FlxColor> = [0xffff00, 0xff0000, 0x00ff00, 0x0000ff, 0x00ffff, 0xff00ff];
	var colorIndex = 0;
	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		
		colors = [0xffff00, 0xff0000, 0x00ff00, 0x0000ff, 0x00ffff, 0xff00ff];
		this.color = colors[0];
	}
	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		if (FlxG.keys.pressed.W){
			this.velocity.y =-100;
		}else if (FlxG.keys.pressed.S){
			this.velocity.y =100;
		}else{
			this.velocity.y = 0;
		}
		if (FlxG.keys.pressed.A){
			this.velocity.x =-100;
		}else if (FlxG.keys.pressed.D){
			this.velocity.x =100;
		}else{
			this.velocity.x = 0;
		}
		
		if (FlxG.keys.justPressed.SPACE){
			colorIndex += 1;
			this.color = colors[colorIndex % 6];
		}
	}
	public function HitWall(me:TopDownHero, ground:Ground){
		if (me.color != ground.color){
			FlxG.collide(me, ground);
		}
	}
}