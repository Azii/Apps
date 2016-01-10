package displayobjects.gamescreen.counter 
{
	import flash.geom.Point;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.textures.Texture;
	
	public class DrinksCounterContainer extends Sprite 
	{	
		[Embed (source = "../../../../assets/OpenSans-Regular.ttf", fontName = "OpenSans", mimeType = "application/x-font",
		fontWeight = "normal", fontStyle = "normal", advancedAntiAliasing = "true", embedAsCFF = "false")]
		private static const OPEN_SANS:Class;
		
		private var textField:TextField;
		private var counterSprite:DrinksCounter;
		
		public function DrinksCounterContainer() 
		{
			super();
			
			if (!stage)
				addEventListener(Event.ADDED_TO_STAGE, onAdded);
			else
				onAdded(null);
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			
			textField = new TextField(stage.stageWidth * .2, 
			stage.stageHeight * .04, "Drinks", "OpenSans", 50, 0xFFFFFF);
			textField.autoScale = true;
			addChild(textField);
			
			counterSprite = new DrinksCounter();
			addChild(counterSprite);
			counterSprite.y = textField.height;
		}
		
		public function increment():void
		{
			counterSprite.increment();
			positionCounterSprite();
			trace(localToGlobal(new Point(counterSprite.x, counterSprite.y)));
		}
		
		private function positionCounterSprite():void 
		{
			counterSprite.x = textField.width * 0.2;
			counterSprite.y = textField.height;
		}
	}

}