/* ----------------------------------------------------------------------------------------------------
 * This is the item class of the Corruption of Champions engine.
 * This determines what variables and functions all items will have.
 * 
 * Game made by Fenoxo.
 * Code rewritten by Seij Bleizkyn.
 * ---------------------------------------------------------------------------------------------------- */

package CoC_Engine.Item
{
	import CoC_Engine.Miscellaneous.Base001;

	public class Item extends Base001
	{
		protected var _CodeName:String = "";
		protected var _Amount:int = 0;
		protected var _LeftOver:int = 0;
		protected var _ItemLimit:int = 0; // The maximum number of this item in one stack.
		protected var _StackLimit:int = 0; // The maximum number of stacks of this item.
		protected var _Cost:int = 0;
		protected var _Type:Vector.<String> = new Vector.<String>();
		protected var _IngestType:Vector.<String> = new Vector.<String>();
		
		public function Item()
		{
			_EXISTING_FUNCTIONS = 5;
			var index = 0;
			
			for(index = 0; index < _EXISTING_FUNCTIONS; index += 1)
			{
				_Effect.push(new Function());
			}
		}
		
		public function get CodeName():String
		{
			return _CodeName;
		}
		
		public function set CodeName(n:String)
		{
			_CodeName = n;
		}
		
		public function get Amount():int
		{
			return _Amount;
		}
		
		public function set Amount(a:int)
		{
			if(a <= _ItemLimit)
			{
				_Amount = a;
			}
			else
			{
				_Amount = _ItemLimit;
			}
		}
		
		public function AddAmount(a:int)
		{
			if(_ItemLimit > 0)
			{
				/* --------------------------------------------------
				 * If the amount to be added plus the existing amount
				 * is less than the item's stackable limit.
				 * -------------------------------------------------- */
				if(a + _Amount <= _ItemLimit)
				{
					_Amount += a;
				}
				else
				{
					_LeftOver = a + _Amount - _ItemLimit;
					_Amount = _ItemLimit;
				}
			}
			else
			{
				_Amount += a;
				/* --------------------------------------------------
				 * If the item limit is less than or equal to 0, then
				 * add the amount to this item's amount without care.
				 * -------------------------------------------------- */
			}
		}
		
		public function get LeftOver():int
		{
			return _LeftOver;
		}
		
		public function set LeftOver(l:int)
		{
			_LeftOver = l;
		}
		
		public function get ItemLimit():int
		{
			return _ItemLimit;
		}
		
		public function set ItemLimit(l:int)
		{
			_ItemLimit = l;
		}
		
		public function get StackLimit():int
		{
			return _StackLimit;
		}
		
		public function set StackLimit(l:int)
		{
			_StackLimit = l;
		}
		
		public function get Cost():int
		{
			return _Cost;
		}
		
		public function set Cost(c:int)
		{
			_Cost = c;
		}
		
		public function get Type():Vector.<String>
		{
			return _Type;
		}
		
		public function set Type(t:Vector.<String>)
		{
			_Type = t;
		}
		
		public function get IngestType():Vector.<String>
		{
			return _IngestType;
		}
		
		public function set IngestType(t:Vector.<String>)
		{
			_IngestType = t;
		}
		
		public function get ItemEffect():Vector.<Function>
		{
			return _Effect;
		}
		
		public function set ItemEffect(f:Vector.<Function>)
		{
			_Effect = f;
		}
		
		public function get Use():Function
		{
			return _Effect[0];
		}
		
		public function set Use(f:Function)
		{
			_Effect[0] = f;
		}
		
		public function get GetItemDamage():Function
		{
			return _Effect[1];
		}
		
		public function set GetItemDamage(f:Function)
		{
			_Effect[1] = f;
		}
		
		public function get GetItemDefense():Function
		{
			return _Effect[2];
		}
		
		public function set GetItemDefense(f:Function)
		{
			_Effect[2] = f;
		}
		
		public function get GetItemArmour():Function
		{
			return _Effect[3];
		}
		
		public function set GetItemArmour(f:Function)
		{
			_Effect[3] = f;
		}
		
		public function get ApplyPassive():Function
		{
			return _Effect[4];
		}
		
		public function set ApplyPassive(f:Function)
		{
			_Effect[4] = f;
		}
	}
}