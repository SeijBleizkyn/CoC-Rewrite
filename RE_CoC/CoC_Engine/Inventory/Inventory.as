/* ----------------------------------------------------------------------------------------------------
 * This is the inventory class of the Corruption of Champions engine.
 * This determines what variables and functions an inventory should have.
 * 
 * Game made by Fenoxo.
 * Code rewritten by Seij Bleizkyn.
 * ---------------------------------------------------------------------------------------------------- */

package CoC_Engine.Inventory
{
	import CoC_Engine.Item.Item;
	
	public class Inventory
	{
		protected var _Limit:int = 1;
		protected var _Item:Vector.<Item> = new Vector.<Item>();
		
		public function Inventory()
		{
		}
		
		public function get Limit():int
		{
			return _Limit;
		}
		
		public function set Limit(l:int)
		{
			_Limit = l;
		}
		
		public function AddItem(i:Item, amount:int)
		{
			var index:int = 0;
			var found:Boolean = false;
			var foundIndex:int = 0;
			
			/* --------------------------------------------------
			 * This part is for checking to see if the item is
			 * already in the inventory, if it is then the
			 * boolean "found" is marked as true.
			 * 
			 * Note: This will mark the last found item stack in
			 * the inventory, rather than the first.
			 * -------------------------------------------------- */
			for(index = 0; index < _Item.length; index += 1)
			{
				if(_Item[index].ID == i.ID)
				{
					found = true;
					foundIndex = index;
				}
			}
			
			/* --------------------------------------------------
			 * If it ISN'T found, then we only add the item into
			 * the inventory if adding the item does not exceed
			 * the limit. Also, it is only added if the amount is
			 * a positive number.
			 * 
			 * If it IS found, then we add to that item instead.
			 * -------------------------------------------------- */
			if(!found)
			{
				if(amount > 0)
				{
					if(_Limit > 0)
					{
						if(_Item.length < _Limit)
						{
							_Item.push(i);
							_Item[_Item.length - 1].Amount = 0;
							_Item[_Item.length - 1].AddAmount(amount);
							StackItems(_Item.length - 1);
						}
					}
					else
					{
						_Item.push(i);
						_Item[_Item.length - 1].Amount = 0;
						_Item[_Item.length - 1].AddAmount(amount);
						StackItems(_Item.length - 1);
					}
				}
			}
			else
			{
				if(amount > 0)
				{
					_Item[foundIndex].AddAmount(amount);
					StackItems(foundIndex);
				}
				else if (amount < 0)
				{
					// If there are more existing item than the subtracting amount.
					if(-_Item[foundIndex].Amount < amount)
					{
						_Item[foundIndex].AddAmount(amount);
						/* --------------------------------------------------
						 * I am adding the amount instead of subtracting it
						 * because the amount is negative.
						 * -------------------------------------------------- */
					}
					else if(-_Item[foundIndex].Amount > amount)
					{
						// If there's a previous stack of the same item.
						if(_Item[foundIndex].ID == _Item[foundIndex - 1].ID)
						{
							var tempInt:int = amount + _Item[foundIndex].Amount;
							_Item[foundIndex - 1].AddAmount(tempInt); // tempInt should always be a negative integer.
						}
						_Item.splice(foundIndex, 1); // Kill the item completely.
					}
				}
			}
		}
		
		private function StackItems(i:int):Number
		{
			var tempIndex:int = i;
			var tempIndex2:int = 0;
			var noOfStacks:int = 0;
			var tempID:int = _Item[i].ID;
			var tempErrorCode = 0;
			
			// Find the amount of stacks of the item already in the inventory.
			for(tempIndex2 = 0; tempIndex2 < _Item.length; tempIndex2 += 1)
			{
				if(_Item[tempIndex2].ID == tempID)
				{
					noOfStacks += 1;
				}
			}
			
			// While there are left over items. Also meaning that the stack is full.
			while(_Item[tempIndex].LeftOver > 0)
			{
				// If the amount of stacks of the item does not exceed the item's stack limit.
				if(noOfStacks < _Item[tempIndex].StackLimit || _Item[tempIndex].StackLimit < 0)
				{
					_Item.splice(tempIndex, 0, _Item[tempIndex]); // Make a new stack right after the old one.
					noOfStacks += 1; // Increasing the number of stacks by one.
					_Item[tempIndex + 1].Amount = 0; // Reset the new stack's item amount.
					_Item[tempIndex + 1].LeftOver = 0; // Reset the new stack's leftover item amount.
					_Item[tempIndex + 1].AddAmount(_Item[tempIndex].LeftOver);
					/* --------------------------------------------------
					 * Add the old item's stack's left over to the new
					 * stack's amount.
					 * -------------------------------------------------- */
					 
					_Item[tempIndex].LeftOver = 0; // Clear the old stack's left over item amount.
					tempIndex += 1; // Jump the index to the new stack.
				}
				else
				{
					_Item[tempIndex].LeftOver = 0;
					tempErrorCode = 1;
				}
			}
			
			return tempErrorCode;
		}
		
		public function GetItem(i:int):Item
		{
			return _Item[i];
		}
		
		public function FindItem(i:int):Item
		{
			var index:int = 0;
			var finalIndex:int = 0;
			
			for(index = 0; index < _Item.length; index += 1)
			{
				if(_Item[index].ID == i)
				{
					finalIndex = index;
				}
			}
			
			return _Item[finalIndex];
		}
		
		public function HasItem(i:int):Boolean
		{
			var index = 0;
			for(index = 0; index < _Item.length; index += 1)
			{
				if(_Item[index].ID == i)
				{
					return true;
				}
			}
			return false;
		}
	}
}