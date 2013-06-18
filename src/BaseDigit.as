package 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author flashisobar
	 */
	public class BaseDigit extends MovieClip 
	{
		// 數子上半部
		public var top1:MovieClip;
		// 數子上半部 + 1
		public var top2:MovieClip;
		// 數子下半部 + 1
		public var bottom1:MovieClip;
		// 數子下半部
		public var bottom2:MovieClip;
		// 目前數字
		private var _currNum:uint;
		
		public function BaseDigit() 
		{
		}
		
		/**
		 * 直接顯示點數(不播動態)
		 * @param	__num
		 */
		public function setNumber(__num:uint):void 
		{
			_currNum = __num;
			var fn:uint = 1 + __num;
			top1.gotoAndStop(fn);
			top2.gotoAndStop(1 + fn);
			bottom1.gotoAndStop(1 + fn);
			bottom2.gotoAndStop(fn);
		}
		
		/**
		 * 顯示點數(播放動態)
		 * @param	__num
		 */
		public function playToNumber(__num:uint):void 
		{
			if (_currNum == __num)
				return;

			_currNum = __num;
			setNumber(__num - 1);
			gotoAndPlay(2);
			_currNum = __num;
		}
		
	}

}