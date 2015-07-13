_GAME_Characters.push(new Character()); // Add a new blank character to the game.

i = _GAME_Characters.length - 1;
/* --------------------------------------------------
 * Ensuring that "i" is pointing at the position of
 * the character that has just been made.
 * -------------------------------------------------- */

_GAME_Characters[i].ID = i; 
/* --------------------------------------------------
 * Don't change this. This is the in-game ID of the
 * character. It is set to be the nth - 1 number of
 * character added into the game. So if this is the
 * 500th character being added into the game, it's ID
 * will be 499.
 * -------------------------------------------------- */

_GAME_Characters[i].Name = ""; // Setting the name of the character.
_GAME_Characters[i].Appearance = ""; // Setting the appearance of the character.
_GAME_Characters[i].BattleAppearance = ""; // Setting the appearance of the character when battling him/her/it.
_GAME_Characters[i].Age = 18; // Setting the age of the character.
_GAME_Characters[i].BodyPartList.push(_GAME_BodyParts[0]); // 0 - Breasts.
_GAME_Characters[i].BodyPartList.push(_GAME_BodyParts[5]); // 1 - Hip.
_GAME_Characters[i].BodyPartList.push(_GAME_BodyParts[4]); // 2 - Butt.
_GAME_Characters[i].BodyPartList.push(_GAME_BodyParts[3]); // 3 - Anus.
_GAME_Characters[i].BodyPartList.push(_GAME_BodyParts[6]); // 4 - Leg.
_GAME_Characters[i].Strength = 0; // Setting the strength of the character.
_GAME_Characters[i].Toughness = 0; // Setting the toughness of the character.
_GAME_Characters[i].Speed = 0; // Setting the speed of the character.
_GAME_Characters[i].Intelligence = 0; // Setting the intelligence of the character.
_GAME_Characters[i].Libido = 0; // Setting the libido of the character.
_GAME_Characters[i].Sensitivity = 0; // Setting the sensitivity of the character.
_GAME_Characters[i].Corruption = 0; // Setting the corruption of the character.
_GAME_Characters[i].BaseHP = 50; // Setting the base hp of the character.
_GAME_Characters[i].Level = 1; // Setting the level of the character.
_GAME_Characters[i].HP = _GAME_Characters[i].MaxHP; // Setting the hp of the character to the max.
_GAME_Characters[i].Lust = 0; // Setting the lust of the character.
_GAME_Characters[i].Fatigue = 0; // Setting the fatigue of the character.
_GAME_Characters[i].Gems = 0; // Setting the amount gems of on the character.
_GAME_Characters[i].Height = 67; // Setting the height of the character (inches).
_GAME_Characters[i].Femininity = 0; // Setting the femininity of the character.
_GAME_Characters[i].Thickness = 0; // Setting how thick set the character is.
_GAME_Characters[i].MuscleTone = 0; // Setting the muscle tone of the character.
_GAME_Characters[i].TeaseLevel = 0; // Setting the teasing level of the character.
_GAME_Characters[i].Fertility = 0; // Setting the fertility rating of the character.
_GAME_Characters[i].inventory.push(new Inventory()); // 0 - Normal inventory.
_GAME_Characters[i].inventory.push(new Inventory()); // 1 - Key inventory.