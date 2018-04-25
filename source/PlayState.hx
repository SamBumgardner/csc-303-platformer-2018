package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	// Text vars
	private var text:FlxText;
	private var upDownDir:String = "up";
	private var leftRightDir:String = "left";
	private var upEdge:Float;
	private var downEdge:Float;
	private var leftEdge:Float;
	private var rightEdge:Float;
	private var speed:Int = 3;
	private var boxSize:Int = 100;
	
	override public function create():Void
	{
		super.create();

		text = new flixel.text.FlxText(0, 0, 0, "Bonjour le Monde!", 24);
		text.screenCenter(); // Makes the object's x and y parameters automatically centered.
							 // To center this myself, I would use:
							 // text.x = (SCREEN_WIDTH / 2) - (text.width / 2);
							 // text.y = (SCREEN_HEIGHT / 2) - (text.height / 2);
							 // assuming SCREEN_WIDTH and SCREEN_HEIGHT were vars set somewhere,
							 // but why reinvent the wheel?
		
		text.borderColor = FlxColor.RED;
		text.borderSize = 5;
		text.borderStyle = FlxTextBorderStyle.OUTLINE;
		add(text);
		
		// Get text's points while centered
		var textOriginX = text.x;
		var textOriginY = text.y;
		
		// Set max movement
		rightEdge = textOriginX + boxSize;
		leftEdge = textOriginX - boxSize;
		downEdge = textOriginY + boxSize;
		upEdge = textOriginY - boxSize;
		

		// Add multiple hero objects
		add(new Hero());
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		// Up/down movement
		if (upDownDir == "up" && text.y >= upEdge){
			text.y -= speed;
		} else if (upDownDir == "up"){
			upDownDir = "down";
		} else if (upDownDir == "down" && text.y <= downEdge){
			text.y += speed;
		} else if (upDownDir == "down"){
			upDownDir = "up";
		}
		
		// Left/right movement
		if (leftRightDir == "left" && text.x >= leftEdge){
			text.x -= speed;
		} else if (leftRightDir == "left"){
			leftRightDir = "right";
		} else if (leftRightDir == "right" && text.x <= downEdge){
			text.x += speed;
		} else if (leftRightDir == "right"){
			leftRightDir = "left";
		}
	}
}
