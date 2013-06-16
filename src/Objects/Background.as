package Objects 
{
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import Objects.PartsBackground.Tree;
	
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Background extends MovieClip 
	{
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
				var back:MovieClip
				back = new Background2();
				addChild(back)
				backgrounds.push(back);
				
				var back2:MovieClip
				back2 = new Background2();
				back2.x =-1280
				addChild(back2)
				backgrounds.push(back2);
				
			Spawner.start();
			Spawner.addEventListener(TimerEvent.TIMER, TreeSpawner);
		}
		
		private function TreeSpawner(e:TimerEvent):void 
		{
			var ran:Number = Math.random()*4
			
			var back:MovieClip
			
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
			
		back.x=-1280
				addChild(back)
				backgrounds.push(back);
		}
		
		public function run():void 
		{
			for (var i:int = 0; i < backgrounds.length; i++) 
			{
				backgrounds[i].x += speed;
				if (backgrounds[i].x > 1300)
				{
					removeChild(backgrounds[i])
					backgrounds.splice(i, 1);
				}
			}
		}
	}

}