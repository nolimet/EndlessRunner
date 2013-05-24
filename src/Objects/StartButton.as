package Objects 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class StartButton extends Sprite
	{
		public var clicked:Boolean = false;
		
		public function StartButton() 
		{
			this.addEventListener(MouseEvent.MOUSE_DOWN, MouseClick);
		}
		
		public function MouseClick(e:MouseEvent)
		{
			clicked:Boolean = true;
		}
		
	}

}