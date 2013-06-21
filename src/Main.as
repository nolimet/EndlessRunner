package 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	import flash.display.MovieClip
	import net.hires.debug.Stats;
	import Objects.Background;
	import Objects.Coin;
	import Objects.Enemys;
	import Objects.Player;
	import Objects.Button;
	import Objects.SoundPlayer;
	
	/**
	 * ...
	 * @author Jesse Stam &&Kerim Birlik
	 */
	
	public class Main extends Sprite 
	{
		//timers
		private var coinSpawner:Timer
		private var textupdate:Timer
		private var enemyspawn:Timer
		
		//counters
		private var coinRowLength:int = 0;
		private var coinHeight:int = 0;
		private var currentlevel:int = -1;
		//private var coinRandomInter:Number = 1;
		public var score:int = 0
		public var highScore:int = 0
		
		
		//screenobjects
		private var player:Player;
		private var coins:Array = [];
		private var enemies:Array = [];
		private var scoretext:TextField = new TextField;
		private var debug:Stats = new Stats();
		private var background:Background = new Background();
		private var startButton:Button
		
		//no screen items;
		private var textfont:TextFormat = new TextFormat(null, 26);
		private var backmus:SoundPlayer = new SoundPlayer();
		
		//stupid things
		//private var scoretextfro:TextFormat = new TextFormat();
		private var health:Number;
		
		
		public function Main():void 
		{
			//just the CoinSpawner
			coinSpawner = new Timer(375);
			
			//enemy spawner
			enemyspawn = new Timer(1000);

			//textupdate timer
			textupdate = new Timer(100);
			textupdate.start();
			
			
			//text stuff
			scoretext.defaultTextFormat = textfont;
			scoretext.width = 500;
			addChild(scoretext);
			
			//other
			player = new Player(600, 100);
			
			
			//Start level
			level(0);
			
			//debug
			//addChild(debug);
			
			
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			
			coinSpawner.addEventListener(TimerEvent.TIMER, CoinSpawner);
			textupdate.addEventListener(TimerEvent.TIMER, Textupdate);
			addEventListener(Event.ENTER_FRAME, loop);
			enemyspawn.addEventListener(TimerEvent.TIMER, SpawnEnemy);
			
			//stage events
			stage.addEventListener(KeyboardEvent.KEY_DOWN,KeyPressed);
			stage.addEventListener(KeyboardEvent.KEY_UP, KeyRelease);
			
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
				backmus.stop();	
				removeChild(startButton);
				removeChild(scoretext);
				removeChild(background);
			}
			
			else if (currentlevel == 1)
			{
				enemyspawn.stop();
				coinSpawner.stop();
				removeChild(player)
				removeChild(background);
				player.onScreen = false;
				removeChild(scoretext);
				backmus.stop()
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
			}
			
			else if (currentlevel == 2)
			{
				//remove gameoverscreen
				removeChild(startButton);
				removeChild(scoretext);
				backmus.stop();
				removeChild(background);
				
			}
			
			//level building
			if (Level == 0)
			{
				//create startscreen
				addChild(scoretext);
				backmus = new SoundPlayer(2);
				startButton = new Button(60, 600, 1);
				background = new Background(true, 0);
				addChild(background);
				addChild(startButton);
				currentlevel=0
			}
			
			else if (Level == 1)
			{
				//The Game it self 
				background = new Background();
				backmus = new SoundPlayer(1);
				addChild(background)
				coinSpawner.start();
				player.onScreen = true;
				player.y = 600;
				player.speed.$Y = 0;
				addChild(player);
				currentlevel = 1
				enemyspawn.start();
				health = 10;
				scoretext.x = 0
				scoretext.y = 0
				addChild(scoretext);
				
			}
			
			else if (Level == 2)
			{
				//create gameoverscreen
				currentlevel = 2
				background = new Background(true, 2);
				addChild(background);
				
				startButton = new Button(60, 600, 2);
				backmus = new SoundPlayer(3);
				addChild(startButton);
				//addChild(scoretext);
				addChild(scoretext);
			}
		}
		
		private function CoinSpawner(e:TimerEvent):void
		{
			
			if (coinRowLength > 0)
			{
				var coin:Coin = new Coin(1290, coinHeight, score);
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
			if (score > 50)
			{
			var chance:Number = 200 / (score/2)
			if (chance < 5) { chance = 5 }
				
				if (1 > Math.random() * chance)
				{
				var enemy:Enemys = new Enemys(1290, Math.random() * 580 + 20, Math.random() * 4 + 5, Math.random() * 3);
				enemies.push(enemy);
				addChild(enemy);
				}
			}
			enemyspawn.delay = Math.random() * 1500 +250;
			
		}
		
		private function Textupdate(e:TimerEvent):void
		{
			if (currentlevel == 0)
			{
				scoretext.text = "";
			}
			if (currentlevel == 1)
			{
				
				if (score > highScore)
				{
					highScore = score;
				}
				scoretext.text = "Score: " + score+ "\nHighScore: " + highScore + "\nHealth: " + health ; 
				scoretext.x = 10;
				scoretext.y = 20;
			}
			if(currentlevel == 2)
			{
				scoretext.text = "Score: " + score + "\nHighScore: " + highScore;
				scoretext.y = (720/ 2) + 100
				scoretext.x = (1280/ 2)-100 
			}

			
		}
		private function loop(e:Event):void
		{
			if (currentlevel == 0)
			{
				if (startButton.clicked)
				{
					level(1);
				}
			}
			if (currentlevel == 1)
			{
				player.step();
				background.run();
				if (health <= 0)
				{
					level(2);
				}
				if (enemies.length != 0)
				{
				for (var j:int = enemies.length - 1 ; j >= 0; j--) 
				{
					enemies[j].step();
					//enemies[j].gottenX = enemies[j].x;
					if (enemies[j].x < -200)
						{
							removeChild(enemies[j])
							enemies.splice(j, 1);
						}
						else if (enemies[j].hitTestObject(player)) 
						{
							health -= 1
							removeChild(enemies[j])
							enemies.splice(j, 1);
						}
					}
				}
			}
			if (currentlevel == 2)
			{
				if (startButton.clicked)
				{
					level(1);
					score=0
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
				if (coins[i].hitTestObject(player))
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
				if (e.keyCode == 32) { player.Spacebar = true }
			}
		}
		
		private function KeyRelease(e:KeyboardEvent):void
		{
			if (currentlevel == 1)
			{
				if (e.keyCode == 32) { player.Spacebar = false }
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
			if (e.keyCode == 53)
			{
				score+=100
			}
		}
		
	}
	
}