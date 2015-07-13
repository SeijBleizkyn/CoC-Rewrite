/* ----------------------------------------------------------------------------------------------------
 * This is the 00 scene of the New Game.
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
_GUI_button[6].buttonLabel = "OK";
_GUI_button[6].popupLabel = "";
_GUI_button[7].buttonLabel = "";
_GUI_button[7].popupLabel = "";
_GUI_button[8].buttonLabel = "";
_GUI_button[8].popupLabel = "";
_GUI_button[9].buttonLabel = "";
_GUI_button[9].popupLabel = "";
_GUI_button[10].buttonLabel = "";
_GUI_button[10].popupLabel = "";
// Lower buttons. Second row.
_GUI_button[11].buttonLabel = "";
_GUI_button[11].popupLabel = "";
_GUI_button[12].buttonLabel = "";
_GUI_button[12].popupLabel = "";
_GUI_button[13].buttonLabel = "";
_GUI_button[13].popupLabel = "";
_GUI_button[14].buttonLabel = "";
_GUI_button[14].popupLabel = "";
_GUI_button[15].buttonLabel = "Cancel";
_GUI_button[15].popupLabel = "Go back to the main menu.";



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
tempString  = "<p align='left'><font size='"+ _GUI_fontSize +"'>You grew up in the small village of Ingnam, a remote village with rich traditions, buried deep in the wilds. Every year for as long as you can remember, your village has chosen a champion to send to the cursed Demon Realm. Legend has it that in years Ingnam has failed to produce a champion, chaos has reigned over the countryside. Children disappear, crops wilt, and disease spreads like wildfire. This year, <b>you</b> have been selected to be the champion.</font></p>";
tempString += "<p align='left'><font size='"+ _GUI_fontSize +"'><br>What is your name?</font></p>";
_GUI_mainText.htmlText = tempString;



// Things to keep happening in this scene.
_GUI_inputText.x = 220.0;
_GUI_inputText.y = 225.0;
resetPlayer();
setActiveCharacterID(_GAME_ActiveCharacterID);



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
		_GUI_inputText.x = -100.0;
		_GUI_inputText.y = -100.0;
		_GAME_Characters[0].Name = _GUI_inputText.text;
		_GUI_inputText.text = "";
		_GUI_playerName.htmlText = "<p><font size='22'><b>Name: " + _GAME_Characters[0].Name + "</b></font></p>";
		_GAME_Scene = 1.001;
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
		_GUI_inputText.x = -100.0;
		_GUI_inputText.y = -100.0;
		_GAME_Scene = 0.000;
		break;
	}
}
