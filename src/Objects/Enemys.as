package Objects 
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Enemys extends Sprite
	{
		public var speed:Number = 4;
		private var placeholder:Sprite
		public function Enemys($x:Number, $y:Number, speed:Number, sprite:int = 0) 
		{
			this.x = $y;
			this.y = $x;
			this.speed = speed;
			
			placeholder.graphics.lineStyle(this.linewidth);
			placeholder.graphics.beginFill(this.kleur);
			placeholder.graphics.drawRect(0, 0, this.$width, this.$height);
			
			addChild(placeholder);
				
			addEventListener(Event.ENTER_FRAME, step);
		}
		
		private function step ():void
		{
			this.x -= speed;
		}
		
	}

}