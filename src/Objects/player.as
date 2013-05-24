package Objects 
{
	import flash.display.Sprite;
	import code.$Vector;
	import code.Squar;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class player extends MoveObjectStatic
	{
		//art
		public var Player:Squar
		
		//movement
		public var speed:$Vector = new $Vector();
		public var speedup:$Vector = new $Vector(0,-1);
		public var g:Boolean;
		public var pos:$Vector = new $Vector()
		public var floorHeight:Number = 600
		
		//controles
		public var Spacebar:Boolean = false;
		
		//others
		private var pulseSpacebar:Boolean = false;
		public var powerup:int = 0;
		public var direction:int = -1;
		
		public function player($y:Number,$x:Number) 
		{
			//sets the location
			this.x = $x;
			this.y = $y;
			this.pos.$X = $x;
			this.pos.$Y = $y;
			
			//places the player
			//addchild(Player);
			//placeholder
			Player = new Squar(0, 0, 40, 20, 0xff0000, 0, false); 
			Player.x = 100;
			addChild(Player);
			
			//creats player controles and event check
			addEventListener(Event.ENTER_FRAME, step);
			
			//remove me
			speedup.$Y = 0.3
		}
		private function step(e:Event):void
		{
			if (this.y < 19) 
			{					
				speed.$Y = 0;
				this.y = 20;
			}
			if (powerup == 0) 
			{
				//Spacebarpress
				if(Spacebar && this.y > 20)
				{
				speedup.$Y = 0 - 1;
				}
				//Spacebar release
				if(this.y < floorHeight  && Spacebar == false )
				{
					speedup.$Y = 1;
					g = false;
				}	
				//stop movement
				if (this.y > floorHeight+1 && g == false)
				{
					speedup.$Y = 0
					this.y = floorHeight
					speed.$Y = 0
					g = true;
				}
			}
			//powerup gravity flip(voor een of andere rede val je door de grond
			if (powerup == 1)
			{
				//Spacebarpulseed
				if (Spacebar == false && pulseSpacebar) 
				{
					direction = direction * -1;
					trace("gravitflip")
					
					pulseSpacebar = false;			
				}
				if (Spacebar) 
				{
					pulseSpacebar = true;
					g = true;
				}
				if (direction < 0)
				{
					if (this.y > 19&& g)
					{
						speedup.$Y = -1;
					}
					
					if (this.y < 19)
					{
						g = false;
						this.y = 20;
						speedup.$Y = 0;
						speed.$Y=0
					}
					if (this.y > floorHeight+1)
					{
						//g = false;
						this.y = floorHeight;
						//speedup.$Y = 0;
						speed.$Y=0
					}
				}
				if (direction > 0)
				{
					if (this.y > 19)
					{
						this.y = 20
						speedup.$Y = 0
						speed.$Y=0
					}
					if (this.y < floorHeight+1&& g)
					{
						speedup.$Y = 1;
					}
					
					if (this.y > 19)
					{
						//g = false;
						this.y = 20;
						//speedup.$Y = 0;
						speed.$Y=0
					}
				}
			}
				
			//Movement
			speed.$X += speedup.$X;
			speed.$Y += speedup.$Y;
			
			this.x += speed.$X;
			this.y += speed.$Y;
			
		}
	}

}