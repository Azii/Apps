package displayobjects.gamescreen.gamescreenparts 
{
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	
	/**
	 * ...
	 * @author Azad Tasan
	 */
	public class QuestionText extends Sprite
	{
		[Embed (source = "../../../../assets/OpenSans-Regular.ttf", fontName = "OpenSans", mimeType = "application/x-font",
		fontWeight = "normal", fontStyle = "normal", advancedAntiAliasing = "true", embedAsCFF = "false")]
		private static const OPEN_SANS:Class;
		
		private var textField:TextField;
		private var text:String;
		
		public function QuestionText(text:String = null) 
		{
			super();
			
			if (text != null)
				this.text = text;
			else
			{
				try {
					this.text = Questions.getQuestion();
				}catch (e:Error)
				{
					dispatchEventWith("newGame", true);
				}
			}
			
			if (!stage)
				addEventListener(Event.ADDED_TO_STAGE, onAdded);
			else
				onAdded(null);
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			
			textField = new TextField(stage.stageWidth * 0.7, stage.stageHeight * 0.5 * 0.7, text, "OpenSans", 80, 0xFFFFFF);
			textField.alignPivot();
			textField.autoScale = true;
			addChild(textField);
			
			addEventListener(TouchEvent.TOUCH, onTouched);
		}
		
		private function onTouched(e:TouchEvent):void 
		{
			var t:Touch = e.getTouch(this);
			if (t)
			{
				if (t.phase == TouchPhase.ENDED)
					dispatchEventWith("handyInDerHand", true);
			}
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