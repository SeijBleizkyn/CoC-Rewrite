/* ----------------------------------------------------------------------------------------------------
 * This is the breast container class of the Corruption of Champions game.
 * This class manages breasts.
 * 
 * Game made by Fenoxo.
 * Code rewritten by Seij Bleizkyn.
 * ---------------------------------------------------------------------------------------------------- */

package CoC_Game.Body_Parts.Breast
{
	import CoC_Engine.Character.BodyPart.Container;
	import CoC_Game.Body_Parts.Breast.Breast;
	import CoC_Game.Enumerations.BodyPart.Lactation;
	
	public class BreastContainer extends Container
	{
		private var _row:Vector.<Vector.<Breast>> = new Vector.<Vector.<Breast>>();
		private var _lactation:Number;
		
		public function BreastContainer()
		{
			var counter:int = 0;
			var maxRows:int = 3;
			
			for(counter = 0; counter < maxRows; counter += 1)
			{
				_row.push(new Vector.<Breast>());
			}
			
			_lactation = Lactation._NONE;
		}
		
		/* --------------------------------------------------
		 * r - The row to add a breast to (starts from 0).
		 * -------------------------------------------------- */
		public function AddBreast(r:int)
		{
			_row[r].push(new Breast());
		}
		
		public function HasBreast():Boolean
		{
			var counter:int = 0;
			for(counter = 0; counter < _row.length; counter += 1)
			{
				if(_row[counter].length > 0)
				{
					return true;
				}
			}
			
			return false;
		}
		
		/* --------------------------------------------------
		 * r - The row of breast(s) you are targeting
		 *     (starts from 0).
		 * b - The breast you are targeting.
		 * -------------------------------------------------- */
		public function GetSize(r:int, b:int):Number
		{
			return _row[r][b].Size;
		}
		
		/* --------------------------------------------------
		 * r - The row of breast(s) you are targeting
		 *     (starts from 0).
		 * b - The breast you are targeting.
		 * s - The size you are setting it to.
		 * -------------------------------------------------- */
		public function SetSize(r:int, b:int, s:Number)
		{
			_row[r][b].Size = s;
		}
		
		/* --------------------------------------------------
		 * r - The row of breast(s) you are targeting
		 *     (starts from 0).
		 * s - The size to set.
		 * -------------------------------------------------- */
		public function SetAllSize(r:int, s:Number)
		{
			var counter:int = 0;
			
			for(counter = 0; counter < _row[r].length; counter += 1)
			{
				_row[r][counter].Size = s;
			}
		}
		
		/* --------------------------------------------------
		 * r - The row of breast(s) you are targeting
		 *     (starts from 0).
		 * s - The size to add.
		 * -------------------------------------------------- */
		public function AddAllSize(r:int, s:Number)
		{
			var counter:int = 0;
			
			for(counter = 0; counter < _row[r].length; counter += 1)
			{
				_row[r][counter].Size += s;
			}
		}
		
		/* --------------------------------------------------
		 * r - The row of breast(s) you are targeting
		 *     (starts from 0).
		 * b - The breast you are targeting.
		 * -------------------------------------------------- */
		public function GetLiquidAmount(r:int, b:int):Number
		{
			return _row[r][b].LiquidAmount;
		}
		
		/* --------------------------------------------------
		 * r - The row of breast(s) you are targeting
		 *     (starts from 0).
		 * b - The breast you are targeting.
		 * l - The liquid amount you are setting it to.
		 * -------------------------------------------------- */
		public function SetLiquidAmount(r:int, b:int, l:Number)
		{
			_row[r][b].LiquidAmount = l;
		}
		
		/* --------------------------------------------------
		 * r - The row of breast(s) you are targeting
		 *     (starts from 0).
		 * l - The liquid amount to set.
		 * -------------------------------------------------- */
		public function SetAllLiquidAmountByRow(r:int, l:Number)
		{
			var counter:int = 0;
			
			for(counter = 0; counter < _row[r].length; counter += 1)
			{
				_row[r][counter].LiquidAmount = l;
			}
		}
		
		/* --------------------------------------------------
		 * r - The row of breast(s) you are targeting
		 *     (starts from 0).
		 * l - The amount of liquid to add.
		 * -------------------------------------------------- */
		public function AddAllLiquidAmountByRow(r:int, l:Number)
		{
			var counter:int = 0;
			
			for(counter = 0; counter < _row[r].length; counter += 1)
			{
				_row[r][counter].LiquidAmount += l;
			}
		}
		
		/* --------------------------------------------------
		 * l - The amount of liquid to add.
		 * -------------------------------------------------- */
		public function AddAllLiquidAmount(l:Number)
		{
			var counter:int = 0;
			var counter2:int = 0;
			
			for(counter = 0; counter < _row.length; counter += 1)
			{
				for(counter2 = 0; counter2 < _row[counter].length; counter2 += 1)
				{
					_row[counter][counter2].LiquidAmount += l;
				}
			}
		}
		
		/* --------------------------------------------------
		 * r - The row of breast(s) you are targeting
		 *     (starts from 0).
		 * b - The breast you are targeting.
		 * -------------------------------------------------- */
		public function GetLiquidProduced(r:int, b:int):String
		{
			return _row[r][b].LiquidProduced;
		}
		
		/* --------------------------------------------------
		 * r - The row of breast(s) you are targeting
		 *     (starts from 0).
		 * b - The breast you are targeting.
		 * l - The liquid you are setting it to.
		 * -------------------------------------------------- */
		public function SetLiquidProduced(r:int, b:int, l:String)
		{
			_row[r][b].LiquidProduced = l;
		}
		
		/* --------------------------------------------------
		 * r - The row of breast(s) you are targeting
		 *     (starts from 0).
		 * l - The liquid to set.
		 * -------------------------------------------------- */
		public function SetAllLiquidProduced(r:int, l:String)
		{
			var counter:int = 0;
			
			for(counter = 0; counter < _row[r].length; counter += 1)
			{
				_row[r][counter].LiquidProduced = l;
			}
		}
		
		public function get Lactation():Number
		{
			return _lactation;
		}
		
		public function set Lactation(l:Number)
		{
			_lactation = l;
		}
		
		/* --------------------------------------------------
		 * hour - The number of hours that has passed.
		 * -------------------------------------------------- */
		override public function DoTimeLapsed(hours:int)
		{
			var counter:int = 0;
			
			for(counter = 0; counter < hours; counter += 1)
			{
				DoOneHourLapsed();
			}
		}
		
		override public function DoOneHourLapsed()
		{
			if(_lactation < 0)
			{
				_lactation = 0;
			}
			
			if(HasBreasts())
			{
				AddAllLiquidAmount(Lactation._AMOUNT[_lactation]);
				_lactation -= 1;
				
				if(_lactation < 0)
				{
					_lactation = 0;
				}
			}
		}
		
		/* --------------------------------------------------
		 * r - The row of breast(s) you are targeting
		 *     (starts from 0).
		 * b - The breast you are targeting.
		 * -------------------------------------------------- */
		public function GetTypes(r:int, b:int):Vector.<String>
		{
			return _row[r][b].Type;
		}
		
		/* --------------------------------------------------
		 * r - The row of breast(s) you are targeting
		 *     (starts from 0).
		 * b - The breast you are targeting.
		 * t - The vector of types you are setting it to.
		 * -------------------------------------------------- */
		public function SetTypes(r:int, b:int, t:Vector.<String>)
		{
			_row[r][b].Type = t;
		}
		
		/* --------------------------------------------------
		 * r - The row of breast(s) you are targeting
		 *     (starts from 0).
		 * t - The vector of types you are setting them to.
		 * -------------------------------------------------- */
		public function SetAllTypesByRow(r:int, t:Vector.<String>)
		{
			var counter:int = 0;
			
			for(counter = 0; counter < _row[r].length; counter += 1)
			{
				_row[r][counter].Type = t;
			}
		}
		
		/* --------------------------------------------------
		 * t - The vector of types you are setting them to.
		 * -------------------------------------------------- */
		public function SetAllTypes(t:Vector.<String>)
		{
			var counter:int = 0;
			var counter2:int = 0;
			
			for(counter = 0; counter < _row.length; counter += 1)
			{
				for(counter2 = 0; counter2 < _row[counter].length; counter2 += 1)
				{
					_row[counter][counter2].Type = t;
				}
			}
		}
		
		/* --------------------------------------------------
		 * r - The row of breast(s) you are targeting
		 *     (starts from 0).
		 * b - The breast you are targeting.
		 * t - The type you are adding.
		 * -------------------------------------------------- */
		public function AddType(r:int, b:int, t:String)
		{
			// Only add the type if the breast doesn't already have that type.
			if(!(_row[r][b].hasType(t)))
			{
				_row[r][b].Type.push(t);
			}
		}
		
		/* --------------------------------------------------
		 * r - The row of breast(s) you are targeting
		 *     (starts from 0).
		 * t - The type you are adding.
		 * -------------------------------------------------- */
		public function AddAllTypeByRow(r:int, t:String)
		{
			var counter:int = 0;
			
			for(counter = 0; counter < _row[r].length; counter += 1)
			{
				if(!(_row[r][counter].hasType(t)))
				{
					_row[r][counter].Type.push(t);
				}
			}
		}
		
		/* --------------------------------------------------
		 * r - The row of breast(s) you are targeting
		 *     (starts from 0).
		 * t - The type you are adding.
		 * -------------------------------------------------- */
		public function AddAllType(t:String)
		{
			var counter:int = 0;
			var counter2:int = 0;
			
			for(counter = 0; counter < _row.length; counter += 1)
			{
				for(counter2 = 0; counter2 < _row[counter].length; counter2 += 1)
				{
					if(!(_row[counter][counter2].hasType(t)))
					{
						_row[counter][counter2].Type.push(t);
					}
				}
			}
		}
		
		/* --------------------------------------------------
		 * r - The row of breast(s) you are targeting
		 *     (starts from 0).
		 * b - The breast you are targeting.
		 * t - The type you are removing.
		 * -------------------------------------------------- */
		public function RemoveType(r:int, b:int, t:String)
		{
			// Only remove the type if the breast already has that type.
			if(_row[r][b].hasType(t))
			{
				_row[r][b].Type.splice(_row[r][b].findType(t), 1);
			}
		}
		
		/* --------------------------------------------------
		 * r - The row of breast(s) you are targeting
		 *     (starts from 0).
		 * t - The type you are removing.
		 * -------------------------------------------------- */
		public function RemoveAllTypeByRow(r:int, t:String)
		{
			var counter:int = 0;
			
			for(counter = 0; counter < _row[r].length; counter += 1)
			{
				RemoveType(r, counter, t);
			}
		}
		
		/* --------------------------------------------------
		 * t - The type you are removing.
		 * -------------------------------------------------- */
		public function RemoveAllType(t:String)
		{
			var counter:int = 0;
			var counter2:int = 0;
			
			for(counter = 0; counter < _row.length; counter += 1)
			{
				for(counter2 = 0; counter2 < _row[counter].length; counter2 += 1)
				{
					RemoveType(counter, counter2, t);
				}
			}
		}
		
		/* --------------------------------------------------
		 * r - The row of breast(s) you are targeting
		 *     (starts from 0).
		 * b - The breast you are targeting.
		 * t - The initial type you are setting the breast
		 *     to.
		 * -------------------------------------------------- */
		public function ClearType(r:int, b:int, t:String)
		{
			_row[r][b].clearType();
			AddType(r, b, t);
		}
		
		/* --------------------------------------------------
		 * r - The row of breast(s) you are targeting
		 *     (starts from 0).
		 * t - The initial type you are setting the breast
		 *     to.
		 * -------------------------------------------------- */
		public function ClearAllTypeByRow(r:int, t:String)
		{
			var counter:int = 0;
			
			for(counter = 0; counter < _row[r].length; counter += 1)
			{
				if(_row[r][counter].hasType(t))
				{
					_row[r][counter].clearType();
					AddAllTypeByRow(r, t);
				}
			}
		}
		
		/* --------------------------------------------------
		 * t - The initial type you are setting the breast
		 *     to.
		 * -------------------------------------------------- */
		public function ClearAllType(t:String)
		{
			var counter:int = 0;
			var counter2:int = 0;
			
			for(counter = 0; counter < _row.length; counter += 1)
			{
				for(counter2 = 0; counter2 < _row[counter].length; counter2 += 1)
				{
					if(_row[counter][counter2].hasType(t))
					{
						_row[counter][counter2].clearType();
						AddAllType(t);
					}
				}
			}
		}
		
		/* --------------------------------------------------
		 * r - The row of breast(s) you are targeting
		 *     (starts from 0).
		 * b - The breast you are targeting.
		 * -------------------------------------------------- */
		public function GetRaces(r:int, b:int):Vector.<String>
		{
			return _row[r][b].Race;
		}
		
		/* --------------------------------------------------
		 * r - The row of breast(s) you are targeting
		 *     (starts from 0).
		 * b - The breast you are targeting.
		 * t - The vector of races you are setting it to.
		 * -------------------------------------------------- */
		public function SetRaces(r:int, b:int, t:Vector.<String>)
		{
			_row[r][b].Race = t;
		}
		
		/* --------------------------------------------------
		 * r - The row of breast(s) you are targeting
		 *     (starts from 0).
		 * t - The vector of races you are setting them to.
		 * -------------------------------------------------- */
		public function SetAllRacesByRow(r:int, t:Vector.<String>)
		{
			var counter:int = 0;
			
			for(counter = 0; counter < _row[r].length; counter += 1)
			{
				_row[r][counter].Race = t;
			}
		}
		
		/* --------------------------------------------------
		 * t - The vector of races you are setting them to.
		 * -------------------------------------------------- */
		public function SetAllRaces(t:Vector.<String>)
		{
			var counter:int = 0;
			var counter2:int = 0;
			
			for(counter = 0; counter < _row.length; counter += 1)
			{
				for(counter2 = 0; counter2 < _row[counter].length; counter2 += 1)
				{
					_row[counter][counter2].Race = t;
				}
			}
		}
		
		/* --------------------------------------------------
		 * r - The row of breast(s) you are targeting
		 *     (starts from 0).
		 * b - The breast you are targeting.
		 * t - The race you are adding.
		 * -------------------------------------------------- */
		public function AddRace(r:int, b:int, t:String)
		{
			// Only add the race if the breast doesn't already have that race.
			if(!(_row[r][b].hasRace(t)))
			{
				_row[r][b].Race.push(t);
			}
		}
		
		/* --------------------------------------------------
		 * r - The row of breast(s) you are targeting
		 *     (starts from 0).
		 * t - The race you are adding.
		 * -------------------------------------------------- */
		public function AddAllRaceByRow(r:int, t:String)
		{
			var counter:int = 0;
			
			for(counter = 0; counter < _row[r].length; counter += 1)
			{
				if(!(_row[r][counter].hasRace(t)))
				{
					_row[r][counter].Race.push(t);
				}
			}
		}
		
		/* --------------------------------------------------
		 * r - The row of breast(s) you are targeting
		 *     (starts from 0).
		 * t - The race you are adding.
		 * -------------------------------------------------- */
		public function AddAllRace(t:String)
		{
			var counter:int = 0;
			var counter2:int = 0;
			
			for(counter = 0; counter < _row.length; counter += 1)
			{
				for(counter2 = 0; counter2 < _row[counter].length; counter2 += 1)
				{
					if(!(_row[counter][counter2].hasRace(t)))
					{
						_row[counter][counter2].Race.push(t);
					}
				}
			}
		}
		
		/* --------------------------------------------------
		 * r - The row of breast(s) you are targeting
		 *     (starts from 0).
		 * b - The breast you are targeting.
		 * t - The race you are removing.
		 * -------------------------------------------------- */
		public function RemoveRace(r:int, b:int, t:String)
		{
			// Only remove the race if the breast already has that race.
			if(_row[r][b].hasRace(t))
			{
				_row[r][b].Race.splice(_row[r][b].findRace(t), 1);
			}
		}
		
		/* --------------------------------------------------
		 * r - The row of breast(s) you are targeting
		 *     (starts from 0).
		 * t - The race you are removing.
		 * -------------------------------------------------- */
		public function RemoveAllRaceByRow(r:int, t:String)
		{
			var counter:int = 0;
			
			for(counter = 0; counter < _row[r].length; counter += 1)
			{
				if(_row[r][counter].hasRace(t))
				{
					_row[r][counter].Race.splice(_row[r][counter].findRace(t), 1);
				}
			}
		}
		
		/* --------------------------------------------------
		 * t - The race you are removing.
		 * -------------------------------------------------- */
		public function RemoveAllRace(t:String)
		{
			var counter:int = 0;
			var counter2:int = 0;
			
			for(counter = 0; counter < _row.length; counter += 1)
			{
				for(counter2 = 0; counter2 < _row[counter].length; counter2 += 1)
				{
					if(_row[counter][counter2].hasRace(t))
					{
						_row[counter][counter2].Race.splice(_row[counter][counter2].findRace(t), 1);
					}
				}
			}
		}
		
		/* --------------------------------------------------
		 * r - The row of breast(s) you are targeting
		 *     (starts from 0).
		 * b - The breast you are targeting.
		 * t - The initial race you are setting the breast
		 *     to.
		 * -------------------------------------------------- */
		public function ClearRace(r:int, b:int, t:String)
		{
			_row[r][b].clearRace();
			AddRace(r, b, t);
		}
		
		/* --------------------------------------------------
		 * r - The row of breast(s) you are targeting
		 *     (starts from 0).
		 * t - The initial race you are setting the breast
		 *     to.
		 * -------------------------------------------------- */
		public function ClearAllRaceByRow(r:int, t:String)
		{
			var counter:int = 0;
			
			for(counter = 0; counter < _row[r].length; counter += 1)
			{
				if(_row[r][counter].hasRace(t))
				{
					_row[r][counter].clearRace();
					AddAllRaceByRow(r, t);
				}
			}
		}
		
		/* --------------------------------------------------
		 * t - The initial race you are setting the breast
		 *     to.
		 * -------------------------------------------------- */
		public function ClearAllRace(t:String)
		{
			var counter:int = 0;
			
			for(counter = 0; counter < _row.length; counter += 1)
			{
				for(counter2 = 0; counter2 < _row[counter].length; counter2 += 1)
				{
					if(_row[counter][counter2].hasRace(t))
					{
						_row[counter][counter2].clearRace();
						AddAllRace(t);
					}
				}
			}
		}
		
		public function Adjective(rowNum:int):String
		{
			var counter:int = 0;
			var counter2:int = 0;
			var tempVec:Vector.<Number> = new Vector.<Number>();
			var tempBool:Boolean = false;
			var descriptionText:String = "";
			
			// If there are more than one breast...
			if(_row[rowNum].length > 1)
			{
				// Find all the sizes of the breasts on the indicated row (rowNum).
				for(counter = 0; counter < _row[rowNum].length; counter += 1)
				{
					tempVec.push(_row[rowNum][counter]);
				}
				
				// See if there are different sizes of breasts on the same row.
				for(counter = 0; counter < tempVec.length; counter += 1)
				{
					for(counter2 = 0; counter2 < tempVec.length; counter2 += 1)
					{
						if(tempVec[counter] != tempVec[counter2])
						{
							tempBool = true;
						}
					}
				}
			}
			else
			{
				tempBool = false;
			}
			
			// If there are different sizes...
			if(tempBool)
			{
				descriptionText = "uneven"; // Descript the breasts as "uneven".
			}
			// If there aren't, aka if they are all same sized...
			else
			{
				var tempSize:Number = _row[rowNum][0].Size;
				if(tempSize == 0)
				{
					descriptionText = "non-existent";
				}
				else if(tempSize == 1)
				{
					descriptionText = "small";
				}
				else if(tempSize <= 3)
				{
					descriptionText = "palmable";
				}
				else if(tempSize <= 6)
				{
					descriptionText = "sizeable";
				}
				else if(tempSize <= 14)
				{
					descriptionText = "huge";
				}
				else if(tempSize <= 27)
				{
					descriptionText = "gigantic";
				}
				else if(tempSize <= 45)
				{
					descriptionText = "mammoth";
				}
				else if(tempSize > 45)
				{
					descriptionText = "titanic";
				}
				else
				{
					descriptionText = "ERROR";
				}
			}
			
			return descriptionText;
		}
		
		public function GetNoun(rowNum:int):String
		{
			var counter:int = 0;
			var counter2:int = 0;
			var tempVec:Vector.<Number> = new Vector.<Number>();
			var tempBool:Boolean = false;
			var tempBool2:Boolean = false;
			var descriptionText:String = "";
			
			// If there are more than one breast...
			if(_row[rowNum].length > 1)
			{
				tempBool2 = true;
				// Find all the sizes of the breasts on the indicated row (rowNum).
				for(counter = 0; counter < _row[rowNum].length; counter += 1)
				{
					tempVec.push(_row[rowNum][counter]);
				}
				
				// See if there are different sizes of breasts on the same row.
				for(counter = 0; counter < tempVec.length; counter += 1)
				{
					for(counter2 = 0; counter2 < tempVec.length; counter2 += 1)
					{
						if(tempVec[counter] != tempVec[counter2])
						{
							tempBool = true;
						}
					}
				}
			}
			else
			{
				tempBool = false;
				tempBool2 = false;
			}
			
			// If there are different sizes...
			if(tempBool)
			{
				descriptionText = "breasts";
			}
			else
			{
				// If there are multiple breasts...
				if(tempBool2)
				{
					if(_row[rowNum][0].Size > 1)
					{
						descriptionText = "breasts";
					}
					else
					{
						descriptionText = "chest"
					}
				}
				else
				{
					if(_row[rowNum][0].Size > 1)
					{
						descriptionText = "breast";
					}
					else
					{
						descriptionText = "chest"
					}
				}
			}
			
			return descriptionText;
		}
		
		public function HasMultipleRows():Boolean
		{
			var counter:int = 0;
			var counter2:int = 0;
			
			for(counter = 0; counter < _row.length; counter += 1)
			{
				if(_row[counter].length < 1)
				{
					counter2 += 1;
				}
			}
			
			if(counter2 >= 2)
			{
				return true;
			}
			return false;
		}
	}
}