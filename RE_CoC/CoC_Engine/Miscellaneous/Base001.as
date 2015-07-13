/* ----------------------------------------------------------------------------------------------------
 * This is the base001 class of the Corruption of Champions engine.
 * This can be used as a base class to inherit off by classes like Item, Ability, BodyPart, and Perk.
 * 
 * Game made by Fenoxo.
 * Code rewritten by Seij Bleizkyn.
 * ---------------------------------------------------------------------------------------------------- */

package CoC_Engine.Miscellaneous
{
	public class Base001
	{
		protected var _EXISTING_FUNCTIONS:int = 0;
		
		protected var _ID:int;
		protected var _Name:String;
		protected var _Value:Vector.<Vector.<Number>> = new Vector.<Vector.<Number>>();
		protected var _Flag:Vector.<Vector.<Boolean>> = new Vector.<Vector.<Boolean>>();
		protected var _Description:Vector.<Vector.<String>> = new Vector.<Vector.<String>>;
		protected var _Effect:Vector.<Function> = new Vector.<Function>();
		
		public function Base001()
		{
		}
		
		public function get ID():int
		{
			return _ID;
		}
		
		public function set ID(i:int)
		{
			_ID = i;
		}
		
		public function get Name():String
		{
			return _Name;
		}
		
		public function set Name(n:String)
		{
			_Name = n;
		}
		
		public function get Value():Vector.<Vector.<Number>>
		{
			return _Value;
		}
		
		public function set Value(v:Vector.<Vector.<Number>>)
		{
			_Value = v;
		}
		
		public function get Flag():Vector.<Vector.<Boolean>>
		{
			return _Flag;
		}
		
		public function set Flag(f:Vector.<Vector.<Boolean>>)
		{
			_Flag = f;
		}
		
		public function get Description():Vector.<Vector.<String>>
		{
			return _Description;
		}
		
		public function set Description(d:Vector.<Vector.<String>>)
		{
			_Description = d;
		}
	}
}