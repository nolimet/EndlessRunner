package Objects 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Button extends Sprite
	{
		public var clicked:Boolean = false;
		private var art:MovieClip = new StartArt();
		
		public function Button($x:Number, $y:Number, type:int)
		{
			this.y = $y;
			this.x = $x;
			//if
			addChild(art)
			art.addEventListener(MouseEvent.MOUSE_DOWN, MouseClick);
		}
		
		public function MouseClick(e:MouseEvent):void
		{
			clicked = !clicked;
		}
		
	}

}