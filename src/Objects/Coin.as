package Objects 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Coin extends Sprite 
	{
		public function speed:Number = (Math.random() * 3 +5);
		public function Coin() 
		{
			addEventListener(Event.ENTER_FRAME, step);
		}
		
		private function step(e:Event)
		{
			this.x += speed
		}
	}

}