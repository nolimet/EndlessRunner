package 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	import flash.display.MovieClip
	import net.hires.debug.Stats;
	import Objects.Coin;
	import Objects.Enemys;
	import Objects.player;
	
	/**
	 * ...
	 * @author Jesse Stam &&Kerim Birlik
	 */
	
	public class Main extends Sprite 
	{
		//timers
		private var tick:Timer
		private var textupdate:Timer
		//public static var _stage:Stage = Stage;
		private var enemyspawn:Timer
		
		//counters
		private var coinRowLength:int = 0;
		private var coinHeight:int = 0;
		private var currentlevel:int = 0;
		//private var coinRandomInter:Number = 1;
		public var score:int = 0
		
		
		//screenobjects
		private var Player:player;
		private var coins:Array = [];
		private var enemies:Array = [];
		private var scoretext:TextField = new TextField;
		private var debug:Stats = new Stats();
		
		//no screen items;
		
		
		//stupid things
		private var scoretextfro:TextFormat = new TextFormat();
		private var health:Number;
		
		
		public function Main():void 
		{
			//just the ticker
			tick = new Timer(250);
			
			//enemy spawner
			enemyspawn = new Timer(1000);

			//textupdate timer
			textupdate = new Timer(100);
			textupdate.start();
			
			
			//text stuff
			scoretextfro.size = 50;
			scoretext.setTextFormat(scoretextfro);
			addChild(scoretext);
			
			//other
			Player = new player(600, 100);
			
			
			//Start level
			level(1);
			
			//debug
			//addChild(debug);
			
			
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			
			tick.addEventListener(TimerEvent.TIMER, ticker);
			textupdate.addEventListener(TimerEvent.TIMER, Textupdate);
			addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN,KeyPressed);
			stage.addEventListener(KeyboardEvent.KEY_UP, KeyRelease);
			stage.addEventListener(MouseEvent.CLICK, MouseClick);
			enemyspawn.addEventListener(TimerEvent.TIMER, SpawnEnemy);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			
		}
		
		private function level(Level:int):void
		{
			//screen clear
			if (currentlevel == 0)
			{
				//clear start screen
			}
			
			else if (currentlevel == 1)
			{
				enemyspawn.stop();
				tick.stop();
				removeChild(Player)
				Player.onScreen = false;
				for (var i:int = coins.length - 1 ; i >= 0; i--)
				{
					removeChild(coins[i]);
					coins.splice(i, 1);
				}
				for (var j:int = enemies.length - 1 ; j >= 0; j--)
				{
					removeChild(enemies[j]);
					enemies.splice(j, 1);
				}
				//remove player clear the player
				//remove floor
				//remove background
				//remove sealing
			}
			
			else if (currentlevel == 2)
			{
				//remove gameoverscreen
			}
			
			//level building
			if (Level == 0)
			{
				//create startscreen
				currentlevel=0
			}
			
			else if (Level == 1)
			{
				//The Game it self 
				tick.start();
				Player.onScreen = true;
				Player.y = 600;
				Player.speed.$Y = 0;
				addChild(Player);
				currentlevel = 1
				enemyspawn.start();
				health = 10;
			}
			
			else if (Level == 2)
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
		
		private function SpawnEnemy(e:TimerEvent):void
		{
 			var enemy:Enemys = new Enemys(1290, Math.random() * 580 + 20, Math.random()*4+2, Math.random() *3);
			enemies.push(enemy);
			addChild(enemy);
			
			enemyspawn.delay = Math.random() * 1500 +250;
			
		}
		
		private function Textupdate(e:TimerEvent):void
		{
			if (currentlevel == 1)
			{
				scoretext.text = "Score: " + score + "\n health: " + health; 
				scoretext.x = 10;
				scoretext.y = 20;
			}
			else
			{
				scoretext.text = "";
			}
			
		}
		private function loop(e:Event):void
		{
			Player.step();
			for (var j:int = enemies.length - 1 ; j >= 0; j--) 
			{
				enemies[j].step();
				if (enemies[j].x < -200)
				{
					removeChild(enemies[j])
					enemies.splice(j, 1);
				}
				if (enemies[j].hitTestObject(Player)) 
				{
					health -= 1
					removeChild(enemies[j])
					enemies.splice(j, 1);
				}
			}
			
			for (var i:int = coins.length - 1 ; i >= 0; i--)
			{
				coins[i].step(); 
			if(coins[i].x < -40)
				{
					removeChild(coins[i]);
					coins.splice(i, 1);
				}
				if (coins[i].hitTestObject(Player))
				{
					if (coins[i].negative)
					{
						score -=10
					}
					else
					{
						score += 1
					}
					removeChild(coins[i]);
					coins.splice(i, 1);
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
			if (e.keyCode == 49)
			{
				level(0);
			}			
			if (e.keyCode == 50)
			{
				level(1);
			}
			if (e.keyCode == 51)
			{
				level(2);
			}
		}
		
		private function MouseClick(e:MouseEvent):void
		{
			
		}
	}
	
}