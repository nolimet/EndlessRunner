package 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import Objects.Coin;
	import Objects.player;
	
	/**
	 * ...
	 * @author Jesse Stam && kerim
	 */
	
	public class Main extends Sprite 
	{
		//timers
		private var tick:Timer
		private var textupdate:Timer
		//public static var _stage:Stage = Stage;
		
		//counters
		private var coinRowLength:int = 0;
		private var coinHeight:int = 0;
		private var currentlevel:int = 0;
		//private var coinRandomInter:Number = 1;
		public var score:int = 0
		
		
		//screenobjects
		private var Player:player;
		private var coins:Array = [];
		
		
		public function Main():void 
		{
			//just the ticker
			tick = new Timer(250);
			//tick.start();
			//textupdate timer
			textupdate = new Timer(100);
			textupdate.start();
			level(1);
			
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			
			tick.addEventListener(TimerEvent.TIMER, ticker);
			textupdate.addEventListener(TimerEvent.TIMER, Textupdate);
			addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN,KeyPressed);
			stage.addEventListener(KeyboardEvent.KEY_UP, KeyRelease);
			stage.addEventListener(MouseEvent.CLICK, MouseClick);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			
		}
		
		private function level(Level:int):void
		{
			if (currentlevel == 0)
			{
				//clear start screen
			}
			
			if (currentlevel == 1)
			{
				//remove player
				//remove coins
				//remove floor
				//remove background
				//remove sealing
			}
			
			if (currentlevel == 2)
			{
				//remove gameoverscreen
			}
			if (Level == 0)
			{
				//create startscreen
				currentlevel=0
			}
			
			if (Level == 1)
			{
				//The Game it self 
				tick.start();
				Player = new player(600,100);
				addChild(Player);
				currentlevel=1
			}
			
			if (Level == 2)
			{
				//create gameoverscreen
				currentlevel=2
			}
		}
		
		private function ticker(e:TimerEvent):void
		{
			if (coinRowLength > 0)
			{
				var coin:Coin = new Coin(1290, coinHeight);
				coins.push(coin);
				addChild(coin);
				coinRowLength--;
			}
			if (coinRowLength <= 0)
			{
				coinRowLength = Math.floor(Math.random() * 16 + 5);
				coinHeight = Math.random() * 580 + 20;
			}
		}
		
		private function Textupdate(e:TimerEvent):void
		{
			
			
		}
		private function loop(e:Event):void
		{
			for (var i:int = coins.length - 1 ; i > 0; i--)
			{
			if(coins[i].x < -40)
				{
					removeChild(coins[i]);
					coins.splice(1, i);
				}
				if (coins[i].hitTestObject(Player))
				{
					score += 1
					removeChild(coins[i]);
					coins.splice(1, i);
				}
			}
		}
		
		private function KeyPressed(e:KeyboardEvent):void
		{
			if (currentlevel == 1)
			{
				if (e.keyCode == 32) { Player.Spacebar = true }
			}
		}
		
		private function KeyRelease(e:KeyboardEvent):void
		{
			if (currentlevel == 1)
			{
				if (e.keyCode == 32) { Player.Spacebar = false }
			}
		}
		
		private function MouseClick(e:MouseEvent):void
		{
			
		}
	}
	
}