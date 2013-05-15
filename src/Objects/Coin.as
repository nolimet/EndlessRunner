package Objects 
{
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
		//public var Coinart:coinart = new coinart()
		public var Coinart:Sprite;
		
		public function Coin($x:Number, $y:Number)
		{
			this.x = $x;
			this.y = $y;
			
			addEventListener(Event.ENTER_FRAME, step);
			
			this.graphics.lineStyle(1);
			this.graphics.beginFill(0xffff00);
			this.graphics.drawCircle(this.x, this.y, 30);
			
			addChild(Coinart);
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