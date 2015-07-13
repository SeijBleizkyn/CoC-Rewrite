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

_GAME_BodyParts[i].Name = "Vagina"; // Setting the name of the body part.

_GAME_BodyParts[i].Type.push(new Vector.<String>()); // 0 - 1st vagina's types.
_GAME_BodyParts[i].Type[0].push(BodyPart_Type._VAGINA); // 0 - Vagina.

_GAME_BodyParts[i].Race.push(new Vector.<String>()); // 0 - 1st vagina's races.
_GAME_BodyParts[i].Race[0].push(BodyPart_Race._HUMAN); // 0 - Human vagina.

_GAME_BodyParts[i].Value.push(new Vector.<Number>()); // 0 - 1st vagina's values.
_GAME_BodyParts[i].Value[0].push(0); // 0 - Looseness of vagina.
/* --------------------------------------------------
 * 0 - Tight
 * 1 - Normal
 * 2 - Loose
 * 3 - Gaping
 * 4 - Gaping-wide
 * 5 - Clown-car level
 * -------------------------------------------------- */
 
_GAME_BodyParts[i].Value[0].push(1); // 1 - Wetness of vagina.
/* --------------------------------------------------
 * 0 - Dry
 * 1 - Normal
 * 2 - Wet
 * 3 - Slick
 * 4 - Drooling
 * 5 - Slavering
 * -------------------------------------------------- */

_GAME_BodyParts[i].Value[0].push(0.0); // 2 - Extra capacity (inches^2).

_GAME_BodyParts[i].Flag.push(new Vector.<Boolean>()); // 0 - 1st vagina's flags.
_GAME_BodyParts[i].Flag[0].push(true); // 0 - Virgin? Yes or no? True or false?

// Loosness rating.
_GAME_BodyParts[i].Description.push(new Vector.<String>); // 0 - Looseness rating.
_GAME_BodyParts[i].Description[0].push("tight"); // 0 - Tight.
_GAME_BodyParts[i].Description[0].push("normal"); // 1 - Normal.
_GAME_BodyParts[i].Description[0].push("loose"); // 2 - Loose.
_GAME_BodyParts[i].Description[0].push("gaping"); // 3 - Gaping.
_GAME_BodyParts[i].Description[0].push("gaping-wide"); // 4 - Gaping-wide.
_GAME_BodyParts[i].Description[0].push("clown-car level"); // 5 - Clown-car level.

// Wetness rating.
_GAME_BodyParts[i].Description.push(new Vector.<String>); // 1 - Wetness rating.
_GAME_BodyParts[i].Description[1].push("dry"); // 0 - Dry.
_GAME_BodyParts[i].Description[1].push("normal"); // 1 - Normal.
_GAME_BodyParts[i].Description[1].push("wet"); // 2 - Wet.
_GAME_BodyParts[i].Description[1].push("slick"); // 3 - Slick.
_GAME_BodyParts[i].Description[1].push("drooling"); // 4 - Drooling.
_GAME_BodyParts[i].Description[1].push("slavering"); // 5 - Slavering.

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

function Vagina_GetAdjective():String
{
	return "";
}

function Vagina_GetNoun():String
{
	return "";
}

/* --------------------------------------------------
 * t - A vector of BodyPart_Types of the body parts
 *     to add.
 * r - A vector of BodyPart_Races of the body parts
 *     to add.
 * v - A vector of values of the body parts to add.
 * f - A vector of flags of the body parts to add.
 * -------------------------------------------------- */ 
function Vagina_AddBodyPart(c:Character, t:Vector.<String>, r:Vector.<String>, v:Vector.<Number>, f:Vector.<Boolean>)
{
	// NOTE: You can't use "i" here for the index number of _GAME_BodyParts. Use the body part ID.
	//       Find it in ...\CoC_Game\Body Parts\BodyPartList.as
	
	var index:int = 2;
	
	c.FindBodyPart(index).Type.push(t);
	c.FindBodyPart(index).Race.push(r);
	c.FindBodyPart(index).Value.push(v);
	c.FindBodyPart(index).Value.push(f);
}

_GAME_BodyParts[i].GetAdjective = Vagina_GetAdjective; // 0 - Setting the get adjective function.
_GAME_BodyParts[i].GetNoun = Vagina_GetNoun; // 1 - Setting the get noun function.
_GAME_BodyParts[i].AddBodyPart = Vagina_AddBodyPart; // 2 - Setting the add body part function.