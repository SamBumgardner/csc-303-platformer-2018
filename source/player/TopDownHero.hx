package player;
import flixel.util.FlxColor;
import flixel.FlxG;

/**
 * Hero that moves like a character in a classic, top-down Legend of Zelda game.
 * @author Samuel Bumgardner
 */
class TopDownHero extends Hero
{

	private var colorPicker = 0;
	private var colorArray:Array<String> = ["RED", "ORANGE", "YELLOW", "GREEN", "BLUE", "PURPLE"];
	
	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
	
	}
	
	override public function update(elapsed:Float):Void
	{
		
		if (FlxG.keys.pressed.W){
			this.velocity.y += -5;
		}
		else if (FlxG.keys.pressed.S){
			this.velocity.y += 5;
		}
		else if (FlxG.keys.pressed.D){
			this.velocity.x += 5;
		}
		else if (FlxG.keys.pressed.A){
			this.velocity.x += -5;
		}
		else {
			this.velocity.x = 0;
			this.velocity.y = 0;
		}
		
		if (FlxG.keys.justPressed.SPACE){
			colorPicker += 1;
		}
		
		if (colorPicker > 5){
			colorPicker = 0;
		}
		
		this.color = FlxColor.fromString(colorArray[colorPicker]);
		 
		super.update(elapsed);
	}
}