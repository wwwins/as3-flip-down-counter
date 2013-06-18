package 
{
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * flash flip-down effect for digital number
	 * @author flashisobar
	 */
	public class BaseCounter extends MovieClip 
	{
		// ten digit number
		private const DIGIT_NUMBER:uint = 10;
		
		// 每個數字的動態時間(ms)
		private const TIME_OF_ANIMATION:Number = 500;
		
		// 每個數字的間距
		private const DIGIT_OFFSET_X:Number = 37;
		
		private var tm: Timer;
		private var arrDigit:Array;
		
		// 目前顯示點數
		private var _currPoint:uint;
		// 最後顯示點數
		private var _finalPoint:uint;
		
		private var container:MovieClip;

		public function BaseCounter() 
		{
			//init(1234567890);
		}
		
		public function init(__p:uint):void 
		{
			// set layout
			layout()
			
			// init timer
			initTimer();

			// init Digit
			initDigit(__p);
		}
		
		private function layout():void 
		{
			container = new MovieClip();
			addChild(container);
			
			arrDigit = [];
			var d:Digit;
			var i:int = DIGIT_NUMBER;
			while (i > 0) 
			{
				d = new Digit();
				d.x = DIGIT_OFFSET_X * (i - 1);
				arrDigit.push(d);
				container.addChild(d);
				i--;
			}
		}
		
		private function initTimer():void 
		{
			tm = new Timer(TIME_OF_ANIMATION);
			tm.addEventListener(TimerEvent.TIMER, timerHandler);
		}
		
		private function initDigit(__p:uint):void 
		{
			_currPoint = __p;
			var buf:String = String(__p);
			while (buf.length < DIGIT_NUMBER) buf = "0" + buf;
			var i:int = DIGIT_NUMBER;
			while (i > 0)
			{
				Digit(arrDigit[i - 1]).setNumber(int(buf.charAt(buf.length - i)));
				i--;
			}
		}
		
		private function timerHandler(e:TimerEvent):void 
		{
			if (_currPoint >= _finalPoint) {
				tm.stop();
				return;
			}
			
			_currPoint++;
			var buf:String = String(_currPoint);
			while (buf.length < DIGIT_NUMBER) buf = "0" + buf;
			var i:int = DIGIT_NUMBER;
			while (i > 0) 
			{
				Digit(arrDigit[i - 1]).playToNumber(int(buf.charAt(buf.length - i)));
				i--;
			}
		}

		/**
		 * add point
		 * @param	__p
		 */
		public function addPoint(__p:uint):void 
		{
			_finalPoint = _currPoint + __p;
			tm.start();
		}
		
		public function destroy():void 
		{
			tm.removeEventListener(TimerEvent.TIMER, timerHandler);
		}
		
	}

}