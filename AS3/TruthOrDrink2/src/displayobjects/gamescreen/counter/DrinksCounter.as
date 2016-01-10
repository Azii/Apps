package displayobjects.gamescreen.counter 
{
	import flash.geom.Point;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	
	public class DrinksCounter extends Sprite 
	{
		[Embed (source = "../../../../assets/1.png")]
		private static const ONE:Class;
		
		[Embed (source = "../../../../assets/2.png")]
		private static const TWO:Class;
		
		[Embed (source = "../../../../assets/3.png")]
		private static const THREE:Class;
		
		[Embed (source = "../../../../assets/4.png")]
		private static const FOUR:Class;
		
		[Embed (source = "../../../../assets/5.png")]
		private static const FIVE:Class;
		
		private var drinksCounter:int = 0;
		private var imageTotalHeight:int;
		private var imageTotalWidth:int;
		
		private static var textures:Vector.<Texture> = new Vector.<Texture>;
		private var images:Vector.<Image> = new Vector.<Image>;
		
		public function DrinksCounter():void
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
			
			if (textures.length == 0)
				createTextures();
		}
		
		public function increment():void
		{
			drinksCounter++;
			draw();
		}
		
		private function draw():void
		{
			removeImages();
			
			var amountToDraw:int;
			var drinksCounterImage:Image;
			var offsetPoint:Point;
			
			for (var i:int = 0; i < Math.ceil(drinksCounter / 5); i++)
			{
				amountToDraw = calcAmountToDraw(i);
				drinksCounterImage = new Image(DrinksCounter.textures[amountToDraw - 1]);
				//drinksCounterImage.alignPivot();
				addChild(drinksCounterImage);
				
				setPositionAndSize(drinksCounterImage, i);
				
				images.push(drinksCounterImage);
			}
		}
		
		private function removeImages():void
		{
			for (var i:int = 0; i < images.length; i++)
			{
				images[i].removeFromParent(true);
			}
			images.length = 0;
		}
		
		private function calcAmountToDraw(i:int):int
		{
			if (drinksCounter <= 5)
				return drinksCounter;
			if (drinksCounter <= 10)
			{
				if (i == 0)
					return 5;
				else
					return drinksCounter - 5;
			}
			if (drinksCounter <= 15)
			{
				if (i == 0)
					return 5;
				if (i == 1)
					return 5;
				if (i == 2)
					return drinksCounter - 10;
			}
			return 0;
		}
		
		private function setPositionAndSize(dp:DisplayObject, index:int):void
		{
			setSize(dp);
			setPosition(dp, index);
		}
		
		private function setSize(dp:DisplayObject):void
		{
			dp.height = imageTotalHeight;
			dp.scaleX = dp.scaleY;
		}
		
		private function setPosition(dp:DisplayObject, index:int):void
		{
			var xOffset:int = stage.stageWidth * 0.008;
			var yOffset:int = stage.stageHeight * 0.005;
			
			dp.y = yOffset;
			dp.x = index * xOffset + index * imageTotalWidth;
		}
		
		private function createTextures():void
		{
			imageTotalHeight = stage.stageHeight * 0.02;
			imageTotalWidth = 197 / 115 * imageTotalHeight;
			
			var heightRelation:Number = imageTotalHeight / 115;
			
			for (var i:int = 1; i < 6; i++)
			{
				DrinksCounter.textures[i - 1] = createSpecificTexture(i);
			}
		}
		
		private function createSpecificTexture(val:int):Texture
		{
			switch(val)
			{
				case 1:
					return Texture.fromBitmap(new ONE());
					break;
				case 2:
					return Texture.fromBitmap(new TWO());
					break;
				case 3:
					return Texture.fromBitmap(new THREE());
					break;
				case 4:
					return Texture.fromBitmap(new FOUR());
					break;
				case 5:
					return Texture.fromBitmap(new FIVE());
					break;
			}
			return null;
		}
		
	}

}