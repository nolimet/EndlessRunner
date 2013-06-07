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
	 * @author Jesse Stam && Kerim Birlik
	 */
	public class Enemys extends MovieClip
	{		
		public var speed:Number = 4;
		private var art:MovieClip;
		public var maxSprites:int = 6;
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
			
			if (sprite >= 0 && sprite < 1) { art = new SpikeArt(); }
			if (sprite >= 1 && sprite < 2) { art = new SpikeArt2(); }
			if (sprite >= 2 && sprite < 3) { art = new SpikeArt3(); }
			if (sprite >= 3 && sprite < 4) { art = new PlayerArt(); canShoot = true; fireDelay = 30; }
			//else if (sprite >= 4 && sprite < 5) { art = new ;}
			//else if (sprite >= 5 && sprite < 6) { art = new ;}
			
			
			
			 //art = new Squar(0,0,30,90,colour,3);
			
			addChild(art);
		}
		
		public function step ():void
		{
			this.x -= speed;
			
			if (canShoot)
			{
				if (fireDelay <= 0)
				{
					fireDelay = 45
					
					var bullet:Bullet = new Bullet(0, 0, speed+8*-1);
					
					addChild(bullet);
					bullets.push(bullet);
					
					trace("fired")
				}
				fireDelay--
			
			
			for (var i:int = bullets.length; i < 0; i--) 
			{
				bullets[i].move();
				if (bullets[i].x < -40)
				{
					removeChild(bullets[i]);
					bullets.splice(i, 1);
				}
				//if (bullets[i].hittestobject(Player))
				//{
					//removeChild(bullets[i]);
					//bullets.splice(i, 1);
				//}
			}}
		}
		
	}

}