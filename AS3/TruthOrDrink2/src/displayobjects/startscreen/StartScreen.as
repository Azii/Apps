package displayobjects.startscreen 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Azad Tasan
	 */
	public class StartScreen extends Sprite 
	{
		[Embed (source = "../../../assets/menu.png")]
		private static const MENU_IMAGE:Class;
		
		var bg:Image;
		
		public function StartScreen() 
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
			
			bg = new Image(Texture.fromBitmap(new MENU_IMAGE()));
			bg.width = stage.stageWidth;
			bg.height = stage.stageHeight;
			addChild(bg);
			
			bg.addEventListener(TouchEvent.TOUCH, onTouched);
		}
		
		private function onTouched(e:TouchEvent):void 
		{
			var t:Touch = e.getTouch(bg);
			if (t)
			{
				if (t.phase == TouchPhase.ENDED)
				{
					dispatchEventWith("exitStartScreen", true);
				}
			}
		}
		
	}

}