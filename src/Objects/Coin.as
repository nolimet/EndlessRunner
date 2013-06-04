package Objects 
{
	import code.Sphere;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Coin extends Sprite
	{
		public var speed:Number = 5;
		public var negative:Boolean = false;
		//private var Coinart:MovieClip = new coinart()
		private var Coinart:Sphere;
		
		
		public function Coin($x:Number, $y:Number)
		{
			this.x = $x;
			this.y = $y;
			if (1 > Math.random() * 10) { negative = !negative };
			if (negative) { Coinart = new Sphere(0, 0, 17, 0xaaaa00);}
			else{ Coinart = new Sphere(0, 0, 17, 0xffff00)}
			trace(negative)
			addChild(Coinart);
		}
		
		public function step():void
		{
			this.x -= speed
		}
	}

}