/* ----------------------------------------------------------------------------------------------------
 * This is the perk class of the Corruption of Champions engine.
 * This determines what variables and functions all perks will have.
 * 
 * Game made by Fenoxo.
 * Code rewritten by Seij Bleizkyn.
 * ---------------------------------------------------------------------------------------------------- */

package CoC_Engine.Perk
{
	import CoC_Engine.Miscellaneous.Base001;

	public class Perk extends Base001
	{
		private var _Applied:Boolean; // Marks if the perk has been applied to the character.
		
		public function Perk()
		{
		}
		
		public function get Applied():Boolean
		{
			return _Applied;
		}
		
		public function set Applied(a:Boolean)
		{
			_Applied = a;
		}
		
		public function get PerkEffect():Vector.<Function>
		{
			return _Effect;
		}
		
		public function set PerkEffect(f:Vector.<Function>)
		{
			_Effect = f;
		}
	}
}