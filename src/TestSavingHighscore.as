package  
{
	//import flash.net.SharedObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class TestSavingHighscore extends Sprite
	{
		
		private var test:Array = []
		
		public function TestSavingHighscore() 
		{
			for (var i:int = -1; i <9000 ; i++) 
			{
				test.push(i);
			}
			trace(test);
			
		}
				//
		//private function KeyPressed(e:KeyboardEvent):void
		//{
			//
		//}
		//
		//private function KeyRelease(e:KeyboardEvent):void
		//{
			//
		//}
		//
		//private function read()
		//{
			//sharedObjects = SharedObject.getLocal("HighScore");
			//
		//}
		//private function write( WriteVal:Number):void
		//{
			//
		//}
	}

}