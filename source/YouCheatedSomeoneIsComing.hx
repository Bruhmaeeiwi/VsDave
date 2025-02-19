package;
#if sys
import sys.io.File;
import sys.io.Process;
#end
import flixel.*;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

/**
 * scary!!!
 */
class YouCheatedSomeoneIsComing extends FlxState //why did this extend music beat state?
{
	
	public function new() 
	{
		super();
	}
	
	override public function create():Void 
	{
		Paths.clearStoredMemory();
		Paths.clearUnusedMemory();

		super.create();
		if(FlxG.sound.music != null)
			FlxG.sound.music.stop();
		FlxG.sound.playMusic(Paths.music('badEnding'),1,true);
		var spooky:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('dave/endings/cheater_lol', 'shared'));
        spooky.screenCenter();
        add(spooky);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);

		#if mobile
		var justTouched:Bool = false;
		
		for (touch in FlxG.touches.list)
			if (touch.justPressed)
				justTouched = true;
		#end

		if (FlxG.keys.pressed.ENTER #if mobile || justTouched #end)
		{
			endIt();
		}
	}

	public function endIt()
	{
        FlxG.switchState(new SusState());
	}
}