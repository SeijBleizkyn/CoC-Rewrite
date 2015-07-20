/* ----------------------------------------------------------------------------------------------------
 * This is the 01 scene of the New Game.
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
_GUI_button[6].buttonLabel = "Man";
_GUI_button[6].popupLabel = "";
_GUI_button[7].buttonLabel = "Woman";
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
tempString  = "<p align='left'><font size='"+ _GUI_fontSize +"'><br></font></p>";
tempString += "<p align='left'><font size='"+ _GUI_fontSize +"'><br></font></p>";
tempString += "<p align='left'><font size='"+ _GUI_fontSize +"'>Are you a man or woman?</font></p>";
_GUI_mainText.htmlText = tempString;



// Things to keep happening in this scene.
// Things...



// Things to happen only once upon entering this scene.
if(!(_GAME_SceneRepeated))
{
	_GAME_SceneRepeated = true;
	// Things...
}



// Set the interactivity of the buttons.
switch(_GAME_ButtonPressed)
{
	case 0:
	{
		DoChangeScene(1.000);
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
		_GAME_Characters[0].Height = 71.0;
		_GAME_Characters[0].BodyPartList.push(_GAME_BodyParts[1]); // Add a penis.
		DoChangeScene(1.002);
		break;
	}
	case 7:
	{
		_GAME_Characters[0].Height = 67.0;
		_GAME_Characters[0].BodyPartList.push(_GAME_BodyParts[2]); // Add a vagina.
		DoChangeScene(1.003);
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
		DoChangeScene(0.000);
		break;
	}
}
