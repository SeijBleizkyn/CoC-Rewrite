/* ----------------------------------------------------------------------------------------------------
 * This is the ability class of the Corruption of Champions engine.
 * This determines what variables and functions all abilities will have, be them a physical skill or a
 * magical one. It is the core of the moves any character in the game can do.
 * 
 * Game made by Fenoxo.
 * Code rewritten by Seij Bleizkyn.
 * ---------------------------------------------------------------------------------------------------- */

package CoC_Engine.Ability
{
	import CoC_Engine.Ability.Ability_Type;
	import CoC_Engine.Miscellaneous.Base001;
	
	public class Ability extends Base001
	{
		private var _Type:Vector.<String> = new Vector.<String>();
		
		public function Ability()
		{
		}
		
		public function get Type():Vector.<String>
		{
			return _Type;
		}
		
		public function set Type(t:Vector.<String>)
		{
			_Type = t;
		}
		
		public function get AbilityEffect():Vector.<Function>
		{
			return _Effect;
		}
		
		public function set AbilityEffect(f:Vector.<Function>)
		{
			_Effect = f;
		}
	}
}