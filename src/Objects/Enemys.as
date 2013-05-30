package Objects 
{
	import code.Squar;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Enemys extends MovieClip
	{
		public var speed:Number = 4;
		private var art:MovieClip;
		public var maxSprites:int = 6;
		public var colour:uint;
		
		public function Enemys($x:Number=300, $y:Number=500, speed:Number=0, sprite:Number = 0) 
		{
			this.x = $y;
			this.y = $x;
			this.speed = speed;
			
			if (sprite >= 0 && sprite < 1) { art= new SpikeArt() }
			else if (sprite >= 1 && sprite < 2) { art= new SpikeArt2() }
			else if (sprite >= 2 && sprite < 3) { art= new SpikeArt3()}
			//else if (sprite >= 3 && sprite < 4) { art = new }
			//else if (sprite >= 4 && sprite < 5) { art = new }
			//else if (sprite >= 5 && sprite < 6) { art = new }
			
			// art = new Squar(0,0,30,90,colour,3);
			
			addChild(art);
			//addEventListener(Event.ENTER_FRAME, step);
		}
		
		public function step ():void
		{
			this.x -= speed;
		}
		
	}

}