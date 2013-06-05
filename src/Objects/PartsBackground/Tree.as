package Objects.PartsBackground 
{
	import code.Squar;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Tree extends MovieClip
	{
		private var art:Squar = new Squar(0,0,200,20,0x00ff00,0)
		public var speed:Number;
		
		public function Tree($y:Number,$x:Number,speed:Number) 
		{
			this.speed = speed
			this.y = $y;
			this.x = $x;
			
			addChild(art);
		}
		
		public function move():void
		{
			this.y+=speed
		}
	}

}