package Objects 
{
	import code.Squar;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Enemys extends Sprite
	{
		public var speed:Number = 4;
		private var art:Squar;
		public var maxSprites:int = 6;
		public var colour:uint;
		
		public function Enemys($x:Number, $y:Number, speed:Number, sprite:Number = 0) 
		{
			this.x = $y;
			this.y = $x;
			this.speed = speed;
			
			if (sprite >= 0 && sprite < 1) { colour = 0xff0000 }
			else if (sprite >= 1 && sprite < 2) { colour = 0x00ff00 }
			else if (sprite >= 2 && sprite < 3) { colour = 0x0000ff }
			else if (sprite >= 3 && sprite < 4) { colour = 0xffff00 }
			else if (sprite >= 4 && sprite < 5) { colour = 0xff00ff }
			else if (sprite >= 5 && sprite < 6) { colour = 0x00ffff }
			
			art = new Squar(0,0,30,90,colour,3);
			
			addChild(art);
				
			//addEventListener(Event.ENTER_FRAME, step);
		}
		
		public function step ():void
		{
			this.x -= speed;
		}
		
	}

}