/* ----------------------------------------------------------------------------------------------------
 * This is the 00 scene of the Main Menu.
 * 
 * Game made by Fenoxo.
 * Code rewritten by Seij Bleizkyn.
 * ---------------------------------------------------------------------------------------------------- */

// Set the text displayed on the buttons.
// Upper buttons.
_GUI_button[0].buttonLabel = "New Game";
_GUI_button[0].popupLabel = "Start a new game.";
_GUI_button[1].buttonLabel = "Data";
_GUI_button[1].popupLabel = "Access data for saving and loading.";
_GUI_button[2].buttonLabel = "";
_GUI_button[2].popupLabel = "";
_GUI_button[3].buttonLabel = "";
_GUI_button[3].popupLabel = "";
_GUI_button[4].buttonLabel = "";
_GUI_button[4].popupLabel = "";
_GUI_button[5].buttonLabel = "";
_GUI_button[5].popupLabel = "";
// Lower buttons. First row.
_GUI_button[6].buttonLabel = "";
_GUI_button[6].popupLabel = "";
_GUI_button[7].buttonLabel = "Image Credits";
_GUI_button[7].popupLabel = "View the credits of the game's images.";
_GUI_button[8].buttonLabel = "Credits";
_GUI_button[8].popupLabel = "View the credits of this game.";
_GUI_button[9].buttonLabel = "";
_GUI_button[9].popupLabel = "";
_GUI_button[10].buttonLabel = "Instructions";
_GUI_button[10].popupLabel = "View the instructions to play this game.";
// Lower buttons. Second row.
_GUI_button[11].buttonLabel = "Debug Info";
_GUI_button[11].popupLabel = "View debuging information.";
_GUI_button[12].buttonLabel = "";
_GUI_button[12].popupLabel = "";
_GUI_button[13].buttonLabel = "";
_GUI_button[13].popupLabel = "";
_GUI_button[14].buttonLabel = "Settings";
_GUI_button[14].popupLabel = "Set up the game's settings.";
_GUI_button[15].buttonLabel = "TESTING";
_GUI_button[15].popupLabel = "For testing purposes. Duh!";



/* --------------------------------------------------
 * Set the text displayed on the main view.
 * Note that the use of tempString instead of
 * directly putting all the text into _GUI_mainText's
 * htmlText is because page scrolling won't work
 * unless it is done this way.
 * Also, by splitting it up this way makes it easier
 * to read and debug.
 * It's a bit of a hassle, however, to remember to
 * put <p align='left'><font size='"+ _GUI_fontSize +"'>
 * at the beginning and </font></p> at the end for
 * EVERY line.
 * In the end it's just personal preference.
 * -------------------------------------------------- */
tempString = "<font size='4'><br></font><p align='left'><font size='"+ _GUI_fontSize +"'><b>Corruption of Champions (0.9.4 (Moar Bugfixan))</b> Release Build</font></p>";
tempString += "<p align='left'><font size='"+ _GUI_fontSize +"'>(Formerly Unnamed Text Game)</font></p>";
tempString += "<p align='left'><font size='"+ _GUI_fontSize +"'><u>Created by: Fenoxo</u><br><br>Edited By:</font></p>";
tempString += "<p align='left'><font size='"+ _GUI_fontSize +"'>      Ashi, SoS, Prisoner416, Zeikfried, et al</font></p>";
tempString += "<p align='left'><font size='"+ _GUI_fontSize +"'><br>Open-source contributions by:</font></p>";
tempString += "<p align='left'><font size='"+ _GUI_fontSize +"'>      aimozg, Amygdala, Cmacleod42, Enterprise2001, Fake-Name, Gedan, Yoffy, et al</font></p>";
tempString += "<p align='left'><font size='"+ _GUI_fontSize +"'><br>Source Code: <u><a target='_blank' href='https://github.com/herp-a-derp/Corruption-of-Champions'>https://github.com/herp-a-derp/Corruption-of-Champions</a></u></font></p>";
tempString += "<p align='left'><font size='"+ _GUI_fontSize +"'><br>Bug Tracker: <u><a target='_blank' href='https://github.com/herp-a-derp/Corruption-of-Champions/issues'>https://github.com/herp-a-derp/Corruption-of-Champions/issues</a></u></font></p>";
tempString += "<p align='left'><font size='"+ _GUI_fontSize +"'>(requires an account, unfortunately)</font></p>";
tempString += "<p align='left'><font size='"+ _GUI_fontSize +"'><br><b><u>DISCLAIMER</u></b></font></p>";
tempString += "<p align='left'><font size='"+ _GUI_fontSize +"'><b>- There are many strange and odd fetishes contained in this flash. Peruse at own risk.</b></font></p>";
tempString += "<p align='left'><font size='"+ _GUI_fontSize +"'><b>- Please be 18 or the legal age to view porn before playing.</b></font></p>";
tempString += "<p align='left'><font size='"+ _GUI_fontSize +"'><b>- Try to keep your keyboard clean. Think of the children!</b></font></p>";
tempString += "<p align='left'><font size='"+ _GUI_fontSize +"'><br>For more information see Fenoxo’s Blog at <b><u><a target='_blank' href='http://www.fenoxo.com'>fenoxo.com</a></u></b>.</font></p>";
tempString += "<p align='left'><font size='"+ _GUI_fontSize +"'><br>Also go play <u><a target='_blank' href='http://www.furaffinity.net/view/9830293/'>Nimin</a></u> by Xadera on furaffinity.</font></p>";
tempString += "<p align='center'><font size='30'><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>Scroll testing.</font></p>";
_GUI_mainText.htmlText = tempString;



// Things to keep happening in this scene.



// Set the interactivity of the buttons.
switch(_GAME_ButtonPressed)
{
	case 0:
	{
		_GUI_inputText.text = "";
		_GAME_Scene = 1.000;
		break;
	}
	case 1:
	{
		break;
	}
	case 2:
	{
		break;
	}
	case 3:
	{
		break;
	}
	case 4:
	{
		break;
	}
	case 5:
	{
		break;
	}
	case 6:
	{
		break;
	}
	case 7:
	{
		break;
	}
	
	case 8:
	{
		break;
	}
	case 9:
	{
		break;
	}
	case 10:
	{
		break;
	}
	case 11:
	{
		break;
	}
	case 12:
	{
		break;
	}
	case 13:
	{
		break;
	}
	case 14:
	{
		break;
	}
	case 15:
	{
		// Just for item testing purposes.
		
		resetPlayer();
		// Setting the character's stats.
		_GAME_Characters[_GAME_ActiveCharacterID].Strength = 0;
		_GAME_Characters[_GAME_ActiveCharacterID].Toughness = 0;
		_GAME_Characters[_GAME_ActiveCharacterID].Speed = 0;
		_GAME_Characters[_GAME_ActiveCharacterID].Intelligence = 0;
		_GAME_Characters[_GAME_ActiveCharacterID].Libido = 0;
		_GAME_Characters[_GAME_ActiveCharacterID].Sensitivity = 0;
		_GAME_Characters[_GAME_ActiveCharacterID].Corruption = 50;
		setActiveCharacterID(_GAME_ActiveCharacterID);
		if(!(_GAME_Characters[_GAME_ActiveCharacterID].inventory[1].HasItem(2)))
		{
			_GAME_Characters[_GAME_ActiveCharacterID].inventory[1].AddItem(_GAME_Items[2], 1); // Add desired item to desired inventory.
		}
		_GAME_Items[2].Use(_GAME_Characters[_GAME_ActiveCharacterID]); // Use the item and see effect.
		// _GAME_Characters[_GAME_ActiveCharacterID].FindBodyPart(0).BodyEffect[3](_GAME_Characters[_GAME_ActiveCharacterID]);
		break;
	}
}