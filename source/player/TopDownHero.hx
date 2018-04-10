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
		
		if (FlxG.keys.anyPressed([UP, W])){
		this.velocity.y += -5;
		}
		else if (FlxG.keys.anyPressed([DOWN, S])){
		this.velocity.y += 5;
		}
		else if (FlxG.keys.anyPressed([RIGHT, D])){
		this.velocity.x += 5;
		}
		else if (FlxG.keys.anyPressed([LEFT, A])){
		this.velocity.x += -5;
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