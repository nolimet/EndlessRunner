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
			
			//if(ranart <1 && negative){ Coinart = new RotteAppel() }
			if(negative){ Coinart = new RotteAppel() }
			//if(ranart >=1 && ranart<2 && negative){ Coinart = new Wortel()  }
			//if (ranart >= 2 && ranart < 3 && negative) { Coinart = new Sla()  }
			
			if(ranart <1 && negative == false){ Coinart = new Blauwsnoepje() }
			if(ranart >=1 && ranart<2 && negative == false){ Coinart = new chocopudi()  }
			if(ranart >=2 && ranart<3 && negative == false){ Coinart = new snoepje1()  }
			
			//trace(chance)
			addChild(Coinart);
		}
		
		public function step():void
		{
			this.x -= speed
		}
	}

}