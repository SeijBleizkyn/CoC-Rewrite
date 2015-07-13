/* ----------------------------------------------------------------------------------------------------
 * This is the main file, where everything comes together to form the game. This file is attached to
 * RE_CoC.fla itself.
 * Wondering how? Well in the flash IDE, while nothing is selected, look at the "properites" tab (most
 * likely close to the "library" tab). In the "publish" section, there is a field which is labeled
 * "Class:". By putting this file's name in there (without the ".as" part) I can attach this file to
 * the ".fla" itself. Note that this file is in a folder, so the folder's path should be put in as
 * well. So right now, it's "CoC_Game.Core.RE_CoC" because it's in the "Core" folder, and the "Core"
 * folder is in the "CoC_Game" folder.
 * 
 * Game made by Fenoxo.
 * Code rewritten by Seij Bleizkyn.
 * ---------------------------------------------------------------------------------------------------- */

package CoC_Game.Core
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import CoC_Engine.Miscellaneous.FrameTime;
	import CoC_Engine.Miscellaneous.Resolution;
	import CoC_Engine.GUI.*;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import fl.controls.*;
	import CoC_Engine.Character.Character;
	import CoC_Engine.Character.BodyPart.BodyPart;
	import CoC_Engine.Character.BodyPart.BodyPart_Type;
	import CoC_Engine.Character.BodyPart.BodyPart_Race;
	import CoC_Engine.Item.Item;
	import CoC_Engine.Item.Item_Type;
	import CoC_Engine.Inventory.Inventory;
	import flash.text.TextFormat;
	import flash.display3D.IndexBuffer3D;

 // Imports all of the CoC engine's GUI components in to be used in this class.
	
	public class RE_CoC extends MovieClip
	{
		// ------------------------------ Constants ------------------------------ //
		// The constants section.
		private const _BUTTON_COUNT:int = 16;
		/* --------------------------------------------------
		 * The amount of buttons there are on the game's GUI.
		 * DON'T CHANGE UNLESS YOU KNOW WHAT YOU ARE DOING!
		 * -------------------------------------------------- */
		 
		private const _TEXT_PADDING:Number = 10;
		private const _STAT_PER_SEC:Number = 10;
		private const _STAT_ICON_SHOW_TIME:Number = 5; // Measured in seconds.
		
		
		
		// ------------------------------ Frame Time ------------------------------ //
		// The frame-time section.
		private var _FrameTime:FrameTime = new FrameTime();
		
		
		
		// ------------------------------ GUI ------------------------------ //
		// The GUI (Graphical User Interface) section.
		private var _GUI_background:GUI_Background = new GUI_Background(); // Create an instance of the background image.
		private var _GUI_button:Vector.<GUI_Button> = new Vector.<GUI_Button>();
		private var _GUI_mainText:TextField = new TextField();
		private var _GUI_inputText:TextField = new TextField();
		private var _GUI_scrollBar:UIScrollBar = new UIScrollBar();
		private var _GUI_fontSize:Number = 20;
		private var _GUI_sideBar:GUI_Sidebar = new GUI_Sidebar();
		private var _GUI_dayTime:GUI_DayTime = new GUI_DayTime();
		private var _GUI_playerName:TextField = new TextField();
		private var _GUI_coreStats:TextField = new TextField();
		private var _GUI_combatStats:TextField = new TextField();
		private var _GUI_advancement:TextField = new TextField();
		private var _GUI_stats:Vector.<GUI_Stat> = new Vector.<GUI_Stat>();
		private var _GUI_stats2:Vector.<GUI_Stat2> = new Vector.<GUI_Stat2>();
		
		
		
		// ------------------------------ Game ------------------------------ //
		// The Game section.
		private var _GAME_Scene:Number = 0.000;
		private var _GAME_ButtonPressed:int = -1;
		private var _GAME_ActiveCharacterID:int = 0;
		private var _GAME_Stats:Vector.<Number> = new Vector.<Number>();
		private var _GAME_Stats2:Vector.<Number> = new Vector.<Number>();
		private var _GAME_StatsQueue:Vector.<Number> = new Vector.<Number>();
		private var _GAME_Stats2Queue:Vector.<Number> = new Vector.<Number>();
		private var _GAME_StatsIconTimer:Vector.<Number> = new Vector.<Number>();
		private var _GAME_Stats2IconTimer:Vector.<Number> = new Vector.<Number>();
		private var _GAME_Characters:Vector.<Character> = new Vector.<Character>();
		private var _GAME_Items:Vector.<Item> = new Vector.<Item>();
		private var _GAME_BodyParts:Vector.<BodyPart> = new Vector.<BodyPart>();		
		
		
		
		// ------------------------------ Misc ------------------------------ //
		// Miscellaneous section.
		private var tempString:String = "";
		private var tempFormat:TextFormat = new TextFormat();
		
		
		
		// Constructor, also the initialisation of the game.
		public function RE_CoC()
		{
			// ------------------------------ GUI ------------------------------ //
			// The GUI (Graphical User Interface) section.
			addChild(_GUI_background);
			/* --------------------------------------------------
			 * Add _GUI_Background so it shows up on the screen.
			 * 
			 * NOTE: Most anything graphical that is created by
			 * script needs to be added like this for it to
			 * visually show up in the program. You can see some
			 * examples a little further down.
			 * -------------------------------------------------- */
			
			// Initialise the main text.
			_GUI_mainText.htmlText = "";
			_GUI_mainText.x = 205.5 + _TEXT_PADDING;
			_GUI_mainText.y = 51.5 + _TEXT_PADDING;
			_GUI_mainText.width = 774 - _TEXT_PADDING * 2;
			_GUI_mainText.height = 604 - _TEXT_PADDING * 2;
			_GUI_mainText.wordWrap = true;
			_GUI_mainText.multiline = true;
			_GUI_mainText.mouseEnabled = true;
			_GUI_mainText.selectable = false;
			addChild(_GUI_mainText); // Add it so it shows up on screen.
			
			// Initialise the scroll bar.
			_GUI_scrollBar.scrollTarget = _GUI_mainText;
			_GUI_scrollBar.x = _GUI_mainText.x + _GUI_mainText.width + _TEXT_PADDING;
			_GUI_scrollBar.y = _GUI_mainText.y - _TEXT_PADDING;
			_GUI_scrollBar.height = _GUI_mainText.height + _TEXT_PADDING * 2;
			addChild(_GUI_scrollBar); // Add it so it shows up on screen.
			
			// Initialise the input text.
			_GUI_inputText.text = "";
			_GUI_inputText.x = -100.0;
			_GUI_inputText.y = -100.0;
			_GUI_inputText.width = 200;
			_GUI_inputText.height = 28;
			_GUI_inputText.wordWrap = true;
			_GUI_inputText.multiline = false;
			_GUI_inputText.selectable = true;
			_GUI_inputText.maxChars = 54;
			_GUI_inputText.type = "input";
			_GUI_inputText.background = true;
			_GUI_inputText.border = true;
			addChild(_GUI_inputText); // Add it so it shows up on screen.
			tempFormat.size = _GUI_fontSize;
			_GUI_inputText.defaultTextFormat = tempFormat; // Applying the new text size to fit with the rest of the game.
			
			// Set the side bar in place and shape.
			_GUI_sideBar.height = 605;
			_GUI_sideBar.x = 0;
			_GUI_sideBar.y = 51;
			addChild(_GUI_sideBar); // Add it so it shows up on screen.
			
			// Set the part that shows the day and time in place.
			_GUI_dayTime.x = 4;
			_GUI_dayTime.y = 670.25;
			addChild(_GUI_dayTime); // Add it so it shows up on screen.
			
			// Make a "Name" label
			_GUI_playerName.htmlText = "<p><font size='22'><b>Name: </b></font></p>";
			_GUI_playerName.x = 3.0;
			_GUI_playerName.y = 52.0;
			_GUI_playerName.width = 193.0;
			_GUI_playerName.height = 30.0;
			_GUI_playerName.wordWrap = false;
			_GUI_playerName.multiline = false;
			_GUI_playerName.mouseEnabled = false;
			_GUI_playerName.selectable = false;
			addChild(_GUI_playerName); // Add it so it shows up on screen.
			
			// Make a "Core Stats" label
			_GUI_coreStats.htmlText = "<p><font size='22'><b>Core Stats</b></font></p>";
			_GUI_coreStats.x = 3.0;
			_GUI_coreStats.y = 79.0;
			_GUI_coreStats.width = 193.0;
			_GUI_coreStats.height = 30.0;
			_GUI_coreStats.wordWrap = false;
			_GUI_coreStats.multiline = false;
			_GUI_coreStats.mouseEnabled = false;
			_GUI_coreStats.selectable = false;
			addChild(_GUI_coreStats); // Add it so it shows up on screen.
			
			// Make a "Combat Stats" label
			_GUI_combatStats.htmlText = "<p><font size='22'><b>Combat Stats</b></font></p>";
			_GUI_combatStats.x = 3.0;
			_GUI_combatStats.y = 387.5;
			_GUI_combatStats.width = 193.0;
			_GUI_combatStats.height = 30.0;
			_GUI_combatStats.wordWrap = false;
			_GUI_combatStats.multiline = false;
			_GUI_combatStats.mouseEnabled = false;
			_GUI_combatStats.selectable = false;
			addChild(_GUI_combatStats); // Add it so it shows up on screen.
			
			// Make a "Advancement" label
			_GUI_advancement.htmlText = "<p><font size='22'><b>Advancement</b></font></p>";
			_GUI_advancement.x = 3.0;
			_GUI_advancement.y = 535.0;
			_GUI_advancement.width = 193.0;
			_GUI_advancement.height = 30.0;
			_GUI_advancement.wordWrap = false;
			_GUI_advancement.multiline = false;
			_GUI_advancement.mouseEnabled = false;
			_GUI_advancement.selectable = false;
			addChild(_GUI_advancement); // Add it so it shows up on screen.
			
			// Make all the stats.
			var i:int = 0;
			for(i = 0; i < 10; i += 1)
			{
				_GUI_stats.push(new GUI_Stat());
				addChild(_GUI_stats[i]); // Add the stats so they show up on the screen.
			}
			
			// Set the stat name, number value and positions.
			_GUI_stats[0].statName = "Strength\t:";
			_GUI_stats[0].statNum = 0;
			_GUI_stats[0].maxBarWidth = 115.0;
			_GUI_stats[0].maxNum = 100.0;
			_GUI_stats[0].x = 3.0;
			_GUI_stats[0].y = 110.0;
			
			_GUI_stats[1].statName = "Toughness\t:";
			_GUI_stats[1].statNum = 0;
			_GUI_stats[1].maxBarWidth = 115.0;
			_GUI_stats[1].maxNum = 100.0;
			_GUI_stats[1].x = 3.0;
			_GUI_stats[1].y = 150.0;
			
			_GUI_stats[2].statName = "Speed\t\t:";
			_GUI_stats[2].statNum = 0;
			_GUI_stats[2].maxBarWidth = 115.0;
			_GUI_stats[2].maxNum = 100.0;
			_GUI_stats[2].x = 3.0;
			_GUI_stats[2].y = 190.0;
			
			_GUI_stats[3].statName = "Intelligence:";
			_GUI_stats[3].statNum = 0;
			_GUI_stats[3].maxBarWidth = 115.0;
			_GUI_stats[3].maxNum = 100.0;
			_GUI_stats[3].x = 3.0;
			_GUI_stats[3].y = 230.0;
			
			_GUI_stats[4].statName = "Libido\t\t:";
			_GUI_stats[4].statNum = 0;
			_GUI_stats[4].maxBarWidth = 115.0;
			_GUI_stats[4].maxNum = 100.0;
			_GUI_stats[4].x = 3.0;
			_GUI_stats[4].y = 270.0;
			
			_GUI_stats[5].statName = "Sensitivity\t:";
			_GUI_stats[5].statNum = 0;
			_GUI_stats[5].maxBarWidth = 115.0;
			_GUI_stats[5].maxNum = 100.0;
			_GUI_stats[5].x = 3.0;
			_GUI_stats[5].y = 310.0;
			
			_GUI_stats[6].statName = "Corruption\t:";
			_GUI_stats[6].statNum = 0;
			_GUI_stats[6].maxBarWidth = 115.0;
			_GUI_stats[6].maxNum = 100.0;
			_GUI_stats[6].x = 3.0;
			_GUI_stats[6].y = 350.0;
			
			_GUI_stats[7].statName = "HP\t\t\t:";
			_GUI_stats[7].statNum = 0;
			_GUI_stats[7].maxBarWidth = 115.0;
			_GUI_stats[7].maxNum = 100.0;
			_GUI_stats[7].x = 3.0;
			_GUI_stats[7].y = 412.5;
			
			_GUI_stats[8].statName = "Lust\t\t:";
			_GUI_stats[8].statNum = 0;
			_GUI_stats[8].maxBarWidth = 115.0;
			_GUI_stats[8].maxNum = 100.0;
			_GUI_stats[8].x = 3.0;
			_GUI_stats[8].y = 452.5;
			
			_GUI_stats[9].statName = "Fatigue\t\t:";
			_GUI_stats[9].statNum = 0;
			_GUI_stats[9].maxBarWidth = 115.0;
			_GUI_stats[9].maxNum = 100.0;
			_GUI_stats[9].x = 3.0;
			_GUI_stats[9].y = 492.5;
			
			// Make all the advancement stats.
			for(i = 0; i < 3; i += 1)
			{
				_GUI_stats2.push(new GUI_Stat2());
				addChild(_GUI_stats2[i]); // Add the stats so they show up on the screen.
			}
			
			// Set the stat name, number value and positions.
			_GUI_stats2[0].statName = "Level\t\t:";
			_GUI_stats2[0].statNum = 0;
			_GUI_stats2[0].x = 3.0;
			_GUI_stats2[0].y = 559.5;
			
			_GUI_stats2[1].statName = "Experience\t:";
			_GUI_stats2[1].statNum = 0;
			_GUI_stats2[1].x = 3.0;
			_GUI_stats2[1].y = 589.0;
			
			_GUI_stats2[2].statName = "Gems\t\t:";
			_GUI_stats2[2].statNum = 0;
			_GUI_stats2[2].x = 3.0;
			_GUI_stats2[2].y = 619.0;
			
			// Make all the buttons.
			for(i = 0; i < _BUTTON_COUNT; i += 1)
			{
				_GUI_button.push(new GUI_Button(0));
				addChild(_GUI_button[i]); // Add the buttons so they show up on the screen.
			}
			
			// Set the button label, picture and positions. Note: As said in the GUI_Button.as file,
			// If there's nothing in the label, the button will automatically hide itself.
			// It's shy like that, deal with it.
			_GUI_button[0].button = 1;
			_GUI_button[0].x = 5;
			_GUI_button[0].y = 8;
			
			_GUI_button[1].button = 9;
			_GUI_button[1].x = 170;
			_GUI_button[1].y = 8;
			
			_GUI_button[2].button = 6;
			_GUI_button[2].x = 365;
			_GUI_button[2].y = 8;
			
			_GUI_button[3].button = 8;
			_GUI_button[3].x = 520;
			_GUI_button[3].y = 8;
			
			_GUI_button[4].button = 3;
			_GUI_button[4].x = 675;
			_GUI_button[4].y = 8;
			
			_GUI_button[5].button = 2;
			_GUI_button[5].x = 830;
			_GUI_button[5].y = 8;
			
			_GUI_button[6].button = 0;
			_GUI_button[6].x = 209;
			_GUI_button[6].y = 677;
			
			_GUI_button[7].button = 1;
			_GUI_button[7].x = 369;
			_GUI_button[7].y = 677;
			
			_GUI_button[8].button = 2;
			_GUI_button[8].x = 529;
			_GUI_button[8].y = 677;
			
			_GUI_button[9].button = 3;
			_GUI_button[9].x = 689;
			_GUI_button[9].y = 677;
			
			_GUI_button[10].button = 4;
			_GUI_button[10].x = 849;
			_GUI_button[10].y = 677;
			
			_GUI_button[11].button = 5;
			_GUI_button[11].x = 209;
			_GUI_button[11].y = 728;
			
			_GUI_button[12].button = 6;
			_GUI_button[12].x = 369;
			_GUI_button[12].y = 728;
			
			_GUI_button[13].button = 7;
			_GUI_button[13].x = 529;
			_GUI_button[13].y = 728;
			
			_GUI_button[14].button = 8;
			_GUI_button[14].x = 689;
			_GUI_button[14].y = 728;
			
			_GUI_button[15].button = 9;
			_GUI_button[15].x = 849;
			_GUI_button[15].y = 728;
			
			
			
			// ------------------------------ Game ------------------------------ //
			// The game's variables section.
			// Making the variables to keep track of the value to be shown in the core stats.
			for(i = 0; i < 10; i += 1)
			{
				_GAME_Stats.push(0);
			}
			/* --------------------------------------------------
			 * Index table for _GAME_Stats[]
			 * 
			 * 0	= Strength
			 * 1	= Toughness
			 * 2	= Speed
			 * 3	= Intelligence
			 * 4	= Libido
			 * 5	= Sensitivity
			 * 6	= Corruption
			 * 7	= HP
			 * 8	= Lust
			 * 9	= Fatigue
			 * -------------------------------------------------- */
			
			// Making the variables to keep track of the value to be shown in the advancement stats.
			for(i = 0; i < 3; i += 1)
			{
				_GAME_Stats2.push(0);
			}
			/* --------------------------------------------------
			 * Index table for _GAME_Stats2[]
			 * 
			 * 0	= Level
			 * 1	= XP
			 * 2	= Gems
			 * -------------------------------------------------- */
			
			// Making the variables to keep track of the values to be added to the core stats.
			for(i = 0; i < 10; i += 1)
			{
				_GAME_StatsQueue.push(0);
			}
			/* --------------------------------------------------
			 * Index table for _GAME_StatsQueue[]
			 * 
			 * 0	= Strength
			 * 1	= Toughness
			 * 2	= Speed
			 * 3	= Intelligence
			 * 4	= Libido
			 * 5	= Sensitivity
			 * 6	= Corruption
			 * 7	= HP
			 * 8	= Lust
			 * 9	= Fatigue
			 * -------------------------------------------------- */
			
			// Making the variables to keep track of the values to be added to the advancement stats.
			for(i = 0; i < 3; i += 1)
			{
				_GAME_Stats2Queue.push(0);
			}
			/* --------------------------------------------------
			 * Index table for _GAME_Stats2Queue[]
			 * 
			 * 0	= Level
			 * 1	= XP
			 * 2	= Gems
			 * -------------------------------------------------- */
			
			// Making the variables to keep track of each value's icon timer in the core stats.
			for(i = 0; i < 10; i += 1)
			{
				_GAME_StatsIconTimer.push(0);
			}
			/* --------------------------------------------------
			 * Index table for _GAME_StatsIconTimer[]
			 * 
			 * 0	= Strength
			 * 1	= Toughness
			 * 2	= Speed
			 * 3	= Intelligence
			 * 4	= Libido
			 * 5	= Sensitivity
			 * 6	= Corruption
			 * 7	= HP
			 * 8	= Lust
			 * 9	= Fatigue
			 * -------------------------------------------------- */
			
			// Making the variables to keep track of each value's icon timer in the advancement stats.
			for(i = 0; i < 3; i += 1)
			{
				_GAME_Stats2IconTimer.push(0);
			}
			/* --------------------------------------------------
			 * Index table for _GAME_Stats2IconTimer[]
			 * 
			 * 0	= Level
			 * 1	= XP
			 * 2	= Gems
			 * -------------------------------------------------- */
			 
			 // Make and load the items.
			 include "..\\Items\\ItemList.as";
			 
			 // Make and load the body parts.
			 include "..\\Body Parts\\BodyPartList.as";
			 
			 // Make and load the characters.
			 include "..\\Characters\\CharacterList.as";
			
			
			
			// ------------------------------ Run Game ------------------------------ //
			// Runs the main loop of the game.
			addEventListener(Event.ENTER_FRAME, Main);
		}
		
		// The main loop of the game.
		private function Main(event:Event)
		{
			ButtonIdentify();
			Scenes();
			ButtonReset();
			updateStatIcons();
			updateStats(_GAME_ActiveCharacterID);
			updateStatsGUI()
		}
		
		// Determines which and when scenes are played.
		private function Scenes()
		{
			include "..\\Scenes\\Scenes.as";
			/* --------------------------------------------------
			 * By the way, the ".." here represents going out one
			 * folder. As in, this file, "RE_CoC.as" resides in
			 * the folder "Core". So, in order to point outside
			 * this folder and into "Scenes", ".." is used to do
			 * this.
			 * -------------------------------------------------- */
		}
		
		// Identifies which buttons are clicked.
		private function ButtonIdentify()
		{
			var tempInt:int = 0;
			for(tempInt = 0; tempInt < _BUTTON_COUNT; tempInt += 1)
			{
				if(_GUI_button[tempInt].clicked)
				{
					_GAME_ButtonPressed = tempInt;
					tempInt = _BUTTON_COUNT + 1;
				}
			}
		}
		
		// Resets all the button's state to false.
		private function ButtonReset()
		{
			_GAME_ButtonPressed = -1;
			var tempInt:int = 0;
			for(tempInt = 0; tempInt < _BUTTON_COUNT; tempInt += 1)
			{
				_GUI_button[tempInt].clicked = false;
			}
		}
		
		// Updates all the Up or Down icons next to each stat.
		private function updateStatIcons()
		{
			var tempInt:int = 0;
			for(tempInt = 0; tempInt < 10; tempInt += 1)
			{
				if(tempInt < 3)
				{
					if(_GAME_Stats2Queue[tempInt] > 0)
					{
						_GUI_stats2[tempInt]._showUpIcon();
						_GAME_Stats2IconTimer[tempInt] = 0;
					}
					else if(_GAME_Stats2Queue[tempInt] < 0)
					{
						_GUI_stats2[tempInt]._showDownIcon();
						_GAME_Stats2IconTimer[tempInt] = 0;
					}
					else
					{
						if(_GAME_Stats2IconTimer[tempInt] >= _STAT_ICON_SHOW_TIME)
						{
							_GUI_stats2[tempInt]._showNoIcon();
							_GAME_Stats2IconTimer[tempInt] = 0;
						}
						else
						{
							_GAME_Stats2IconTimer[tempInt] += _FrameTime.frameTime;
						}
					}
				}
				if(_GAME_StatsQueue[tempInt] > 0)
				{
					_GUI_stats[tempInt]._showUpIcon();
					_GAME_StatsIconTimer[tempInt] = 0;
				}
				else if(_GAME_StatsQueue[tempInt] < 0)
				{
					_GUI_stats[tempInt]._showDownIcon();
					_GAME_StatsIconTimer[tempInt] = 0;
				}
				else
				{
					if(_GAME_StatsIconTimer[tempInt] >= _STAT_ICON_SHOW_TIME)
					{
						_GUI_stats[tempInt]._showNoIcon();
						_GAME_StatsIconTimer[tempInt] = 0;
					}
					else
					{
						_GAME_StatsIconTimer[tempInt] += _FrameTime.frameTime;
					}
				}
			}
		}
		
		/* --------------------------------------------------
		 * Updates all the stats stored.
		 * 
		 * c - The character ID.
		 * -------------------------------------------------- */
		private function updateStats(c:int)
		{
			var tempInt = 0;
			var tempFloat = 0;
			for(tempInt = 0; tempInt < 10; tempInt += 1)
			{
				tempFloat = _FrameTime.frameTime * _STAT_PER_SEC;
				if(tempInt < 3)
				{
					if(_GAME_Stats2Queue[tempInt] != 0)
					{
						if(_GAME_Stats2Queue[tempInt] > 0)
						{
							if(Math.abs(_GAME_Stats2Queue[tempInt]) < 1)
							{
								switch(tempInt)
								{
									case 0:
									{
										_GAME_Stats2[tempInt] = _GAME_Characters[c].Level;
										break;
									}
									case 1:
									{
										_GAME_Stats2[tempInt] = _GAME_Characters[c].Experience;
										break;
									}
									case 2:
									{
										_GAME_Stats2[tempInt] = _GAME_Characters[c].Gems;
										break;
									}
								}
								_GAME_Stats2Queue[tempInt] = 0;
							}
							else
							{
								_GAME_Stats2[tempInt] += tempFloat;
								_GAME_Stats2Queue[tempInt] -= tempFloat;
							}
						}
						else
						{
							if(Math.abs(_GAME_Stats2Queue[tempInt]) < 1)
							{
								switch(tempInt)
								{
									case 0:
									{
										_GAME_Stats2[tempInt] = _GAME_Characters[c].Level;
										break;
									}
									case 1:
									{
										_GAME_Stats2[tempInt] = _GAME_Characters[c].Experience;
										break;
									}
									case 2:
									{
										_GAME_Stats2[tempInt] = _GAME_Characters[c].Gems;
										break;
									}
								}
								_GAME_Stats2Queue[tempInt] = 0;
							}
							else
							{
								_GAME_Stats2[tempInt] -= tempFloat;
								_GAME_Stats2Queue[tempInt] += tempFloat;
							}
						}
					}
				}
				if(_GAME_StatsQueue[tempInt] != 0)
				{
					if(_GAME_StatsQueue[tempInt] > 0)
					{
						if(Math.abs(_GAME_StatsQueue[tempInt]) < 1)
						{
							switch(tempInt)
							{
								case 0:
								{
									_GAME_Stats[tempInt] = _GAME_Characters[c].Strength;
									break;
								}
								case 1:
								{
									_GAME_Stats[tempInt] = _GAME_Characters[c].Toughness;
									break;
								}
								case 2:
								{
									_GAME_Stats[tempInt] = _GAME_Characters[c].Speed;
									break;
								}
								case 3:
								{
									_GAME_Stats[tempInt] = _GAME_Characters[c].Intelligence;
									break;
								}
								case 4:
								{
									_GAME_Stats[tempInt] = _GAME_Characters[c].Libido;
									break;
								}
								case 5:
								{
									_GAME_Stats[tempInt] = _GAME_Characters[c].Sensitivity;
									break;
								}
								case 6:
								{
									_GAME_Stats[tempInt] = _GAME_Characters[c].Corruption;
									break;
								}
								case 7:
								{
									_GAME_Stats[tempInt] = _GAME_Characters[c].HP;
									break;
								}
								case 8:
								{
									_GAME_Stats[tempInt] = _GAME_Characters[c].Lust;
									break;
								}
								case 9:
								{
									_GAME_Stats[tempInt] = _GAME_Characters[c].Fatigue;
									break;
								}
							}
							_GAME_StatsQueue[tempInt] = 0;
						}
						else
						{
							_GAME_Stats[tempInt] += tempFloat;
							_GAME_StatsQueue[tempInt] -= tempFloat;
						}
					}
					else
					{
						if(Math.abs(_GAME_StatsQueue[tempInt]) < 1)
						{
							switch(tempInt)
							{
								case 0:
								{
									_GAME_Stats[tempInt] = _GAME_Characters[c].Strength;
									break;
								}
								case 1:
								{
									_GAME_Stats[tempInt] = _GAME_Characters[c].Toughness;
									break;
								}
								case 2:
								{
									_GAME_Stats[tempInt] = _GAME_Characters[c].Speed;
									break;
								}
								case 3:
								{
									_GAME_Stats[tempInt] = _GAME_Characters[c].Intelligence;
									break;
								}
								case 4:
								{
									_GAME_Stats[tempInt] = _GAME_Characters[c].Libido;
									break;
								}
								case 5:
								{
									_GAME_Stats[tempInt] = _GAME_Characters[c].Sensitivity;
									break;
								}
								case 6:
								{
									_GAME_Stats[tempInt] = _GAME_Characters[c].Corruption;
									break;
								}
								case 7:
								{
									_GAME_Stats[tempInt] = _GAME_Characters[c].HP;
									break;
								}
								case 8:
								{
									_GAME_Stats[tempInt] = _GAME_Characters[c].Lust;
									break;
								}
								case 9:
								{
									_GAME_Stats[tempInt] = _GAME_Characters[c].Fatigue;
									break;
								}
							}
							_GAME_StatsQueue[tempInt] = 0;
						}
						else
						{
							_GAME_Stats[tempInt] += tempFloat;
							_GAME_StatsQueue[tempInt] += tempFloat;
						}
					}
				}
			}
		}
		
		// Updates all the stats displayed.
		private function updateStatsGUI()
		{
			var tempInt = 0;
			for(tempInt = 0; tempInt < 10; tempInt += 1)
			{
				if(tempInt < 3)
				{
					_GUI_stats2[tempInt].statNum = int(_GAME_Stats2[tempInt]);
				}
				_GUI_stats[tempInt].statNum = int(_GAME_Stats[tempInt]);
			}
		}
		
		// Resets all the player's stats to the minimum.
		private function resetPlayer()
		{
			_GAME_Characters.splice(0, 1, new Character());
			_GAME_Characters[0].Name = ""; // Setting the name of the character.
			_GAME_Characters[0].Appearance = ""; // Setting the appearance of the character.
			_GAME_Characters[0].BattleAppearance = ""; // Setting the appearance of the character when battling him/her/it.
			_GAME_Characters[0].Age = 18; // Setting the age of the character.
			_GAME_Characters[0].BodyPartList.push(_GAME_BodyParts[0]); // 0 - Breasts.
			_GAME_Characters[0].BodyPartList.push(_GAME_BodyParts[5]); // 1 - Hip.
			_GAME_Characters[0].BodyPartList.push(_GAME_BodyParts[4]); // 2 - Butt.
			_GAME_Characters[0].BodyPartList.push(_GAME_BodyParts[3]); // 3 - Anus.
			_GAME_Characters[0].Strength = 0; // Setting the strength of the character.
			_GAME_Characters[0].Toughness = 0; // Setting the toughness of the character.
			_GAME_Characters[0].Speed = 0; // Setting the speed of the character.
			_GAME_Characters[0].Intelligence = 0; // Setting the intelligence of the character.
			_GAME_Characters[0].Libido = 0; // Setting the libido of the character.
			_GAME_Characters[0].Sensitivity = 0; // Setting the sensitivity of the character.
			_GAME_Characters[0].Corruption = 0; // Setting the corruption of the character.
			_GAME_Characters[0].BaseHP = 50; // Setting the base hp of the character.
			_GAME_Characters[0].Level = 1; // Setting the level of the character.
			_GAME_Characters[0].HP = _GAME_Characters[0].MaxHP; // Setting the hp of the character to the max.
			_GAME_Characters[0].Lust = 0; // Setting the lust of the character.
			_GAME_Characters[0].Fatigue = 0; // Setting the fatigue of the character.
			_GAME_Characters[0].Gems = 0; // Setting the amount gems of on the character.
			_GAME_Characters[0].Height = 67; // Setting the height of the character (inches).
			_GAME_Characters[0].Femininity = 0; // Setting the femininity of the character.
			_GAME_Characters[0].Thickness = 0; // Setting how thick set the character is.
			_GAME_Characters[0].MuscleTone = 0; // Setting the muscle tone of the character.
			_GAME_Characters[0].TeaseLevel = 0; // Setting the teasing level of the character.
			_GAME_Characters[0].Fertility = 0; // Setting the fertility rating of the character.
			_GAME_Characters[0].inventory.push(new Inventory); // 0 - Normal inventory.
			_GAME_Characters[0].inventory.push(new Inventory); // 1 - Key inventory.
		}
		
		// Resets all the displayed stats to 0.
		private function resetStats()
		{
			var tempInt = 0;
			for(tempInt = 0; tempInt < 10; tempInt += 1)
			{
				if(tempInt < 3)
				{
					_GAME_Stats2[tempInt] = 0;
					_GAME_Stats2Queue[tempInt] = 0;
					_GUI_stats2[tempInt].statNum = 0;
				}
				_GAME_Stats[tempInt] = 0;
				_GAME_StatsQueue[tempInt] = 0;
				_GUI_stats[tempInt].statNum = 0;
			}
		}
		
		// Refresh all the displayed stats.
		private function setActiveCharacterID(c:int)
		{
			var i:int = 0;
			// 0
			_GAME_Stats[i] = _GAME_Characters[c].Strength;
			_GAME_StatsQueue[i] = 0;
			_GUI_stats[i].statNum = _GAME_Characters[c].Strength;
			_GAME_Stats2[i] = _GAME_Characters[c].Level;
			_GAME_Stats2Queue[i] = 0;
			_GUI_stats2[i].statNum = _GAME_Characters[c].Level;
			i += 1;
			
			// 1
			_GAME_Stats[i] = _GAME_Characters[c].Toughness;
			_GAME_StatsQueue[i] = 0;
			_GUI_stats[i].statNum = _GAME_Characters[c].Toughness;
			_GAME_Stats2[i] = _GAME_Characters[c].Experience;
			_GAME_Stats2Queue[i] = 0;
			_GUI_stats2[i].statNum = _GAME_Characters[c].Experience;
			i += 1;
			
			// 2
			_GAME_Stats[i] = _GAME_Characters[c].Speed;
			_GAME_StatsQueue[i] = 0;
			_GUI_stats[i].statNum = _GAME_Characters[c].Speed;
			_GAME_Stats2[i] = _GAME_Characters[c].Gems;
			_GAME_Stats2Queue[i] = 0;
			_GUI_stats2[i].statNum = _GAME_Characters[c].Gems;
			i += 1;
			
			// 3
			_GAME_Stats[i] = _GAME_Characters[c].Intelligence;
			_GAME_StatsQueue[i] = 0;
			_GUI_stats[i].statNum = _GAME_Characters[c].Intelligence;
			i += 1;
			
			// 4
			_GAME_Stats[i] = _GAME_Characters[c].Libido;
			_GAME_StatsQueue[i] = 0;
			_GUI_stats[i].statNum = _GAME_Characters[c].Libido;
			i += 1;
			
			// 5
			_GAME_Stats[i] = _GAME_Characters[c].Sensitivity;
			_GAME_StatsQueue[i] = 0;
			_GUI_stats[i].statNum = _GAME_Characters[c].Sensitivity;
			i += 1;
			
			// 6
			_GAME_Stats[i] = _GAME_Characters[c].Corruption;
			_GAME_StatsQueue[i] = 0;
			_GUI_stats[i].statNum = _GAME_Characters[c].Corruption;
			i += 1;
			
			// 7
			_GAME_Stats[i] = _GAME_Characters[c].HP;
			_GAME_StatsQueue[i] = 0;
			_GUI_stats[i].statNum = _GAME_Characters[c].HP;
			_GUI_stats[i].maxNum = _GAME_Characters[c].MaxHP;
			i += 1;
			
			// 8
			_GAME_Stats[i] = _GAME_Characters[c].Lust;
			_GAME_StatsQueue[i] = 0;
			_GUI_stats[i].statNum = _GAME_Characters[c].Lust;
			i += 1;
			
			// 9
			_GAME_Stats[i] = _GAME_Characters[c].Fatigue;
			_GAME_StatsQueue[i] = 0;
			_GUI_stats[i].statNum = _GAME_Characters[c].Fatigue;
			i += 1;
		}
	}
}