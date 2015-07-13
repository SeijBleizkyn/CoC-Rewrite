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

_GAME_Items[i].Name = "Beautiful Sword"; // The name of the item.
_GAME_Items[i].CodeName = "B.Sword"; // The code name of the item. What shows up on the buttons.

// _GAME_Items[i].Value.push(new Vector.<Number>());
// _GAME_Items[i].Value.push(0);
/* --------------------------------------------------
 * If the item has any effects, and you need to store
 * the value of the effect, store it here. If it
 * doesn't, then don't worry about it. Skip this,
 * otherwise, read on.
 * 
 * For example: If a consumable item gives 5 strength
 * and 10 speed when consumed, then you can add these
 * values by using this "Value[0].push()".
 * 
 * This is how you do it:
 * First:
 * _GAME_Items[i].Value.push(new Vector.<Number>());
 * Second:
 * _GAME_Items[i].Value[0].push(5);
 * _GAME_Items[i].Value[0].push(10);
 * Now all you got to remember is the order in which
 * you have added them in. The value 5 will be in the
 * 0th spot, while 10 is in the 1st. To get them, use
 * "Value[]".
 * 
 * Say you want to get the strength value that the
 * item gives, you'll want to do this:
 * _GAME_Items[i].Value[0][0];
 * as the strength value (5) is in the 0th spot of
 * the first value vector.
 * And:
 * _GAME_Items[i].Value[0][1];
 * for the speed value (10) in the 1st spot of the
 * first value vector.
 * -------------------------------------------------- */

// _GAME_Items[i].Flag.push(new Vector.<Boolean>());
// _GAME_Items[i].Flag[0].push(true);
/* --------------------------------------------------
 * Same as above, except you're adding in boolean
 * values; true or false.
 * -------------------------------------------------- */

_GAME_Items[i].Description.push(new Vector.<String>()); // 0
_GAME_Items[i].Description[0].push("This beautiful sword shines brilliantly in the light, showing the flawless craftsmanship of its blade.  The pommel and guard are heavily decorated in gold and brass.  Some craftsman clearly poured his heart and soul into this blade.  (ATK: +Varies) (Cost: " + _GAME_Items[i].Cost + ")"); // This is what's displayed in the pop-up text.

_GAME_Items[i].Amount = 1; // The default stack amount the item has.
_GAME_Items[i].ItemLimit = 5; // The maximum amount this item can stack in the inventory.
_GAME_Items[i].StackLimit = -1; // The maximum amount of stacks of this item that can exist in the inventory. Negative value for infinite.
_GAME_Items[i].Cost = 400; // Value of the item. As in how many gems it costs.
_GAME_Items[i].Type.push(Item_Type._EQUIPMENT); // 0 - Equipment.
_GAME_Items[i].Type.push(Item_Type._WEAPON); // 1 - Weapon.
_GAME_Items[i].Type.push(Item_Type._MEDIUM); // 2 - Medium weapon.

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
function Beautiful_Sword_Use()
{
	// NOTE: You can't use "i" here for the index number of _GAME_Items. Use the item ID.
	//       Find it in ...\CoC_Game\Items\ItemList.as
	
}

function Beautiful_Sword_GetDamage(c:Character):Number
{
	// NOTE: You can't use "i" here for the index number of _GAME_Items. Use the item ID.
	//       Find it in ...\CoC_Game\Items\ItemList.as
	
	return (7 + int(10 - c.Corruption / 3));
}

function Beautiful_Sword_GetDefense():Number
{
	// NOTE: You can't use "i" here for the index number of _GAME_Items. Use the item ID.
	//       Find it in ...\CoC_Game\Items\ItemList.as
	
	return 0;
}

function Beautiful_Sword_GetArmour():Number
{
	// NOTE: You can't use "i" here for the index number of _GAME_Items. Use the item ID.
	//       Find it in ...\CoC_Game\Items\ItemList.as
	
	return 0;
}

function Beautiful_Sword_ApplyPassive()
{
	// NOTE: You can't use "i" here for the index number of _GAME_Items. Use the item ID.
	//       Find it in ...\CoC_Game\Items\ItemList.as
	
}

_GAME_Items[i].Use = Beautiful_Sword_Use; // Setting the function of the item when used.
_GAME_Items[i].GetItemDamage = Beautiful_Sword_GetDamage; // Setting the get damage function of the item.
_GAME_Items[i].GetItemDefense = Beautiful_Sword_GetDefense; // Setting the get defense function of the item.
_GAME_Items[i].GetItemArmour = Beautiful_Sword_GetArmour; // Setting the get armour function of the item.
_GAME_Items[i].ApplyPassive = Beautiful_Sword_ApplyPassive; // Setting the function of the item's passive.