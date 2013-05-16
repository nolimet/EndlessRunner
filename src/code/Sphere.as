package  code
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Sphere extends Sprite
	{
		public var kleur:uint;
		public var straal:Number;
		
		
		public function Sphere($x:Number, $y:Number, straal:Number, kleur:uint)
		{
		this.straal = straal;
		this.kleur = kleur;
		this.x = $x
		this.y = $y
		
		this.graphics.lineStyle(5);
		this.graphics.beginFill(this.kleur);
		this.graphics.drawCircle(0, 0, this.straal);
		}

	}
}