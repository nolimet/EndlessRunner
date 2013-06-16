package Objects 
{
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.Timer;
	import mx.events.Request;
	import org.bytearray.gif.player.GIFPlayer
	
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Background extends MovieClip 
	{
		//background classes
		
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
				var backr:URLRequest = new URLRequest("lib/achtergrond01.gif");
				var backp:GIFPlayer = new GIFPlayer();
				backp.load(backr);
				addChild(backp)
				backgrounds.push(backp);
				
				
				var backr2:URLRequest = new URLRequest("lib/achtergrond02.gif");
				var backp2:GIFPlayer = new GIFPlayer();
				backp.load(backr2);
				addChild(backp2)
				backgrounds.push(backp2);
				
			Spawner.start();
			Spawner.addEventListener(TimerEvent.TIMER, TreeSpawner);
		}
		
		private function TreeSpawner(e:TimerEvent):void 
		{
			var ran:Number = Math.random()*4
			
			var backr:URLRequest
			
			if (ran < 1)
			{
				backr = new URLRequest("lib/achtergrond01.gif");
			}
			if (ran >= 1 && ran < 2)
			{
				backr = new URLRequest("lib/achtergrond02.gif");
			}
			if (ran >= 2 && ran < 3)
			{
				backr = new URLRequest("lib/achtergrond03.gif");
			}
			if (ran >= 3 && ran < 4)
			{
				backr = new URLRequest("lib/achtergrond04.gif");
			}
			
			var backp:GIFPlayer = new GIFPlayer();
			
				backp.x=-1280
				addChild(backp)
				backgrounds.push(backp);
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