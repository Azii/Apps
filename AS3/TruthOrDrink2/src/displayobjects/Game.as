package displayobjects 
{
	import displayobjects.gamescreen.GameScreen;
	import displayobjects.startscreen.StartScreen;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	
	public class Game extends Sprite 
	{
		private var startScreen:StartScreen;
		private var gameScreen:GameScreen;
		
		public function Game() 
		{
			super();
			
			if (!stage)
				addEventListener(Event.ADDED_TO_STAGE, onAdded);
			else
				onAdded(null);
		}
		
		private function onAdded(e:Event):void 
		{
			startScreen = new StartScreen();
			addChild(startScreen);
			addEventListener("exitStartScreen", exitStartScreen);
		}
		
		private function exitStartScreen(e:Event):void 
		{
			startScreen.removeFromParent(true);
			
			gameScreen = new GameScreen();
			addChild(gameScreen);
		}
		
		
		
	}

}