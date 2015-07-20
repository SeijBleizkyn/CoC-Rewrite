/* ----------------------------------------------------------------------------------------------------
 * This is the testicle class of the Corruption of Champions game.
 * This determines what variables and functions all testicles will have.
 * 
 * Game made by Fenoxo.
 * Code rewritten by Seij Bleizkyn.
 * ---------------------------------------------------------------------------------------------------- */

package CoC_Game.Body_Parts.Testicle
{
	import CoC_Game.Enumerations.BodyPart.BodyPart_Type;
	import CoC_Game.Enumerations.BodyPart.BodyPart_Race;
	import CoC_Game.Enumerations.Ingestable.Drink_Type;
	
	public class Testicle
	{
		protected var _liquidProduced:String;
		
		public function Testicle()
		{
			_ID = 9;
			_Name = "Testicle";
			_Value.push(1); // 0 - Testicle size.
			_Value.push(0); // 1 - Current amount of liquid.
			_Type.push(BodyPart_Type._TESTICLE); // 0 - Is a penis.
			_Race.push(BodyPart_Race._HUMAN); // 0 - Is a human penis.
			_liquidProduced = Drink_Type._CUM; // Initially produced liquid is cum.
		}
		
		public function get Size():Number
		{
			return _Value[0];
		}
		
		public function set Size(s:Number)
		{
			_Value[0] = s;
		}
		
		public function get LiquidAmount():Number
		{
			return _Value[1];
		}
		
		public function set LiquidAmount(l:Number)
		{
			_Value[1] = l;
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
