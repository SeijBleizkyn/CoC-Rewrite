/* ----------------------------------------------------------------------------------------------------
 * This is the nipple class of the Corruption of Champions game.
 * This determines what variables and functions all nipples will have.
 * 
 * Game made by Fenoxo.
 * Code rewritten by Seij Bleizkyn.
 * ---------------------------------------------------------------------------------------------------- */

package CoC_Game.Body_Parts.Nipple
{
	import CoC_Engine.Character.BodyPart.BodyPart;
	import CoC_Game.Enumerations.BodyParts.BodyPart_Type;
	import CoC_Game.Enumerations.BodyParts.BodyPart_Race;

	public class Nipple extends BodyPart;
	{
		public function Nipple()
		{
			_ID = 6;
			_Name = "Nipple";
			_Value.push(0.25); // 0 - Nipple length.
			_Flag.push(false); // 0 - Fuckable nipples?
			_Flag.push(false); // 1 - Inverted nipples?
			_Type.push(BodyPart_Type._NIPPLE); // 0 - Is a nipple.
			_Race.push(BodyPart_Race._HUMAN); // 0 - Is a generic nipple.
		}
		
		public function get Length():Number
		{
			return _Value[0];
		}
		
		public function set Length(l:Number)
		{
			_Value[0] = l;
		}
		
		public function get isFuckable():Boolean
		{
			return _Flag[0];
		}
		
		public function set isFuckable(f:Boolean)
		{
			_Flag[0] = f;
		}
		
		public function get isInverted():Boolean
		{
			return _Flag[1];
		}
		
		public function set isInverted(i:Boolean)
		{
			_Flag[1] = i;
		}
	}
}