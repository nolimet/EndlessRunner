package Objects 
{
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import Objects.PartsBackground.Tree;
	
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Background extends MovieClip 
	{
		//background classes
		[Embed(source="../../lib/achtergrond01.gif")]
		private var Background1:Class;
		
		[Embed(source="../../lib/achtergrond02.gif")]
		private var Background2:Class;
		
		[Embed(source="../../lib/achtergrond03.gif")]
		private var Background3:Class;
		
		[Embed(source="../../lib/achtergrond04.gif")]
		private var Background4:Class;
		
		//otherthings
		public var backgrounds:Array = [];
		private var Spawner:Timer;
		//private var back:MovieClip
		private var spawningTrees:Boolean = false;
		private var speed:int = 5
		
		public function Background() 
		{
			Spawner = new Timer(8534)
			//Spawner = new Timer(200)
			
				//do once
				var back:Bitmap
				back = new Background2();
				addChild(back)
				backgrounds.push(back);
				
				var back2:Bitmap
				back2 = new Background4();
				back2.x =1280
				addChild(back2)
				backgrounds.push(back2);
				
			Spawner.start();
			Spawner.addEventListener(TimerEvent.TIMER, TreeSpawner);
		}
		
		private function TreeSpawner(e:TimerEvent):void 
		{
			var ran:Number = Math.random()*4
			
			var back:Bitmap
			
			if (ran < 1)
			{
				back = new Background1();
			}
			if (ran >= 1 && ran < 2)
			{
				back = new Background2();
			}
			
			if (ran >= 2 && ran < 3)
			{
				back = new Background3();
			}
			if (ran >= 3 && ran < 4)
			{
				back = new Background4();
			}
			
		back.x=1280
				addChild(back)
				backgrounds.push(back);
		}
		
		public function run():void 
		{
			for (var i:int = 0; i < backgrounds.length; i++) 
			{
				backgrounds[i].x -= speed;
				if (backgrounds[i].x < -1300)
				{
					removeChild(backgrounds[i])
					backgrounds.splice(i, 1);
				}
			}
		}
	}

}