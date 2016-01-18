package displayobjects.gamescreen 
{
	import displayobjects.gamescreen.Background;
	import displayobjects.gamescreen.counter.DrinksCounterContainer;
	import displayobjects.gamescreen.gamescreenparts.IGameScreenPart;
	import displayobjects.gamescreen.gamescreenparts.QuestionText;
	import displayobjects.gamescreen.gamescreenparts.TruthOrDare;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.utils.deg2rad;
	
	public class GameScreen extends Sprite 
	{
		private var bg:Sprite;
		private var drinkCountersVector:Vector.<DrinksCounterContainer> = 
			new Vector.<DrinksCounterContainer>;
		private var top:Sprite;
		private var bot:Sprite;
		
		public function GameScreen() 
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
			
			bg = new Background();
			addChild(bg);
			
			top = new Sprite();
			top.alignPivot();
			top.rotation = deg2rad(180);
			top.x = stage.stageWidth * 0.5;
			top.y = stage.stageHeight * 0.25;
			addChild(top);
			
			bot = new Sprite();
			bot.alignPivot();
			bot.y = stage.stageHeight * 0.75;
			bot.x = stage.stageWidth * 0.5;
			addChild(bot);
			
			createDrinksCounters();
			
			startGame();
		}
		
		private function startGame():void 
		{
			addEventListener("truth", onTruth);
			addEventListener("drink", onDrink);
			addEventListener("newGame", newGame);
			
			var gameScreenPart:QuestionText = new QuestionText("Handy in die Hand und drücken!");
			addChildBot(gameScreenPart);
			addEventListener("handyInDerHand", pickedUpPhone);
		}
		
		private function newGame(e:Event):void 
		{
			
		}
		
		private function pickedUpPhone(e:Event):void 
		{
			removeEventListener("handyInDerHand", pickedUpPhone);
			bot.removeChildren();
			
			var truthOrDare:TruthOrDare = new TruthOrDare();
			addChildTop(truthOrDare);
			
			var questionText:QuestionText = new QuestionText();
			addChildBot(questionText);
		}
		
		private function onTruth(e:Event):void 
		{
			nextRound();
		}
		
		private function onDrink(e:Event):void 
		{
			if (bot.getChildAt(0) is TruthOrDare)
			{
				drinkCountersVector[0].increment();
			}
			else
			{
				drinkCountersVector[1].increment();
			}
			nextRound();
		}

		private function nextRound():void 
		{
			var questionText:QuestionText = new QuestionText();
			var truthOrDare:TruthOrDare = new TruthOrDare();
			
			if (bot.getChildAt(0) is TruthOrDare)
			{
				bot.removeChildren();
				top.removeChildren();
				
				addChildTop(truthOrDare);
				addChildBot(questionText);
			}else {
				bot.removeChildren();
				top.removeChildren();
				
				addChildTop(questionText);
				addChildBot(truthOrDare);
			}
		}
		
		private function addChildBot(sp:Sprite):void
		{
			sp.alignPivot();
			bot.addChild(sp);
		}
		
		private function addChildTop(sp:Sprite):void
		{
			sp.alignPivot();
			top.addChild(sp);
		}
		
		private function createDrinksCounters():void 
		{
			var drinksCounter:DrinksCounterContainer;
			
			for (var i:int = 0; i < 2; i++)
			{
				drinksCounter = new DrinksCounterContainer();
				addChild(drinksCounter);
				drinksCounter.alignPivot();
				drinksCounter.rotation = i * deg2rad(180);
				
				if (i == 0)
				{
					drinksCounter.x = drinksCounter.width * 0.5;
					drinksCounter.y = stage.stageHeight * 0.5 + drinksCounter.height * 0.5;
				}else 
				{
					drinksCounter.x = stage.stageWidth - drinksCounter.width * 0.5;
					drinksCounter.y = stage.stageHeight * 0.5 - drinksCounter.height * 0.5;
				}
				
				drinkCountersVector.push(drinksCounter);
			}
		}
		
	}

}