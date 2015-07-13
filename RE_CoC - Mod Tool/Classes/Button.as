package Classes
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class Button extends Sprite
	{
		private var _clicked:Boolean = false;
		private var _mouseDowned:Boolean = false;
		
		public function Button()
		{
			_Text.text = "";
			_glow.alpha = 0;
			addEventListener(MouseEvent.MOUSE_OVER, _mouseOver);
			addEventListener(MouseEvent.MOUSE_OUT, _mouseOut);
			addEventListener(MouseEvent.MOUSE_UP, _mouseUp);
			addEventListener(MouseEvent.MOUSE_DOWN, _mouseDown);
		}
		
		private function _mouseOver(event:MouseEvent)
		{
			if(!(_mouseDowned))
			{
				_glow.alpha = 1;
			}
		}
		
		private function _mouseOut(event:MouseEvent)
		{
			_glow.alpha = 0;
			_mouseDowned = false;
		}
		
		private function _mouseUp(event:MouseEvent)
		{
			_clicked = true;
			_glow.alpha = 1;
			_mouseDowned = false;
		}
		
		private function _mouseDown(event:MouseEvent)
		{
			_glow.alpha = 0;
			_mouseDowned = true;
		}
		
		public function get clicked():Boolean
		{
			return _clicked;
		}
		
		public function set clicked(c:Boolean)
		{
			_clicked = c;
		}
		
		public function get Name():String
		{
			return _text.text;
		}
		
		public function set Name(n:String)
		{
			_Text.text = n;
		}
	}
}