/* ----------------------------------------------------------------------------------------------------
 * This is the game frame time class of the Corruption of Champions engine.
 * 
 * Game made by Fenoxo.
 * Code rewritten by Seij Bleizkyn.
 * ---------------------------------------------------------------------------------------------------- */

package CoC_Engine.Miscellaneous
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.getTimer;
	
	public class FrameTime extends Sprite
	{
		private var _CurrentTime:Number;
		private var _PreviousTime:Number;
		private var _FrameTime:Number;
		
		public function FrameTime()
		{
			_CurrentTime = 0;
			_PreviousTime = 0;
			addEventListener(Event.ENTER_FRAME, Update);
		}
		
		private function Update(event:Event)
		{
			_CurrentTime = getTimer();
			_FrameTime = (_CurrentTime - _PreviousTime) / 1000.0;
			_PreviousTime = _CurrentTime;
		}
		
		public function get frameTime():Number
		{
			return _FrameTime;
		}
	}
}