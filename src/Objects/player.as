package Objects 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import code.$Vector;
	import code.Squar;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Player extends MoveObjectStatic
	{
		//art
		public var art:MovieClip
		
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
		public var onScreen:Boolean = false;
		private var artchanged:Boolean = false;
		
		public function Player($y:Number,$x:Number) 
		{
			//sets the location
			this.x = $x;
			this.y = $y;
			this.pos.$X = $x;
			this.pos.$Y = $y;
			
			//places the player
			
			//placeholder
			//art = new Squar(0, 0, 40, 20, 0xff0000, 0, false); 
			//art.x = 100;
			//places the art
			art = new CharRun;
			addChild(art);
			art.height = art.height / 2.8
			art.width = art.width/2.8
			
			//creats player controles and event check
		//	addEventListener(Event.ENTER_FRAME, step);
		}
		public function step():void
		{
			if (onScreen)
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
					artchanged = false;
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
						artchanged = false;
					}
				}
				
				//Image Changer
				if (speed.$Y==0 && artchanged==false && g)
				{
					removeChild(art);
					art = new CharRun;
					addChild(art);
					artchanged = true
					art.height = art.height / 3
					art.width = art.width / 3
					art.x = 100
					art.y= 50
				}
				else if( artchanged==false)
				{
					removeChild(art);
					art = new CharFly;
					addChild(art);
					artchanged = true
					art.height = art.height / 3
					art.width = art.width /3
					art.x = 100
					art.y = 50
				}
				
				
				//this.x = 100
				
				
				//Movement
				speed.$X += speedup.$X;
				speed.$Y += speedup.$Y;
				
				this.x += speed.$X;
				this.y += speed.$Y;
			}
		}
	}

}