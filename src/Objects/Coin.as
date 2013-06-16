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
	public class Coin extends Sprite
	{
		public var speed:Number = 5;
		public var negative:Boolean = false;
		//private var Coinart:MovieClip = new coinart()
		private var Coinart:MovieClip;
		
		
		public function Coin($x:Number, $y:Number, score:Number)
		{
			this.x = $x;
			this.y = $y;
			
			var ranart:int = Math.random()*3
			
			var chance:Number = 9001 / (score/2)
			if (chance < 5) { chance = 5 }
			
			if (1 > Math.random() * chance) { negative = !negative };
			
			if (negative) { Coinart = new RotteAppel(); }
			else if(ranart <1 ){ Coinart = new Blauwsnoepje() }
			else if(ranart >=1 && ranart<2 ){ Coinart = new chocopudi()  }
			else if(ranart >=2 && ranart<3 ){ Coinart = new snoepje1()  }
			
			//trace(chance)
			addChild(Coinart);
		}
		
		public function step():void
		{
			this.x -= speed
		}
	}

}