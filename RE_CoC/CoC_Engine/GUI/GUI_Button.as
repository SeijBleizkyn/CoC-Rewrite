/* ----------------------------------------------------------------------------------------------------
 * This should be attached to the GUI_Button MovieClip in "RE_CoC.fla.".
 * How all buttons look in the game is done from here.
 * It is basically a template for the buttons in the game.
 * 
 * Game made by Fenoxo.
 * Code rewritten by Seij Bleizkyn.
 * ---------------------------------------------------------------------------------------------------- */

package CoC_Engine.GUI
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import CoC_Engine.Miscellaneous.Resolution;
	
	public class GUI_Button extends Sprite
	{
		private var _Label:String = "";
		private var _Button:int = 0;
		private var _buttonsAlpha:Vector.<Number> = new Vector.<Number>;
		private const MAX_BUTTON_STYLES:int = 10;
		/* --------------------------------------------------
		 * The amount of different buttons pictures there are
		 * in this movieclip.
		 * DON'T CHANGE UNLESS YOU KNOW WHAT YOU ARE DOING!
		 * -------------------------------------------------- */
		private var _Clicked:Boolean = false;
		
		public function GUI_Button(index:int)
		{
			_Button = index;
			glow.alpha = 0;
			
			var i:int = 0;
			for (i = 0; i < MAX_BUTTON_STYLES; i += 1)
			{
				_buttonsAlpha.push(0);
			}
			_buttonsAlpha[index] = 1;
			
			_hidePopup();// Hide the popup by default.
			
			addEventListener(MouseEvent.MOUSE_OVER, _mouseOver);
			addEventListener(MouseEvent.MOUSE_OUT, _mouseOut);
			addEventListener(MouseEvent.MOUSE_UP, _mouseUp);
			addEventListener(Event.ENTER_FRAME, Update);
		}
		
		private function Update(event:Event)
		{
			labelName.text = _Label;
			// This checks if there's actually anything in the label, if not, hide this button.
			if (_Label == "")
			{
				alpha = 0;
			}
			else
			{
				alpha = 1;
			}
			button0.alpha = _buttonsAlpha[0];
			button1.alpha = _buttonsAlpha[1];
			button2.alpha = _buttonsAlpha[2];
			button3.alpha = _buttonsAlpha[3];
			button4.alpha = _buttonsAlpha[4];
			button5.alpha = _buttonsAlpha[5];
			button6.alpha = _buttonsAlpha[6];
			button7.alpha = _buttonsAlpha[7];
			button8.alpha = _buttonsAlpha[8];
			button9.alpha = _buttonsAlpha[9];
			// This checks if there's actually anything in the popup's label, if not, hide it.
		}
		
		private function _mouseOver(event:MouseEvent)
		{
			glow.alpha = 0.25;
			if (popup.labelName.text == "" || stage.mouseX < this.x || stage.mouseX > this.x + glow.width || stage.mouseY < this.y || stage.mouseY > this.y + glow.height)
			{
				_hidePopup();
			}
			else
			{
				_showPopup();
			}
		}
		
		private function _mouseOut(event:MouseEvent)
		{
			glow.alpha = 0;
			_hidePopup();
		}
		
		private function _mouseUp(event:MouseEvent)
		{
			_Clicked = true;
		}
		
		private function _hidePopup()
		{
			popup.width = 1;
			popup.height = 1;
			popup.alpha = 0;
		}
		
		private function _showPopup()
		{
			popup.width = 322;
			popup.height = 219;
			popup.alpha = 1;
			
			// The following if statements helps position the popup text so that it doesn't appear off screen.
			if(this.x + glow.width > Resolution.WIDTH - popup.width + glow.width * 0.5)
			{
				popup.x = glow.x - popup.width + glow.width * 0.5;
			}
			else
			{
				popup.x = glow.x + glow.width * 0.5;
			}
			if(this.y + glow.height > Resolution.HEIGHT - popup.height)
			{
				popup.y = glow.y - popup.height;
			}
			else
			{
				popup.y = glow.y + glow.height;
			}
		}
		
		public function set buttonLabel(Value:String)
		{
			_Label = Value;
		}
		
		public function set button(index:int)
		{
			var i:int = 0;
			for (i = 0; i < MAX_BUTTON_STYLES; i += 1)
			{
				_buttonsAlpha[i] = 0;
			}
			_buttonsAlpha[index] = 1;
		}
		
		public function get clicked():Boolean
		{
			return _Clicked;
		}
		
		public function set clicked(Value:Boolean)
		{
			_Clicked = Value;
		}
		
		public function set buttonW(Value:Number)
		{
			button0.width = Value;
			button1.width = Value;
			button2.width = Value;
			button3.width = Value;
			button4.width = Value;
			button5.width = Value;
			button6.width = Value;
			button7.width = Value;
			button8.width = Value;
			button9.width = Value;
			labelName.width = Value;
			glow.width = Value;
		}
		
		public function set buttonH(Value:Number)
		{
			button0.height = Value;
			button1.height = Value;
			button2.height = Value;
			button3.height = Value;
			button4.height = Value;
			button5.height = Value;
			button6.height = Value;
			button7.height = Value;
			button8.height = Value;
			button9.height = Value;
			labelName.height = Value;
			glow.height = Value;
		}
		
		public function set popupLabel(Value:String)
		{
			popup.labelName.text = Value;
		}
	}
}