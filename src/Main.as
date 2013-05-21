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
		
		//screenobjects
		private var Player:player;
		private var coins:Array = [];
		
		
		public function Main():void 
		{
			//just the ticker
			tick = new Timer(1000);
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
			}
			
			if (Level == 1)
			{
				tick.start();
				Player = new player(600,100);
				addChild(Player);
			}
			
			if (Level == 2)
			{
				//create gameoverscreen
			}
		}
		
		private function ticker(e:TimerEvent):void
		{
			trace(coinRowLength)
			trace("ticktack")
			if (coinRowLength > 0)
			{
				var coin:Coin = new Coin(1340,coinHeight)
				coins.push(coin)
				coinRowLength--
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
			//for each (var coin in coins)
			//{
				//if 
			//}
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