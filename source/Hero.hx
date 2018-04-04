class Hero extends FlxSprite
{
	override public function new():void{
        var graphic = new FlxSprite(0, 0);

        graphic.makeGraphic(30, 30, FlxColor.WHITE, false);
        
        var random = flixel.math.flxRandom();
        var dir = random.int(-2, 2, 0);
    }

    override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

        if (dir == -1){
            // move graphic down
        } else if (dir == 1){
            // move graphic up
        } else if (dir == -2){
            // move graphic left
        } else if (dir == 2){
            // move graphic right
        }
        
        // Update object color by screen position
        // Make hero move automatically each frame
	}
}
