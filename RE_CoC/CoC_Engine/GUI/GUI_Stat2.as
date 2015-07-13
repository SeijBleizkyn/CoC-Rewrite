/* ----------------------------------------------------------------------------------------------------
 * This should be attached to the GUI_Stat2 MovieClip in "RE_CoC.fla.".
 * How all advancement stats look in the game is done from here.
 * It is basically a template for the advancement stats in the game.
 * 
 * Game made by Fenoxo.
 * Code rewritten by Seij Bleizkyn.
 * ---------------------------------------------------------------------------------------------------- */

package CoC_Engine.GUI
{
	import flash.display.Sprite;
	
	public class GUI_Stat2 extends Sprite
	{
		
		public function GUI_Stat2()
		{
			_statName.text = "-";
			_statNum.text = "10";
			_showNoIcon();
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