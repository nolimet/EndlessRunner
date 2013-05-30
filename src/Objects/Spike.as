package Objects 
{
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	/**
	 * ...
	 * @author kerim birlik
	 */
	public class Spike extends MovieClip
	{
		private var art:MovieClip;
		public function Spike() 
		{
			art = new SpikeArt();
			addChild(art);
		}
		
		public function move(speed:Number);
		{
		this.x += speed;
		}
		
	}

}