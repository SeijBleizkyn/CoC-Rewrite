/* ----------------------------------------------------------------------------------------------------
 * This is the nipple container class of the Corruption of Champions game.
 * This class manages nipples.
 * 
 * Game made by Fenoxo.
 * Code rewritten by Seij Bleizkyn.
 * ---------------------------------------------------------------------------------------------------- */

package CoC_Game.Body_Parts.Nipple
{
	import CoC_Game.Body_Parts.Nipple.Nipple;
	import CoC_Engine.Character.BodyPart.Container;
	
	public class NippleContainer extends Container
	{
		private var _nipples:Vector.<Nipple> = new Vector.<Nipple>;
		
		public function NippleContainer()
		{
		}
		
		public function AddNipple()
		{
			_nipples.push(new Nipple());
		}
		
		public function HasNipple():Boolean
		{
			return (_nipples.length > 0);
		}
		
		/* --------------------------------------------------
		 * n - The nipple you're targeting (starts at 0).
		 * -------------------------------------------------- */
		public function GetLength(n:int):Number
		{
			return _nipples[n].Length;
		}
		
		/* --------------------------------------------------
		 * n - The nipple you're targeting (starts at 0).
		 * l - The length to set it to.
		 * -------------------------------------------------- */
		public function SetLength(n:int, l:Number)
		{
			_nipples[n].Length = l;
		}
		
		/* --------------------------------------------------
		 * l - The length to add.
		 * -------------------------------------------------- */
		public function SetAllLength(l:Number)
		{
			var counter:int = 0;
			
			for(counter = 0; counter < _nipples.length; counter += 1)
			{
				_nipples[counter].Length = l;
			}
		}
		
		/* --------------------------------------------------
		 * l - The length to add.
		 * -------------------------------------------------- */
		public function AddAllLength(l:Number)
		{
			var counter:int = 0;
			
			for(counter = 0; counter < _nipples.length; counter += 1)
			{
				_nipples[counter].Length += l;
			}
		}
		
		/* --------------------------------------------------
		 * n - The nipple you're targeting (starts at 0).
		 * -------------------------------------------------- */
		public function GetFuckableStatus(n:int):Boolean
		{
			return _nipples[n].isFuckable;
		}
		
		/* --------------------------------------------------
		 * n - The nipple you're targeting (starts at 0).
		 * l - The fuckable status you are setting it to.
		 * -------------------------------------------------- */
		public function SetFuckableStatus(n:int, f:Boolean)
		{
			_nipples[n].isFuckable = f;
		}
		
		/* --------------------------------------------------
		 * f - The fuckable status you are setting them to.
		 * -------------------------------------------------- */
		public function SetAllFuckableStatus(f:Boolean)
		{
			var counter:int = 0;
			
			for(counter = 0; counter < _nipples.length; counter += 1)
			{
				_nipples[counter].isFuckable = f;
			}
		}
		
		/* --------------------------------------------------
		 * i - The nipple you're targeting (starts at 0).
		 * l - The inverted status you are setting it to.
		 * -------------------------------------------------- */
		public function SetInvertedStatus(i:int, i:Boolean)
		{
			_nipples[n].isInvertable = i;
		}
		
		/* --------------------------------------------------
		 * i - The nipple you're targeting (starts at 0).
		 * -------------------------------------------------- */
		public function GetInvertedStatus(i:int):Boolean
		{
			return _nipples[n].isInvertable;
		}
		
		/* --------------------------------------------------
		 * i - The inverted status you are setting them to.
		 * -------------------------------------------------- */
		public function SetAllInvertedStatus(i:Boolean)
		{
			var counter:int = 0;
			
			for(counter = 0; counter < _nipples.length; counter += 1)
			{
				_nipples[counter].isInverted = i;
			}
		}
		
		/* --------------------------------------------------
		 * n - The nipple you're targeting (starts at 0).
		 * -------------------------------------------------- */
		public function GetTypes(n:int):Vector.<String>
		{
			return _nipples[n].Type;
		}
		
		/* --------------------------------------------------
		 * n - The nipple you're targeting (starts at 0).
		 * t - The vector of types you are setting it to.
		 * -------------------------------------------------- */
		public function SetTypes(n:int, t:Vector.<String>)
		{
			_nipples[n].Type = t;
		}
		
		/* --------------------------------------------------
		 * t - The vector of types you are setting them to.
		 * -------------------------------------------------- */
		public function SetAllTypes(t:Vector.<String>)
		{
			var counter:int = 0;
			
			for(counter = 0; counter < _nipples.length; counter += 1)
			{
				_nipples[counter].Type = t;
			}
		}
		
		/* --------------------------------------------------
		 * n - The nipple you're targeting (starts at 0).
		 * t - The type you are adding.
		 * -------------------------------------------------- */
		public function AddType(n:int, t:String)
		{
			// Only add the type if the nipple doesn't already have that type.
			if(!(_nipples[n].hasType(t)))
			{
				_nipples[n].Type.push(t);
			}
		}
		
		/* --------------------------------------------------
		 * t - The type you are adding.
		 * -------------------------------------------------- */
		public function AddAllType(t:String)
		{
			var counter:int = 0;
			
			for(counter = 0; counter < _nipples.length; counter += 1)
			{
				if(!(_nipples[counter].hasType(t)))
				{
					_nipples[counter].Type.push(t);
				}
			}
		}
		
		/* --------------------------------------------------
		 * n - The nipple you're targeting (starts at 0).
		 * t - The type you are removing.
		 * -------------------------------------------------- */
		public function RemoveType(n:int, t:String)
		{
			// Only remove the type if the nipple already has that type.
			if(_nipples[n].hasType(t))
			{
				_nipples[n].Type.splice(_nipples[n].findType(t), 1);
			}
		}
		
		/* --------------------------------------------------
		 * t - The type you are removing.
		 * -------------------------------------------------- */
		public function RemoveAllType(t:String)
		{
			var counter:int = 0;
			
			for(counter = 0; counter < _nipples.length; counter += 1)
			{
				RemoveType(counter, t);
			}
		}
		
		/* --------------------------------------------------
		 * n - The nipple you're targeting (starts at 0).
		 * t - The initial type you are setting the nipple
		 *     to.
		 * -------------------------------------------------- */
		public function ClearType(n:int, t:String)
		{
			_nipples[n].clearType();
			AddType(n, t);
		}
		
		/* --------------------------------------------------
		 * t - The initial type you are setting the nipple
		 *     to.
		 * -------------------------------------------------- */
		public function ClearAllType(t:String)
		{
			var counter:int = 0;
			
			for(counter = 0; counter < _nipples.length; counter += 1)
			{
				if(_nipples[counter].hasType(t))
					{
						_nipples[counter].clearType();
						AddAllType(t);
					}
				}
			}
		}
		
		/* --------------------------------------------------
		 * n - The nipple you're targeting (starts at 0).
		 * -------------------------------------------------- */
		public function GetRaces(n:int):Vector.<String>
		{
			return _nipples[n].Race;
		}
		
		/* --------------------------------------------------
		 * n - The nipple you're targeting (starts at 0).
		 * r - The vector of races you are setting it to.
		 * -------------------------------------------------- */
		public function SetRaces(n:int, r:Vector.<String>)
		{
			_nipples[n].Race = r;
		}
		
		/* --------------------------------------------------
		 * t - The vector of types you are setting them to.
		 * -------------------------------------------------- */
		public function SetAllRaces(r:Vector.<String>)
		{
			var counter:int = 0;
			
			for(counter = 0; counter < _nipples.length; counter += 1)
			{
				_nipples[counter].Race = r;
			}
		}
		
		/* --------------------------------------------------
		 * n - The nipple you're targeting (starts at 0).
		 * r - The race you are adding.
		 * -------------------------------------------------- */
		public function AddRace(n:int, r:String)
		{
			// Only add the race if the nipple doesn't already have that race.
			if(!(_nipples[n].hasRace(r)))
			{
				_nipples[n].Race.push(r);
			}
		}
		
		/* --------------------------------------------------
		 * r - The race you are adding.
		 * -------------------------------------------------- */
		public function AddAllRace(r:String)
		{
			var counter:int = 0;
			
			for(counter = 0; counter < _nipples.length; counter += 1)
			{
				if(!(_nipples[counter].hasRace(r)))
				{
					_nipples[counter].Race.push(r);
				}
			}
		}
		
		/* --------------------------------------------------
		 * n - The nipple you're targeting (starts at 0).
		 * r - The race you are removing.
		 * -------------------------------------------------- */
		public function RemoveRace(n:int, r:String)
		{
			// Only remove the race if the nipple already has that race.
			if(_nipples[n].hasRace(r))
			{
				_nipples[n].Race.splice(_nipples[n].findRace(r), 1);
			}
		}
		
		/* --------------------------------------------------
		 * r - The race you are removing.
		 * -------------------------------------------------- */
		public function RemoveAllRace(r:String)
		{
			var counter:int = 0;
			
			for(counter = 0; counter < _nipples.length; counter += 1)
			{
				if(_nipples[counter].hasRace(r))
				{
					_nipples[counter].Race.splice(_nipples[counter].findRace(r), 1);
				}
			}
		}
		
		/* --------------------------------------------------
		 * n - The nipple you're targeting (starts at 0).
		 * r - The initial race you are setting the nipple
		 *     to.
		 * -------------------------------------------------- */
		public function ClearRace(n:int, r:String)
		{
			_nipples[n].clearRace();
			AddRace(n, r);
		}
		
		/* --------------------------------------------------
		 * r - The initial race you are setting the nipple
		 *     to.
		 * -------------------------------------------------- */
		public function ClearAllRace(r:String)
		{
			var counter:int = 0;
			
			for(counter = 0; counter < _nipples.length; counter += 1)
			{
				if(_nipples[counter].hasRace(r))
				{
					_nipples[counter].clearRace();
					AddAllRace(r);
				}
			}
		}
		
		public function get Adjective():String
		{
			var descriptionText:String = "";
			
			if(_nipples.length > 1)
			{
				descriptionText = "multiple";
			}
			
			if(_nipples[0].isFuckable)
			{
				if(descriptionText != "")
				{
					descriptionText += ", fuckable";
				}
				else
				{
					descriptionText = "fuckable";
				}
			}
			
			if(_nipples[0].isInverted)
			{
				if(descriptionText != "")
				{
					descriptionText += ", inverted";
				}
				else
				{
					descriptionText = "inverted";
				}
			}
			
			if(descriptionText == "")
			{
				descriptionText = "\b";
			}
			
			return descriptionText;
		}
		
		public function get Noun():String
		{
			var descriptionText:String = "";
			var randNum:int = Math.floor(Math.random() * 2);
			
			switch(randNum)
			{
				case 0:
				{
					descriptionText = "nipples";
					break;
				}
				case 1:
				{
					descriptionText = "teets";
					break;
				}
				case 2:
				{
					descriptionText = "tits";
					break;
				}
				default:
				{
					descriptionText = "ERROR";
					break;
				}
			}
			
			return descriptionText;
		}
	}
}