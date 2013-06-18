package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.setTimeout;
	
	/**
	 * @author flashisobar
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			// init
			var counter:BaseCounter = new BaseCounter();
			counter.init(1234567890);
			addChild(counter);
			
			// show it
			setTimeout(function():void{
				counter.addPoint(15);
			}, 500);

		}
		
	}
	
}