package Objects 
{
	import code.Sphere;
	import code.Squar;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Bullet extends MovieClip{
		private var speed:Number
		
		private var art:Sphere = new Sphere(0, 0, 5, 0x6d6d6d, 0);
		
		public function Bullet($x:Number=0,$y:Number=0,$speed:Number=0) 
		{
			this.x = $x
			this.y = $y
		
			speed = $speed;
			
			addChild(art);
		}
		
		public function move():void
		{
			this.x+=speed
		}
		
	}

}