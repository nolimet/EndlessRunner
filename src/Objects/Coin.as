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
	public class Coin extends MoveObjectStatic
	{
		public var speed:Number = 5;
		public var deleted:Boolean = false;
		//private var Coinart:MovieClip = new coinart()
		private var Coinart:Sphere;
		
		public function Coin($x:Number, $y:Number)
		{
			this.x = $x;
			this.y = $y;
			
			Coinart = new Sphere(0, 0, 17, 0xffff00);
			
			//SaddEventListener(Event.ENTER_FRAME, step);
			addChild(Coinart);
		}
		
		public function step():void
		{
			this.x -= speed
			//if (this.x < -40)
			//{
				//deleted = true;
			//}
		}
	}

}