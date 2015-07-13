_GAME_BodyParts.push(new BodyPart());

i = _GAME_BodyParts.length - 1;
/* --------------------------------------------------
 * Ensuring that "i" is pointing at the position of
 * the body part that has just been made.
 * -------------------------------------------------- */

_GAME_BodyParts[i].ID = i;
/* --------------------------------------------------
 * Don't change this. This is the in-game ID of the
 * body part. It is set to be the nth - 1 number of
 * body part added into the game. So if this is the
 * 500th body part being added into the game, it's ID
 * will be 499.
 * -------------------------------------------------- */

/* ---------------------------------------------------------------------------------------------------- */

_GAME_BodyParts[i].Name = "Hip"; // Setting the name of the body part.

_GAME_BodyParts[i].Type.push(new Vector.<String>()); // 0 - 1st hip's types.
_GAME_BodyParts[i].Type[0].push(BodyPart_Type._HIP); // 0 - Hip.

_GAME_BodyParts[i].Race.push(new Vector.<String>()); // 0 - 1st hip's races.
_GAME_BodyParts[i].Race[0].push(BodyPart_Race._HUMAN); // 0 - Human hip.

_GAME_BodyParts[i].Value.push(new Vector.<Number>()); // 0 - 1st hip's values.
_GAME_BodyParts[i].Value[0].push(0); // 0 - 1st hip's rating.
/* --------------------------------------------------
 * 0 - Boyish
 * 1 - Slender
 * 2 - Average
 * 3 - Ample
 * 4 - Curvy
 * 5 - Fertile
 * 6 - Inhumanly wide
 * -------------------------------------------------- */

// _GAME_BodyParts[i].Flag.push(new Vector.<Boolean>());
// _GAME_BodyParts[i].Flag[0].push(true);

// Hip rating.
_GAME_BodyParts[i].Description.push(new Vector.<String>); // 0 - Hip rating.
_GAME_BodyParts[i].Description[0].push("boyish"); // 0 - Boyish.
_GAME_BodyParts[i].Description[0].push("slender"); // 1 - Slender.
_GAME_BodyParts[i].Description[0].push("average"); // 2 - Average.
_GAME_BodyParts[i].Description[0].push("ample"); // 3 - Ample.
_GAME_BodyParts[i].Description[0].push("curvy"); // 4 - Curvy.
_GAME_BodyParts[i].Description[0].push("fertile"); // 5 - Fertile.
_GAME_BodyParts[i].Description[0].push("Inhumanly"); // 6 - Inhumanly.

// _GAME_BodyParts[i].ItemSlot.push(_GAME_Items[0]);

/* --------------------------------------------------
 * The functions' name should always be (for
 * consistency's sake) the name of the body part plus
 * what ever it does. However, because it's a
 * function, you can't put spaces in this function's
 * name. Instead, you should use underscores for
 * spaces. An underscore looks like this: _
 * Also, you can't use hyphens either (A hyphen: -).
 * So use underscores for those too.
 * 
 * These functions are for telling the game what the
 * body parts can do.
 * -------------------------------------------------- */

function Hip_GetAdjective():String
{
	return "";
}

function Hip_GetNoun():String
{
	return "";
}

/* --------------------------------------------------
 * a - The amount of this body part to add.
 * t - A vector of BodyPart_Types of the body parts
 *     to add.
 * r - A vector of BodyPart_Races of the body parts
 *     to add.
 * v - A vector of values of the body parts to add.
 * -------------------------------------------------- */ 
function Hip_AddBodyPart(c:Character, t:Vector.<String>, r:Vector.<String>, v:Vector.<Number>)
{
	// NOTE: You can't use "i" here for the index number of _GAME_BodyParts. Use the body part ID.
	//       Find it in ...\CoC_Game\Body Parts\BodyPartList.as
	
	var index:int = 5;
	
	c.FindBodyPart(index).Type.push(t);
	c.FindBodyPart(index).Race.push(r);
	c.FindBodyPart(index).Value.push(v);
	// c.FindBodyPart(index).Value.push(f);
}

_GAME_BodyParts[i].GetAdjective = Hip_GetAdjective; // 0 - Setting the get adjective function.
_GAME_BodyParts[i].GetNoun = Hip_GetNoun; // 1 - Setting the get noun function.
_GAME_BodyParts[i].AddBodyPart = Hip_AddBodyPart; // 2 - Setting the add body part function.