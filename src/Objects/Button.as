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
		private var art:MovieClip;
		
		public function Button($x:Number, $y:Number, type:int)
		{
			this.y = $y;
			this.x = $x;
			if (type == 1)
			{
				art = new startbutton();
				art.height = art.height * 6
				art.width = art.width * 6
			}
			if (type == 2)
			{
				art = new restartknop();
				art.height = art.height * 6;
				art.width = art.width * 6;
			}
			addChild(art)
			art.addEventListener(MouseEvent.MOUSE_DOWN, MouseClick);
		}
		
		public function MouseClick(e:MouseEvent):void
		{
			clicked = !clicked;
		}
		
	}

}