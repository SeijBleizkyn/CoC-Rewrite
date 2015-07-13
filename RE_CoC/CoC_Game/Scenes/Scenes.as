/* ----------------------------------------------------------------------------------------------------
 * This is the file which decides which scenes are played. This file is included by RE_CoC.as.
 * 
 * Game made by Fenoxo.
 * Code rewritten by Seij Bleizkyn.
 * ---------------------------------------------------------------------------------------------------- */

/* --------------------------------------------------
 * 0.00 = Main menu - Screen 1
 * -------------------------------------------------- */
switch(_GAME_Scene)
{
	case 0.000:
	{
		include "0 - Main_Menu//000.as";
		break;
	}
	case 1.000:
	{
		include "1 - New_Game//000.as";
		break;
	}
	case 1.001:
	{
		include "1 - New_Game//001.as";
		break;
	}
	default:
	{
		_GUI_mainText.htmlText = "<font size='4'><br></font><p align='left'><font size='"+ _GUI_fontSize +"'><b>ERROR! SCENE NOT FOUND! PLEASE CONTACT GAME AUTHOR!</b><br><br>Useful information: " + _GAME_Scene + "</font></p>";
		break;
	}
}

_GUI_scrollBar.scrollTarget = _GUI_mainText; // This line is needed to "re-align" the scrollbar with the main text.