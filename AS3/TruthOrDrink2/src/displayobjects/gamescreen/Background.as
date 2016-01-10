package displayobjects.gamescreen 
{
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Azad Tasan
	 */
	public class Background extends Sprite 
	{
		private var color1:int = 0xED6CA6;
		private var color2:int = 0x2DAAE1;
		
		private var quad1:Quad;
		private var quad2:Quad;
		
		public function Background() 
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
			
			quad1 = new Quad(stage.stageWidth, stage.stageHeight * 0.5, color1);
			quad2 = new Quad(stage.stageWidth, stage.stageHeight * 0.5, color2);
			quad2.y = quad2.height;
			addChild(quad1);
			addChild(quad2);
		}
		
		public function swap():void
		{
			if (quad1.color == color1)
			{
				quad1.color = color2;
				quad2.color = color1;
			}else
			{
				quad1.color = color1;
				quad2.color = color2;
			}
		}
		
	}

}