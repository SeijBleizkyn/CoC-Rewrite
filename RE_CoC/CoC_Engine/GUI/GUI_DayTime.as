/* ----------------------------------------------------------------------------------------------------
 * This should be attached to the GUI_DayTime MovieClip in "RE_CoC.fla.".
 * 
 * Game made by Fenoxo.
 * Code rewritten by Seij Bleizkyn.
 * ---------------------------------------------------------------------------------------------------- */

package CoC_Engine.GUI
{
	import flash.display.Sprite;
	import CoC_Engine.Miscellaneous.Time;
	import flash.events.Event;
	
	public class GUI_DayTime extends Sprite
	{
		private var _Day:int = 0;
		private var _Time:Time = new Time();
		private const _DAY_TEXT:String = "DAY #: ";
		private const _TIME_TEXT:String = "TIME : ";
		
		public function GUI_DayTime()
		{
			addEventListener(Event.ENTER_FRAME, Update);
		}
		
		public function get Day():int
		{
			return _Day;
		}
		
		public function set Day(d:int)
		{
			_Day = d;
		}
		
		public function AddDay(d:int)
		{
			if(_Day + d >= 0)
			{
				_Day += d;
			}
			else
			{
				_Day = 0;
			}
		}
		
		public function get Hour():int
		{
			return _Time.Hour;
		}
		
		public function set Hour(h:int)
		{
			_Time.Hour = h;
		}
		
		public function AddHour(h:int)
		{
			_Time.AddHour(h);
		}
		
		public function get Minute():int
		{
			return _Time.Minute;
		}
		
		public function set Minute(m:int)
		{
			_Time.Minute = m;
		}
		
		public function AddMinute(m:int)
		{
			_Time.AddMinute(m);
		}
		
		private function Update(event:Event)
		{
			DayText.text = _DAY_TEXT + _Day;
			TimeText.text = _TIME_TEXT + _Time.TimeString;
		}
	}
}