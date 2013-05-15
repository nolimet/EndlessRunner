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
		
		private var tick:Timer
		//public static var _stage:Stage = Stage;
		
		//counters
		private var coinRowLength:int = 0;
		private var coinHeight:int = 0;
		//private var coinRandomInter:Number = 1;
		
		//screenobjects
		private var Player:player = new player(60, 60)
		private var coins:Array = [];
		
		
		public function Main():void 
		{
			addChild(Player)
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			
			addEventListener(TimerEvent.TIMER, ticker);
			addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN,KeyPressed);
			stage.addEventListener(KeyboardEvent.KEY_UP, KeyRelease);
			stage.addEventListener(MouseEvent.CLICK, MouseClick);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			tick = new Timer(1000);
			tick.start();
		}
		
		private function gameplaystart():void
		{
			tick.start();
			Player = new player(600,60);
			addChild(Player);
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
				coinRowLength = Math.floor(Math.random() * 16);
				coinHeight = Math.random() * 580 + 20;
			}
		}
		private function loop(e:Event):void
		{
			
		}
		
		private function KeyPressed(e:KeyboardEvent):void
		{
			trace(e.keyCode)
			if (e.keyCode==32){Player.Spacebar=true}
		}
		
		private function KeyRelease(e:KeyboardEvent):void
		{
			if (e.keyCode==32){Player.Spacebar=false}
		}
		
		private function MouseClick(e:MouseEvent):void
		{
			
		}
	}
	
}