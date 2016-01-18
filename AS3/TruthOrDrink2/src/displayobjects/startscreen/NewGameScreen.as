package displayobjects.startscreen 
{
	import displayobjects.gamescreen.Background;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.utils.deg2rad;
	public class NewGameScreen extends Sprite
	{
		[Embed (source = "../../../assets/OpenSans-Regular.ttf", fontName = "OpenSans", mimeType = "application/x-font",
		fontWeight = "normal", fontStyle = "normal", advancedAntiAliasing = "true", embedAsCFF = "false")]
		private static const OPEN_SANS:Class;
		
		public function NewGameScreen() 
		{
			if (!stage)
				addEventListener(Event.ADDED_TO_STAGE, onAdded);
			else
				onAdded(null);
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			
			var bg:Background = new Background();
			addChild(bg);
			
			var top:Sprite = new Sprite();
			top.alignPivot();
			top.rotation = deg2rad(180);
			top.x = stage.stageWidth * 0.5;
			top.y = stage.stageHeight * 0.25;
			addChild(top);
			
			var bot:Sprite = new Sprite();
			bot.alignPivot();
			bot.x = stage.stageWidth * 0.5;
			bot.y = stage.stageHeight * 0.75;
			addChild(bot);
			
			var t1:TextField = new TextField(stage.stageWidth * 0.5, stage.stageHeight * 0.1, "New Game", "OpenSans", 100, 0xFFFFFF);
			t1.autoScale = true;
			t1.x = stage.stageWidth * 0.5 - t1.width * 0.5;
			t1.y = stage.stageHeight * 0.25 - t1.height * 0.5;
			top.addChild(t1);
		}
		
	}

}