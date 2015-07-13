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

_GAME_BodyParts[i].Name = "Anus"; // Setting the name of the body part.

_GAME_BodyParts[i].Type.push(new Vector.<String>()); // 0 - 1st anus' types.
_GAME_BodyParts[i].Type[0].push(BodyPart_Type._ANUS); // 0 - Anus.

_GAME_BodyParts[i].Race.push(new Vector.<String>()); // 0 - 1st anus' races.
_GAME_BodyParts[i].Race[0].push(BodyPart_Race._HUMAN); // 0 - Human anus.

_GAME_BodyParts[i].Value.push(new Vector.<Number>()); // 0 - 1st anus' values.
_GAME_BodyParts[i].Value[0].push(0); // 0 - Anal capacity (inches^2).
_GAME_BodyParts[i].Value[0].push(0); // 1 - Anal looseness.
/* --------------------------------------------------
 * 0 - Virgin
 * 1 - Tight
 * 2 - Normal
 * 3 - Loose
 * 4 - Stretched
 * 5 - Gaping
 * -------------------------------------------------- */
 
_GAME_BodyParts[i].Value[0].push(0); // 2 - Anal wetness.
/* --------------------------------------------------
 * 0 - Dry
 * 1 - Normal
 * 2 - Moist
 * 3 - Slimy
 * 4 - Drooling
 * 5 - Slime-drooling
 * -------------------------------------------------- */

// _GAME_BodyParts[i].Flag.push(new Vector.<Boolean>());
// _GAME_BodyParts[i].Flag[0].push(true);

// Loosness rating.
_GAME_BodyParts[i].Description.push(new Vector.<String>()); // 0 - Anal loosness.
_GAME_BodyParts[i].Description[0].push("virgin"); // 0 - Virgin.
_GAME_BodyParts[i].Description[0].push("tight"); // 1 - Tight.
_GAME_BodyParts[i].Description[0].push("normal"); // 2 - Normal.
_GAME_BodyParts[i].Description[0].push("loose"); // 3 - Loose.
_GAME_BodyParts[i].Description[0].push("stretched"); // 4 - Stretched.
_GAME_BodyParts[i].Description[0].push("gaping"); // 5 - Gaping.

// Wetness rating.
_GAME_BodyParts[i].Description.push(new Vector.<String>()); // 1 - Anal wetness.
_GAME_BodyParts[i].Description[1].push("dry"); // 0 - Dry.
_GAME_BodyParts[i].Description[1].push("normal"); // 1 - Normal.
_GAME_BodyParts[i].Description[1].push("moist"); // 2 - Moist.
_GAME_BodyParts[i].Description[1].push("slimy"); // 3 - Slimy.
_GAME_BodyParts[i].Description[1].push("drooling"); // 4 - Drooling.
_GAME_BodyParts[i].Description[1].push("slime-drooling"); // 5 - Slime-drooling.

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

function Anus_GetAdjective():String
{
	return "";
}

function Anus_GetNoun():String
{
	return "";
}

/* --------------------------------------------------
 * t - A vector of BodyPart_Types of the body parts
 *     to add.
 * r - A vector of BodyPart_Races of the body parts
 *     to add.
 * v - A vector of values of the body parts to add.
 * -------------------------------------------------- */ 
function Anus_AddBodyPart(c:Character, t:Vector.<String>, r:Vector.<String>, v:Vector.<Number>)
{
	// NOTE: You can't use "i" here for the index number of _GAME_BodyParts. Use the body part ID.
	//       Find it in ...\CoC_Game\Body Parts\BodyPartList.as
	
	var index:int = 3;
	
	c.FindBodyPart(index).Type.push(t);
	c.FindBodyPart(index).Race.push(r);
	c.FindBodyPart(index).Value.push(v);
	// c.FindBodyPart(index).Value.push(f);
}

_GAME_BodyParts[i].GetAdjective = Anus_GetAdjective; // 0 - Setting the get adjective function.
_GAME_BodyParts[i].GetNoun = Anus_GetNoun; // 1 - Setting the get noun function.
_GAME_BodyParts[i].AddBodyPart = Anus_AddBodyPart; // 2 - Setting the add body part function.