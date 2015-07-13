/* ----------------------------------------------------------------------------------------------------
 * This should be attached to the GUI_Stat MovieClip in "RE_CoC.fla.".
 * How all core stats look in the game is done from here.
 * It is basically a template for the core stats in the game.
 * 
 * Game made by Fenoxo.
 * Code rewritten by Seij Bleizkyn.
 * ---------------------------------------------------------------------------------------------------- */

package CoC_Engine.GUI
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flashx.textLayout.formats.Float;
	
	public class GUI_Stat extends Sprite
	{
		private const STAT_BAR_MULTIPLIER:Number = 1.15;
		private var _maxBarWidth = 115.0;
		private var _maxNum:Number = 100.0;
		
		public function GUI_Stat()
		{
			_statName.text = "-";
			_statNum.text = "10";
			_showNoIcon();
			
			addEventListener(Event.ENTER_FRAME, Update);
		}
		
		private function Update(event:Event)
		{
			_updateBarWidth();
		}
		
		public function get statName():String
		{
			return _statName.text;
		}
		
		public function set statName(n:String)
		{
			_statName.text = n;
		}
		
		public function get statNum():Number
		{
			return Number(_statNum.text);
		}
		
		public function set statNum(n:Number)
		{
			_statNum.text = n.toString();
		}
		
		private function _updateBarWidth()
		{
			var tempNumber:Number = Number(_statNum.text) / _maxNum;
			_statBar.width = _maxBarWidth * tempNumber;
		}
		
		public function get maxBarWidth():Number
		{
			return _maxBarWidth;
		}
		
		public function set maxBarWidth(w:Number)
		{
			_maxBarWidth = w;
		}
		
		public function get maxNum():Number
		{
			return _maxNum;
		}
		
		public function set maxNum(n:Number)
		{
			_maxNum = n;
		}
		
		public function _showUpIcon()
		{
			_statUp.alpha = 1;
			_statDown.alpha = 0;
		}
		
		public function _showDownIcon()
		{
			_statUp.alpha = 0;
			_statDown.alpha = 1;
		}
		
		public function _showNoIcon()
		{
			_statUp.alpha = 0;
			_statDown.alpha = 0;
		}
	}
}