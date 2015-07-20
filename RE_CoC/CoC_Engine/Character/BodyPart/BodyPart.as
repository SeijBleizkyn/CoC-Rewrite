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
		protected var _Type:Vector.<String> = new Vector.<String>();
		protected var _Race:Vector.<String> = new Vector.<String>();
		protected var _Item:Item = new Item();
		
		public function BodyPart()
		{
			_ID = -1;
			_Name = "";
		}
		
		public function get Type():Vector.<String>
		{
			return _Type;
		}
		
		public function set Type(t:Vector.<String>)
		{
			_Type = t;
		}
		
		public function hasType(t:String):Boolean
		{
			var counter = 0;
			var tempBool = false;
			
			if(_Type.length > 0)
			{
				for(counter = 0; counter < _Type.length; counter += 1)
				{
					if(_Type[counter] == t)
					{
						tempBool = true;
					}
				}
			}
			else
			{
				tempBool = false;
			}
			
			return tempBool;
		}
		
		public function findType(t:String):int
		{
			var counter = 0;
			var tempInt = 0;
			
			if(_Type.length > 0)
			{
				for(counter = 0; counter < _Type.length; counter += 1)
				{
					if(_Type[counter] == t)
					{
						tempInt = counter;
					}
				}
			}
			else
			{
				tempInt = 0;
			}
			
			return tempInt;
		}
		
		public function clearType()
		{
			_Type = new Vector.<String>();
		}
		
		public function get Race():Vector.<String>
		{
			return _Race;
		}
		
		public function set Race(r:Vector.<String>)
		{
			_Race = r;
		}
		
		public function hasRace(r:String):Boolean
		{
			var counter = 0;
			var tempBool = false;
			
			if(_Race.length > 0)
			{
				for(counter = 0; counter < _Race.length; counter += 1)
				{
					if(_Race[counter] == r)
					{
						tempBool = true;
					}
				}
			}
			else
			{
				tempBool = false;
			}
			
			return tempBool;
		}
		
		public function findRace(r:String):int
		{
			var counter = 0;
			var tempInt = 0;
			
			if(_Race.length > 0)
			{
				for(counter = 0; counter < _Race.length; counter += 1)
				{
					if(_Race[counter] == r)
					{
						tempInt = counter;
					}
				}
			}
			else
			{
				tempInt = 0;
			}
			
			return tempInt;
		}
		
		public function clearRace()
		{
			_Race = new Vector.<String>();
		}
		
		public function get ItemSlot():Item
		{
			return _Item;
		}
		
		public function set ItemSlot(i:Item)
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
	}
}