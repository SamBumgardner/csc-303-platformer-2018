import flixel.FlxSprite;
import flixel.math.FlxRandom;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.FlxG;

class Hero extends FlxSprite
{
	var dir:Int;
	var speed:Int = 200;
	var size:Int = 50;
	var random:FlxRandom;
	
	public function new(?X:Float=0, ?Y:Float=0):Void
	{
		super(X, Y);

        makeGraphic(size, size, FlxColor.WHITE);
        
        random = new FlxRandom();
        dir = random.int( -2, 2);
		setPosition(random.int(0, 255), random.int(0, 255));
		
		// I know you can add an array of excluded ints here, but
		// trying to create an array was taking too long 8P
		// Learning new languages, amIright?
		while (dir == 0){
			dir = random.int( -2, 2);
		}
		
    }
	
    override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
        if (dir == -1){
			// move graphic down
			if (velocity.y != speed){
				velocity.y += speed;
			}
			
			if (!isOnScreen()){
				setPosition(getPosition().x, 0);
			}
        } else if (dir == 1){
            // move graphic up
			if (velocity.y != -speed){
				velocity.y -= speed;
			}
			
			if (!isOnScreen()){
				setPosition(getPosition().x, 480);
			}
        } else if (dir == -2){
            // move graphic left
			if (velocity.x != -speed){
				velocity.x -= speed;
			}
			
			if (!isOnScreen()){
				setPosition(640, getPosition().y);
			}
        } else if (dir == 2){
            // move graphic right
			if (velocity.x != speed){
				velocity.x += speed;
			}
				
			if (!isOnScreen()){
				setPosition(0, getPosition().y);
			}
        }
        
        // Update object color by screen position
		var fxColor:FlxColor = new FlxColor();
		var xRound:Int = Std.int(getPosition().x  % 255);
		var yRound:Int = Std.int(getPosition().y  % 255);
		var randomThird:Int = random.int(0, 255);
		
        color = fxColor.setRGB(xRound, yRound, randomThird, 1);
		
		checkDirChange();
		
	}
	
	private function checkDirChange():Void{
		if (FlxG.keys.justPressed.LEFT){
			dir = -2;
			
			velocity.x = 0;
			velocity.y = 0;
		} else if (FlxG.keys.justPressed.RIGHT){
			dir = 2;
			
			velocity.x = 0;
			velocity.y = 0;
		} else if (FlxG.keys.justPressed.UP){
			dir = 1;
			
			velocity.x = 0;
			velocity.y = 0;
		} else if (FlxG.keys.justPressed.DOWN){
			dir = -1;
			
			velocity.x = 0;
			velocity.y = 0;
		}
	}
}
