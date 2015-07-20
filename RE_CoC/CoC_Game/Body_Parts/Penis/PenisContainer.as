/* ----------------------------------------------------------------------------------------------------
 * This is the penis container class of the Corruption of Champions game.
 * This class manages penises.
 * 
 * Game made by Fenoxo.
 * Code rewritten by Seij Bleizkyn.
 * ---------------------------------------------------------------------------------------------------- */

package CoC_Game.Body_Parts.Penis
{
	import CoC_Game.Body_Parts.Penis.Penis;
	import CoC_Engine.Character.BodyPart.Container;
	
	public class PenisContainer extends Container
	{
		private var _penises:Vector.<Penis> = new Vector.<Penis>();
		
		public function PenisContainer()
		{
		}
		
		public function AddPenis()
		{
			_penises.push(new Penis());
		}
		
		/* --------------------------------------------------
		 * p - The penis you're targeting (starts at 0).
		 * -------------------------------------------------- */
		public function GetLength(p:int):Number
		{
			return _penises[p].Length;
		}
		
		/* --------------------------------------------------
		 * p - The penis you're targeting (starts at 0).
		 * l - The length to set it to.
		 * -------------------------------------------------- */
		public function SetLength(p:int, l:Number)
		{
			_penises[n].Length = l;
		}
	}
}