/* ----------------------------------------------------------------------------------------------------
 * This is the container base class of the Corruption of Champions game.
 * This determines what variables and functions all bodypart containers will have.
 * 
 * Game made by Fenoxo.
 * Code rewritten by Seij Bleizkyn.
 * ---------------------------------------------------------------------------------------------------- */

package CoC_Engine.Character.BodyPart
{
	public class Container
	{
		protected var _Name:String;
		
		public function Container()
		{
			_Name = "";
		}
		
		public function get Name():String
		{
			return _Name;
		}
		
		public function set Name(s:String)
		{
			_Name = s;
		}
		
		public function DoTimeLapsed(hours:int)
		{
		}
		
		public function DoOneHourLapsed()
		{
		}
	}
}