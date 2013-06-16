package Objects 
{
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import Objects.PartsBackground.Tree;
	
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Background extends MovieClip 
	{
		public var backgrounds:Array = [];
		private var Spawner:Timer;
		private var back:MovieClip
		private var spawningTrees:Boolean = false;
		private var speed:int = 5
		
		public function Background() 
		{
			Spawner = new Timer(1,1)
			Spawner.addEventListener(TimerEvent.TIMER, TreeSpawner);
		}
		
		private function TreeSpawner(e:TimerEvent):void 
		{
			var ran:Number = Math.random()*1
			Spawner = new Timer (1023 / speed, 1)
			
			if (ran < 1)
			{
				back = new Background1();
				addChild(back)
				backgrounds.push
			}
		}
		
		//public function run():void 
		//{
			//if (trees.length < 6 && spawningTrees==false)
			//{
				//treeSpawner.start()
				//spawningTrees = true
				//PlaceTree();
			//}
			//Doingstuff();
		//}
		//
		//public function PlaceTree():void
		//{
			//var tree:Tree = new Tree(Math.random() * 10 + 900, 1340, 30);
			//addChild(tree);
			//trees.push(tree);
			//
		//}
		//
		//private function Doingstuff():void
		//{
			//for (var i:int = trees.length; i < 0; i--) 
			//{
				//trees[i].move();
				//
				//if ( trees[i].y < -100)
				//{
					//removeChild(trees[i]);
					//trees.splice(i, 1);
				//}
			//}
		//}
	}

}