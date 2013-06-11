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
		public var trees:Array = [];
		private var treeSpawner:Timer;
		private var spawningTrees:Boolean = false;
		
		public function Background() 
		{
			//eeSpawner=new Timer(2500 + 300 * Math.random(),1)
			//treeSpawner.addEventListener(TimerEvent.TIMER, TreeSpawner);
		}
		
		//private function TreeSpawner(e:TimerEvent):void 
		//{
			//PlaceTree()
			//spawningTrees = false;
			//treeSpawner = new Timer(2500 + 300 * Math.random(),1);
			//treeSpawner.stop()
		//}
		//
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