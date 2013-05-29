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
		public var line:Number
		
		
		public function Sphere($x:Number, $y:Number, straal:Number, kleur:uint, line:Number=0)
		{
		this.straal = straal;
		this.kleur = kleur;
		this.x = $x
		this.y = $y
		this.line = line;
		
		this.graphics.lineStyle(this.line);
		this.graphics.beginFill(this.kleur);
		this.graphics.drawCircle(this.x, this.y, this.straal);
		}

	}
}