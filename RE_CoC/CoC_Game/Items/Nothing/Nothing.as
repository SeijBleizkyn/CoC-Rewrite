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

_GAME_Items[i].Name = "Nothing"; // The name of the item.
_GAME_Items[i].CodeName = "Nothing"; // The code name of the item. What shows up on the buttons.

// _GAME_Items[i].Value.push(0);
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

// _GAME_Items[i].Flag.push(true);
/* --------------------------------------------------
 * Same as above, except you're adding in boolean
 * values; true or false.
 * -------------------------------------------------- */

_GAME_Items[i].Description.push("Nothing."); // 0 - This is what's displayed in the pop-up text.

_GAME_Items[i].Amount = 1; // The default stack amount the item has.
_GAME_Items[i].ItemLimit = 999; // The maximum amount this item can stack in the inventory.
_GAME_Items[i].StackLimit = -1; // The maximum amount of stacks of this item that can exist in the inventory. Negative value for infinite.
_GAME_Items[i].Cost = 0; // Value of the item. As in how many gems it costs.
_GAME_Items[i].Type.push(Item_Type._EQUIPMENT); // 0 - Equipment.
_GAME_Items[i].Type.push(Item_Type._UNARMED); // 1 - Unarmed.
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
function Nothing_Use()
{
	// NOTE: You can't use "i" here for the index number of _GAME_Items. Use the item ID.
	//       Find it in ...\CoC_Game\Items\ItemList.as
	
}

function Nothing_GetDamage(c:Character):Number
{
	// NOTE: You can't use "i" here for the index number of _GAME_Items. Use the item ID.
	//       Find it in ...\CoC_Game\Items\ItemList.as
	
	return c.Strength;
}

function Nothing_GetDefense():Number
{
	// NOTE: You can't use "i" here for the index number of _GAME_Items. Use the item ID.
	//       Find it in ...\CoC_Game\Items\ItemList.as
	
	return 0;
}

function Nothing_GetArmour():Number
{
	// NOTE: You can't use "i" here for the index number of _GAME_Items. Use the item ID.
	//       Find it in ...\CoC_Game\Items\ItemList.as
	
	return 0;
}

function Nothing_ApplyPassive()
{
	// NOTE: You can't use "i" here for the index number of _GAME_Items. Use the item ID.
	//       Find it in ...\CoC_Game\Items\ItemList.as
	
}

_GAME_Items[i].Use = Nothing_Use; // Setting the function of the item when used.
_GAME_Items[i].GetItemDamage = Nothing_GetDamage; // Setting the get damage function of the item.
_GAME_Items[i].GetItemDefense = Nothing_GetDefense; // Setting the get defense function of the item.
_GAME_Items[i].GetItemArmour = Nothing_GetArmour; // Setting the get armour function of the item.
_GAME_Items[i].ApplyPassive = Nothing_ApplyPassive; // Setting the function of the item's passive.