_GAME_Items.push(new Item());

i = _GAME_Items.length - 1;
/* --------------------------------------------------
 * Ensuring that "i" is pointing at the position of
 * the item that has just been made.
 * -------------------------------------------------- */

_GAME_Items[i].ID = i;
/* --------------------------------------------------
 * Don't change this. This is the in-game ID of the
 * item. It is set to be the nth - 1 number of item
 * added into the game. So if this is the 500th item
 * being added into the game, it's ID will be 499.
 * -------------------------------------------------- */

/* ---------------------------------------------------------------------------------------------------- */

_GAME_Items[i].Name = "All-Natural Self-Stimulation Belt"; // The name of the item.
_GAME_Items[i].CodeName = "AN Stim-Belt"; // The code name of the item. What shows up on the buttons.

_GAME_Items[i].Value.push(1); // 0 - Libido gain from first time use.
_GAME_Items[i].Value.push(-0.5); // 1 - Sensitivity loss from first time use.

_GAME_Items[i].Value.push(-1); // 2 - Libido loss from low corruption use.
_GAME_Items[i].Value.push(0.75); // 3 - Sensitivity gain from low corruption use.
_GAME_Items[i].Value.push(1); // 4 - Corruption gain from low corruption use.

_GAME_Items[i].Value.push(-0.5); // 5 - Libido loss from high corruption use.
_GAME_Items[i].Value.push(1); // 6 - Sensitivity gain from high corruption use.
_GAME_Items[i].Value.push(1.5); // 7 - Corruption gain from high corruption use.
/* --------------------------------------------------
 * If the item has any effects, and you need to store
 * the value of the effect, store it here. If it
 * doesn't, then don't worry about it. Skip this,
 * otherwise, read on.
 * 
 * For example: If a consumable item gives 5 strength
 * and 10 speed when consumed, then you can add these
 * values by using this "Value.push()".
 * 
 * This is how you do it:
 * _GAME_Items[i].Value.push(5);
 * _GAME_Items[i].Value.push(10);
 * Now all you got to remember is the order in which
 * you have added them in. The value 5 will be in the
 * 0th spot, while 10 is in the 1st. To get them, use
 * "Value[]".
 * 
 * Say you want to get the strength value that the
 * item gives, you'll want to do this:
 * _GAME_Items[i].Value[0];
 * as the strength value (5) is in the 0th spot.
 * And:
 * _GAME_Items[i].Value[1];
 * for the speed value (10) in the 1st spot.
 * -------------------------------------------------- */

_GAME_Items[i].Flag.push(true); // 0 - First time using this item?
/* --------------------------------------------------
 * Same as above, except you're adding in boolean
 * values; true or false.
 * -------------------------------------------------- */

_GAME_Items[i].Description.push("This is a self-stimulation belt. Commonly referred to as stim-belts, these are clockwork devices designed to pleasure the female anatomy."); // 0 - This is what's displayed in the pop-up text.

_GAME_Items[i].Amount = 1; // The default stack amount the item has.
_GAME_Items[i].ItemLimit = 1; // The maximum amount this item can stack in the inventory.
_GAME_Items[i].StackLimit = 1; // The maximum amount of stacks of this item that can exist in the inventory. Negative value for infinite.
_GAME_Items[i].Cost = 40; // Value of the item. As in how many gems it costs.
_GAME_Items[i].Type.push(Item_Type._KEY); // 0 - Key item.
// _GAME_Items[i].IngestType.push(Food_Type._UNKNOWN); // 0 - Unknown.
// _GAME_Items[i].IngestType.push(Drink_Type._UNKNOWN); // 1 - Unknown.

/* --------------------------------------------------
 * The functions' name should always be (for
 * consistency's sake) the name of the item plus what
 * ever it does. However, because it's a function,
 * you can't put spaces in this function's name.
 * Instead, you should use underscores for spaces. An
 * underscore looks like this: _
 * Also, you can't use hyphens either (A hyphen: -).
 * So use underscores for those too.
 * 
 * These functions are for telling the game what
 * these items can do.
 * -------------------------------------------------- */
function All_Natural_Self_Stimulation_Belt_Use(c:Character)
{
	// NOTE: You can't use "i" here for the index number of _GAME_Items. Use the item ID.
	//       Find it in ...\CoC_Game\Items\ItemList.as
	
	var index:int = 2;
	
	if(c.inventory[1].HasItem(index))
	{
		// If it's the first time using this item for this character...
		if(c.inventory[1].FindItem(index).Flag[0])
		{
			_GAME_StatsQueue[4]	+= _GAME_Items[index].Value[0];
			c.Libido			+= _GAME_Items[index].Value[0];
			_GAME_StatsQueue[5]	+= _GAME_Items[index].Value[1];
			c.Sensitivity		+= _GAME_Items[index].Value[1];
			
			c.inventory[1].FindItem(index).Flag[0] = false; // Set the character's key inventory's All-Natural Self-Stimulation Belt's "first use" to false.
		}
		// If it's not, and corruption is lower than 50...
		else if(c.Corruption < 50)
		{
			_GAME_StatsQueue[4]	+= _GAME_Items[index].Value[2];
			c.Libido			+= _GAME_Items[index].Value[2];
			_GAME_StatsQueue[5]	+= _GAME_Items[index].Value[3];
			c.Sensitivity		+= _GAME_Items[index].Value[3];
			_GAME_StatsQueue[6]	+= _GAME_Items[index].Value[4];
			c.Corruption		+= _GAME_Items[index].Value[4];
		}
		// If it's not, and corruption is 50 or higher...
		else if(c.Corruption >= 50)
		{
			_GAME_StatsQueue[4]	+= _GAME_Items[index].Value[5];
			c.Libido			+= _GAME_Items[index].Value[5];
			_GAME_StatsQueue[5]	+= _GAME_Items[index].Value[6];
			c.Sensitivity		+= _GAME_Items[index].Value[6];
			_GAME_StatsQueue[6]	+= _GAME_Items[index].Value[7];
			c.Corruption		+= _GAME_Items[index].Value[7];
		}
	}
}

function All_Natural_Self_Stimulation_Belt_GetDamage():Number
{
	// NOTE: You can't use "i" here for the index number of _GAME_Items. Use the item ID.
	//       Find it in ...\CoC_Game\Items\ItemList.as
	
	return 0;
}

function All_Natural_Self_Stimulation_Belt_GetDefense():Number
{
	// NOTE: You can't use "i" here for the index number of _GAME_Items. Use the item ID.
	//       Find it in ...\CoC_Game\Items\ItemList.as
	
	return 0;
}

function All_Natural_Self_Stimulation_Belt_GetArmour():Number
{
	// NOTE: You can't use "i" here for the index number of _GAME_Items. Use the item ID.
	//       Find it in ...\CoC_Game\Items\ItemList.as
	
	return 0;
}

function All_Natural_Self_Stimulation_Belt_ApplyPassive()
{
	// NOTE: You can't use "i" here for the index number of _GAME_Items. Use the item ID.
	//       Find it in ...\CoC_Game\Items\ItemList.as
	
}

_GAME_Items[i].Use = All_Natural_Self_Stimulation_Belt_Use; // Setting the function of the item when used.
_GAME_Items[i].GetItemDamage = All_Natural_Self_Stimulation_Belt_GetDamage; // Setting the get damage function of the item.
_GAME_Items[i].GetItemDefense = All_Natural_Self_Stimulation_Belt_GetDefense; // Setting the get defense function of the item.
_GAME_Items[i].GetItemArmour = All_Natural_Self_Stimulation_Belt_GetArmour; // Setting the get armour function of the item.
_GAME_Items[i].ApplyPassive = All_Natural_Self_Stimulation_Belt_ApplyPassive; // Setting the function of the item's passive.