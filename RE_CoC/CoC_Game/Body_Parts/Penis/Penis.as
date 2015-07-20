/* ----------------------------------------------------------------------------------------------------
 * This is the penis class of the Corruption of Champions game.
 * This determines what variables and functions all penises will have.
 * 
 * Game made by Fenoxo.
 * Code rewritten by Seij Bleizkyn.
 * ---------------------------------------------------------------------------------------------------- */

package CoC_Game.Body_Parts.Penis
{
	import CoC_Engine.Character.BodyPart.BodyPart;
	import CoC_Game.Enumerations.BodyParts.BodyPart_Type;
	import CoC_Game.Enumerations.BodyParts.BodyPart_Race;

	public class Penis extends BodyPart
	{
		public function Penis()
		{
			_ID = 7;
			_Name = "Penis";
			_Value.push(5.5); // 0 - Penis size.
			_Value.push(1); // 1 - Penis thickness.
			_Flag.push(true); // 0 - Virgin?
			_Type.push(BodyPart_Type._PENIS); // 0 - Is a penis.
			_Race.push(BodyPart_Race._HUMAN); // 0 - Is a human penis.
		}
		
		public function get Size():Number
		{
			return _Value[0];
		}
		
		public function set Size(s:Number)
		{
			_Value[0] = s;
		}
		
		public function get Thickness():Number
		{
			return _Value[1];
		}
		
		public function set Thickness(t:Number)
		{
			_Value[1] = t;
		}
		
		public function get LitersPerHour():Number
		{
			return _Value[2];
		}
		
		public function set LitersPerHour(l:Number)
		{
			_Value[2] = l;
		}
		
		public function get LiquidProduced():String
		{
			return _liquidProduced;
		}
		
		public function set LiquidProduced(l:String)
		{
			_liquidProduced = l;
		}
	}
}