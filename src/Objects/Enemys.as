package Objects 
{
	import adobe.utils.ProductManager;
	import code.Squar;
	import flash.display.Sprite;
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
		private var art:MovieClip;S
		public var colour:uint;
		public var canShoot:Boolean;
		private var fireDelay:int;
		public var fire:Boolean = false;
		private var bullets:Array = [];
		public var gottenX:Number;
		
		public function Enemys($y:Number=300, $x:Number=500, $speed:Number=0, sprite:Number = 0, $canShoot:Boolean=false) 
		{
			this.x = $y;
			this.y = $x;
			this.speed = $speed;
			this.canShoot = $canShoot;
			
			if (sprite >= 0 && sprite < 1) { art = new Wortel(); }
			if (sprite >= 1 && sprite < 2) { art = new Sla(); }
			if (sprite >= 2 && sprite < 3) { art = new SpikeArt3(); }
			if (sprite >= 3 && sprite < 4) { art = new Enemy(); }
			//else if (sprite >= 4 && sprite < 5) { art = new ;}
			//else if (sprite >= 5 && sprite < 6) { art = new ;}
			
			
			
			 //art = new Squar(0,0,30,90,colour,3);
			
			addChild(art);
		}
		
		public function step ():void
		{
			this.x -= speed;
		}
		
	}

}