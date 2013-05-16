package Objects 
{
	import code.Sphere;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Coin extends MoveObjectStatic
	{
		public var speed:Number = 5;
		public var deleted:Boolean = false;
		//private var Coinart:coinart = new coinart()
		private var Coinart:Sphere;
		
		public function Coin($x:Number, $y:Number)
		{
			this.x = $x;
			this.y = $y;
			
			Coinart = new Sphere(this.x, this.y, 5, 0x00ffff);
			
			addEventListener(Event.ENTER_FRAME, step);
			addChild(Coinart);
			
			trace("coin placed")
		}
		
		private function step(e:Event):void
		{
			this.x += speed
			if (this.x < -40)
			{
				deleted = true;
			}
		}
	}

}