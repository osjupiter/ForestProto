package ;

import flash.display.Sprite;
import flash.events.Event;
import flash.Lib;

class SceneNode extends Sprite 
{
	var inited:Bool;

	/* ENTRY POINT */

	function resize(e) 
	{
		if (!inited) init();
		// else (resize or orientation change)
	}

	function pre_init() 
	{
		if (inited) return;
		inited = true;

		// code
		init();
	}

	function init(){
	
	}

	/* SETUP */

	public function new() 
	{
		super();	
		addEventListener(Event.ADDED_TO_STAGE, added);
	}

	function added(e) 
	{
		removeEventListener(Event.ADDED_TO_STAGE, added);
		stage.addEventListener(Event.RESIZE, resize);
#if ios
		haxe.Timer.delay(pre_init, 100); // iOS 6
#else
		pre_init();
#end
	}

	
}

