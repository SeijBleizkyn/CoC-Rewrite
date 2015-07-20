/* ----------------------------------------------------------------------------------------------------
 * This is the breast class of the Corruption of Champions game.
 * This determines what variables and functions all breasts will have.
 * 
 * Game made by Fenoxo.
 * Code rewritten by Seij Bleizkyn.
 * ---------------------------------------------------------------------------------------------------- */

package CoC_Game.Body_Parts.Breast
{
	import CoC_Engine.Character.BodyPart.BodyPart;
	import CoC_Game.Body_Parts.Nipple.NippleContainer;
	import CoC_Game.Enumerations.BodyParts.BodyPart_Type;
	import CoC_Game.Enumerations.BodyParts.BodyPart_Race;
	import CoC_Game.Enumerations.Ingestable.Drink_Type;

	public class Breast extends BodyPart
	{
		protected var _liquidProduced:String;
		protected var _nipple:NippleContainer = new NippleContainer();
		
		public function Breast()
		{
			_ID = 1;
			_Name = "Breast";
			_Value.push(0); // 0 - Breast size.
			_Value.push(0); // 1 - Current amount of liquid.
			_Type.push(BodyPart_Type._BREAST); // 0 - Is a breast.
			_Race.push(BodyPart_Race._HUMAN); // 0 - Is a human breast.
			_liquidProduced = Drink_Type._MILK; // Initially produced liquid is milk.
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
			
			if(_Value[1] > this.MaxLiquid)
			{
				_Value[1] = this.MaxLiquid;
			}
		}
		
		public function get MaxLiquid():Number
		{
			return (_Value[0] * 10);
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