package displayobjects.gamescreen.gamescreenparts 
{
	import displayobjects.helpers.Border;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	
	public class TruthOrDare extends Sprite
	{
		[Embed (source = "../../../../assets/OpenSans-Regular.ttf", fontName = "OpenSans", mimeType = "application/x-font",
		fontWeight = "normal", fontStyle = "normal", advancedAntiAliasing = "true", embedAsCFF = "false")]
		private static const OPEN_SANS:Class;
		
		private var truthOrDrinkSprite:Sprite;
		
		public function TruthOrDare() 
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
			
			createTruthOrDrinkSprite();
			
			truthOrDrinkSprite.alignPivot();
			addChild(truthOrDrinkSprite);
			
			addEventListener(TouchEvent.TOUCH, onTouch);
		}
		
		private function onTouch(e:TouchEvent):void 
		{
			var t:Touch = e.getTouch(this);
			if (t)
			{
				if (t.phase == TouchPhase.ENDED)
				{
					if (t.getLocation(truthOrDrinkSprite).y < truthOrDrinkSprite.height * 0.5)
						{
							trace("truth");
							dispatchEventWith("truth", true);
						}
					else
						{
							trace("drink");
							dispatchEventWith("drink", true);
						}
				}
			}
		}
		
		private function createTruthOrDrinkSprite():void 
		{
			var sp:Sprite = new Sprite();
			
			var tf1:TextField = new TextField(stage.stageWidth * 0.5, stage.stageHeight * 0.1, "Truth", "OpenSans", 80, 0xFFFFFF);
			tf1.alignPivot();
			tf1.autoScale = true;
			
			var border1:Border = new Border(0xFFFFFF, 6, tf1.width, tf1.height);
			border1.alignPivot();
			border1.addChild(tf1);
			border1.y -= border1.height;
			
			var tf2:TextField = new TextField(stage.stageWidth * 0.5, stage.stageHeight * 0.1, "or", "OpenSans", 80, 0xFFFFFF);
			tf2.autoScale = true;
			tf2.alignPivot();
			
			var tf3:TextField = new TextField(stage.stageWidth * 0.5, stage.stageHeight * 0.1, "Drink", "OpenSans", 80, 0xFFFFFF);
			tf3.autoScale = true;
			tf3.alignPivot();
			
			var border2:Border = new Border(0xFFFFFF, 6, tf1.width, tf1.height);
			border2.alignPivot();
			border2.addChild(tf3);
			border2.y += border2.height;
			
			addChild(border1);
			addChild(tf2);
			addChild(border2);
			
			truthOrDrinkSprite = sp;
		}
		
		
		
		/* INTERFACE displayobjects.gamescreen.gamescreenparts.IGameScreenPart */
		
		public function fadeIn() 
		{
			
		}
		
		public function fadeOut() 
		{
			
		}
		
	}

}