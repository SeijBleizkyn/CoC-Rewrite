/* ----------------------------------------------------------------------------------------------------
 * This is the body parts base class of the Corruption of Champions engine.
 * This determines what variables and functions all body parts will have.
 * 
 * Game made by Fenoxo.
 * Code rewritten by Seij Bleizkyn.
 * ---------------------------------------------------------------------------------------------------- */

package CoC_Engine.Character.BodyPart
{
	import CoC_Engine.Miscellaneous.Base001;
	import CoC_Engine.Item.Item;

	public class BodyPart extends Base001
	{
		protected var _Type:Vector.<Vector.<String>> = new Vector.<Vector.<String>>;
		protected var _Race:Vector.<Vector.<String>> = new Vector.<Vector.<String>>;
		protected var _Item:Vector.<Item> = new Vector.<Item>;
		
		public function BodyPart()
		{
			_ID = 0;
			_Name = "";
			_EXISTING_FUNCTIONS = 3;
			var index = 0;
			
			for(index = 0; index < _EXISTING_FUNCTIONS; index += 1)
			{
				_Effect.push(new Function());
			}
		}
		
		public function get Type():Vector.<Vector.<String>>
		{
			return _Type;
		}
		
		public function set Type(t:Vector.<Vector.<String>>)
		{
			_Type = t;
		}
		public function get Race():Vector.<Vector.<String>>
		{
			return _Race;
		}
		
		public function set Race(r:Vector.<Vector.<String>>)
		{
			_Race = r;
		}
		
		public function get ItemSlot():Vector.<Item>
		{
			return _Item;
		}
		
		public function set ItemSlot(i:Vector.<Item>)
		{
			_Item = i;
		}
		
		public function get BodyEffect():Vector.<Function>
		{
			return _Effect;
		}
		
		public function set BodyEffect(f:Vector.<Function>)
		{
			_Effect = f;
		}
		
		public function get GetAdjective():Function
		{
			return _Effect[0];
		}
		
		public function set GetAdjective(f:Function)
		{
			_Effect[0] = f;
		}
		
		public function get GetNoun():Function
		{
			return _Effect[1];
		}
		
		public function set GetNoun(f:Function)
		{
			_Effect[1] = f;
		}
		
		public function get AddBodyPart():Function
		{
			return _Effect[2];
		}
		
		public function set AddBodyPart(f:Function)
		{
			_Effect[2] = f;
		}
	}
}