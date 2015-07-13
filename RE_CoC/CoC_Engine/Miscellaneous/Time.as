/* ----------------------------------------------------------------------------------------------------
 * This is the time class.
 * It's used to store and format time values.
 * 
 * Game made by Fenoxo.
 * Code rewritten by Seij Bleizkyn.
 * ---------------------------------------------------------------------------------------------------- */

package CoC_Engine.Miscellaneous
{
	import flash.events.Event;
	
	public class Time
	{
		private var _Hour:int = 0;
		private var _Minute:int = 0;
		private var _24HourMode:Boolean = true;
		private var _HourLimit:int = 24;
		
		public function Time()
		{
		}
		
		public function get Hour():int
		{
			return _Hour;
		}
		
		public function set Hour(h:int)
		{
			if(!FixHour())
			{
				_Hour = h;
			}
		}
		
		public function AddHour(h:int)
		{
			var tempHour:int = h;
			
			while(tempHour != 0)
			{
				if(tempHour > 0)
				{
					while(_Hour + tempHour > _HourLimit)
					{
						FixHour();
						if(_HourLimit == _Hour)
						{
							_Hour = 0;
						}
						tempHour -= _HourLimit - _Hour;
						_Hour = 0;
						FixHour();
					}
					_Hour += tempHour;
					tempHour = 0;
				}
				else
				{
					if(tempHour - _Hour <= 0)
					{
						_Hour = 0;
						FixHour();
					}
					else
					{
						_Hour -= tempHour;
					}
				}
			}
		}
		
		private function FixHour():Boolean
		{
			if(_24HourMode)
			{
				if(_Hour >= _HourLimit || _Hour < 0)
				{
					_Hour = 0;
					return true;
				}
			}
			else
			{
				if(_Hour >= _HourLimit || _Hour <= 0)
				{
					_Hour = _HourLimit;
					return true;
				}
			}
			return false;
		}
		
		public function get Minute():int
		{
			return _Minute;
		}
		
		public function set Minute(m:int)
		{
			_Minute = m;
			FixMinute();
		}
		
		public function AddMinute(m:int)
		{
			var tempMinute:int = m;
			
			if(tempMinute > 0)
			{
				while(_Minute + tempMinute > 60)
				{
					FixMinute();
					tempMinute -= 60 - _Minute;
					_Minute = 0;
					AddHour(1);
				}
				_Minute += tempMinute;
				tempMinute = 0;
			}
			else
			{
				if(tempMinute - _Hour <= 0)
				{
					_Minute = 0;
				}
				else	
				{
					_Minute -= tempMinute;
				}
			}
		}
		
		private function FixMinute()
		{
			if(_Minute < 0 || _Minute >= 60)
			{
				_Minute = 0;
			}
		}
		
		public function get Is24HourMode():Boolean
		{
			return _24HourMode;
		}
		
		public function set Is24HourMode(h:Boolean)
		{
			_24HourMode = h;
			if(!_24HourMode)
			{
				_HourLimit = 12;
			}
			else
			{
				_HourLimit = 24;
			}
		}
		
		public function get TimeString():String
		{
			FixHour();
			FixMinute();
			
			var tempHour:String = _Hour.toString();
			var tempMinute:String = _Minute.toString();
			
			if(_Hour < 10)
			{
				tempHour = "0" + _Hour;
			}
			if(_Minute < 10)
			{
				tempMinute = "0" + _Minute;
			}
			
			return tempHour + ":" + tempMinute;
		}
	}
}