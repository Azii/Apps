package displayobjects.helpers 
{
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author Azad Tasan
	 */
	public class Border extends Sprite
	{
		private var outerColor:int;
		private var outerWidth:int;
		
		private var totalWidth:int;
		private var totalHeight:int;
		
		private var image:Image;
		
		public function Border(outerColor:int, outerWidth:int, totalWidth:int = 0, totalHeight:int = 0) 
		{
			this.outerColor = outerColor;
			this.outerWidth = outerWidth;
			
			this.totalWidth = totalWidth;
			this.totalHeight = totalHeight;
			
			if (!stage)
				addEventListener(Event.ADDED_TO_STAGE, onAdded);
			else
				onAdded(null);
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			
			drawAndAdd();
		}
		
		private function drawAndAdd():void
		{	
			var sp:flash.display.Sprite = new flash.display.Sprite();
			var g:Graphics = sp.graphics;
			g.lineStyle(2, outerColor);
			g.drawRect(0, 0, totalWidth, totalHeight);
			var bmpd:BitmapData = new BitmapData(sp.width, sp.height, true, 0x00FFFFFF);
			bmpd.draw(sp);
			
			image = new Image(Texture.fromBitmapData(bmpd));
			image.alignPivot();
			addChild(image);
		}
		
		public function adjustParameters(outerWidth:int, outercolor:int, width:int, height:int)
		{
			this.outerWidth = outerWidth;
			this.outerColor = outerColor;
			
			this.totalWidth = width;
			this.totalHeight = height;
		}
		
	}

}