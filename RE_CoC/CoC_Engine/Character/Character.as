/* ----------------------------------------------------------------------------------------------------
 * This is the character base class of the Corruption of Champions engine.
 * This determines what variables and functions all characters will have.
 * 
 * Game made by Fenoxo.
 * Code rewritten by Seij Bleizkyn.
 * ---------------------------------------------------------------------------------------------------- */

package CoC_Engine.Character
{
	import CoC_Engine.Ability.Ability;
	import CoC_Engine.Inventory.Inventory;
	import CoC_Engine.Character.BodyPart.Container;
	
	public class Character
	{
		// ------------------------------ Identity ------------------------------ //
		protected var _ID:int;
		protected var _Name:String;
		protected var _Appearance:String;
		protected var _BattleAppearance:String;
		protected var _Age:int;
		protected var _Body:Vector.<Container> = new Vector.<Container>();
		
		// ------------------------------ Stats ------------------------------ //
		protected var _Strength:Number;
		protected var _Toughness:Number;
		protected var _Speed:Number;
		protected var _Intelligence:Number;
		protected var _Libido:Number;
		protected var _Sensitivity:Number;
		protected var _Corruption:Number;
		protected var _HP:Number;
		protected var _BaseHP:Number;
		protected var _MaxHP:Number;
		protected var _Lust:Number;
		protected var _Fatigue:Number;
		protected var _Level:Number;
		protected var _Experience:Number;
		protected var _TotalExperience:Number;
		protected var _ExtraExperience:Number;
		protected var _Gems:Number;
		protected var _Height:Number;
		protected var _Femininity:Number;
		protected var _Thickness:Number;
		protected var _MuscleTone:Number;
		protected var _TeaseLevel:int;
		protected var _HipRating:int;
		protected var _ButtRating:int;
		protected var _Fertility:int;
		
		// ------------------------------ Abilities ------------------------------ //
		protected var _Spell:Vector.<Ability> = new Vector.<Ability>();
		protected var _SpecSpell:Vector.<Ability> = new Vector.<Ability>();
		protected var _SpecPhysicalAttack:Vector.<Ability> = new Vector.<Ability>();
		
		// ------------------------------ Inventory ------------------------------ //
		protected var _Inventory:Vector.<Inventory> = new Vector.<Inventory>();
		
		// Constructor. Initialise the character.
		public function Character()
		{
			_ID					= 0;
			_Name				= "";
			_Appearance			= "";
			_BattleAppearance	= "";
			_Age				= 0;
			_Strength			= 0;
			_Toughness			= 0;
			_Speed				= 0;
			_Intelligence		= 0;
			_Libido				= 0;
			_Sensitivity		= 0;
			_Corruption			= 0;
			_HP					= 0;
			_BaseHP				= 50;
			_MaxHP				= 50;
			_Lust				= 0;
			_Fatigue			= 0;
			_Level				= 0;
			_Experience			= 0;
			_TotalExperience	= 0;
			_ExtraExperience	= 0;
			_Gems				= 0;
			_Height				= 0;
			_Femininity			= 0;
			_Thickness			= 0;
			_MuscleTone			= 0;
			_TeaseLevel			= 0;
			_HipRating			= 0;
			_ButtRating			= 0;
			_Fertility			= 0;
		}
		
		public function get ID():int
		{
			return _ID;
		}
		
		public function set ID(Value:int)
		{
			_ID = Value;
		}
		
		public function get Name():String
		{
			return _Name;
		}
		
		public function set Name(Value:String)
		{
			_Name = Value;
		}
		
		public function get Appearance():String
		{
			return _Appearance;
		}
		
		public function set Appearance(a:String)
		{
			_Appearance = a
		}
		
		public function get BattleAppearance():String
		{
			return _BattleAppearance;
		}
		
		public function set BattleAppearance(a:String)
		{
			_BattleAppearance = a
		}
		
		public function get Age():int
		{
			return _Age;
		}
		
		public function set Age(a:int)
		{
			_Age = a;
			
			if(_Age < 0)
			{
				_Age = 0;
			}
		}
		
		public function get BodyPartList():Vector.<Container>
		{
			return _Body;
		}
		
		public function set BodyPartList(list:Vector.<Container>)
		{
			_Body = list;
		}
		
		public function HasBodyPart(b:String):Boolean
		{
			var index:int = 0;
			
			for(index = 0; index < _Body.length; index += 1)
			{
				if(_Body[index].Name == b)
				{
					return true;
				}
			}
			
			return false;
		}
		
		public function FindBodyPart(b:String):Container
		{
			var index:int = 0;
			var finalIndex:int = 0;
			
			for(index = 0; index < _Body.length; index += 1)
			{
				if(_Body[index].Name == b)
				{
					finalIndex = index;
				}
			}
			
			return _Body[finalIndex];
		}
		
		public function FindBodyPartIndex(b:String):int
		{
			var index:int = 0;
			var finalIndex:int = -1;
			
			for(index = 0; index < _Body.length; index += 1)
			{
				if(_Body[index].Name == b)
				{
					finalIndex = index;
				}
			}
			
			return finalIndex;
		}
		
		public function get Strength():Number
		{
			return _Strength;
		}
		
		public function set Strength(s:Number)
		{
			_Strength = s;
			
			if(_Strength < 0)
			{
				_Strength = 0;
			}
		}
		
		public function get Toughness():Number
		{
			return _Toughness;
		}
		
		public function set Toughness(t:Number)
		{
			_Toughness = t;
			
			if(_Toughness < 0)
			{
				_Toughness = 0;
			}
		}
		
		public function get Speed():Number
		{
			return _Speed;
		}
		
		public function set Speed(s:Number)
		{
			_Speed = s;
			
			if(_Speed < 0)
			{
				_Speed = 0;
			}
		}
		
		public function get Intelligence():Number
		{
			return _Intelligence;
		}
		
		public function set Intelligence(i:Number)
		{
			_Intelligence = i;
			
			if(_Intelligence < 0)
			{
				_Intelligence = 0;
			}
		}
		
		public function get Libido():Number
		{
			return _Libido;
		}
		
		public function set Libido(l:Number)
		{
			_Libido = l;
			
			if(_Libido < 0)
			{
				_Libido = 0;
			}
		}
		
		public function get Sensitivity():Number
		{
			return _Sensitivity;
		}
		
		public function set Sensitivity(s:Number)
		{
			_Sensitivity = s;
			
			if(_Sensitivity < 0)
			{
				_Sensitivity = 0;
			}
		}
		
		public function get Corruption():Number
		{
			return _Corruption;
		}
		
		public function set Corruption(c:Number)
		{
			_Corruption = c;
			
			if(_Corruption < 0)
			{
				_Corruption = 0;
			}
		}
		
		public function get HP():Number
		{
			return _HP;
		}
		
		public function set HP(hp:Number)
		{
			if(hp <= MaxHP)
			{
				_HP = hp;
			}
			else
			{
				_HP = MaxHP;
			}
			
			if(_HP < 0)
			{
				_HP = 0;
			}
		}
		
		public function addHP(hp:Number)
		{
			if(_HP + hp <= MaxHP)
			{
				_HP += hp;
			}
			else
			{
				_HP = MaxHP;
			}
			
			if(_HP < 0)
			{
				_HP = 0;
			}
		}
		
		public function get BaseHP():Number
		{
			return _BaseHP;
		}
		
		public function set BaseHP(hp:Number)
		{
			_BaseHP = hp;
		}
		
		public function get MaxHP():Number
		{
			return (_BaseHP + _Toughness * 2.00 + _Level * 15.00)
		}
		
		public function get Lust():Number
		{
			return _Lust;
		}
		
		public function set Lust(l:Number)
		{
			_Lust = l;
			
			if(_Lust < 0)
			{
				_Lust = 0;
			}
		}
		
		public function get Fatigue():Number
		{
			return _Fatigue;
		}
		
		public function set Fatigue(f:Number)
		{
			_Fatigue = f;
			
			if(_Fatigue < 0)
			{
				_Fatigue = 0;
			}
		}
		
		public function get Level():Number
		{
			return _Level;
		}
		
		public function set Level(l:Number)
		{
			_Level = l;
			
			if(_Level < 0)
			{
				_Level = 0;
			}
		}
		
		public function get Experience():Number
		{
			return _Experience;
		}
		
		public function addExperience(e:Number)
		{
			if(_Experience < (_Level as Number) * 100.0)
			{
				_Experience += e;
			}
			else
			{
				_ExtraExperience += e;
			}
			_TotalExperience += e;
		}
		
		public function get MaxExperience():Number
		{
			return (_Level as Number) * 100.0;
		}
		
		public function get TotalExperience():Number
		{
			return _TotalExperience;
		}
		
		public function get ExtraExperience():Number
		{
			return _ExtraExperience;
		}
		
		/* --------------------------------------------------
		 * Detects if the character's experience is greater
		 * than it's level's limit, if so, move the
		 * additional experience to the extra experience.
		 * -------------------------------------------------- */
		private function FixExperience()
		{
			var maxExperience:Number = MaxExperience;
			
			if(_Experience > maxExperience)
			{
				_ExtraExperience += _Experience - maxExperience;
				_Experience = maxExperience;
			}
		}
		
		public function get Gems():Number
		{
			return _Gems;
		}
		
		public function set Gems(g:Number)
		{
			_Gems = g;
			
			if(_Gems < 0)
			{
				_Gems = 0;
			}
		}
		
		public function get Height():Number
		{
			return _Height;
		}
		
		public function set Height(h:Number)
		{
			_Height = h;
			
			if(_Height < 0)
			{
				_Height = 0;
			}
		}
		
		public function get Femininity():Number
		{
			return _Femininity;
		}
		
		public function set Femininity(f:Number)
		{
			_Femininity = f;
			
			if(_Femininity < 0)
			{
				_Femininity = 0;
			}
		}
		
		public function get Thickness():Number
		{
			return _Thickness;
		}
		
		public function set Thickness(t:Number)
		{
			_Thickness = t;
			
			if(_Thickness < 0)
			{
				_Thickness = 0;
			}
		}
		
		public function get MuscleTone():Number
		{
			return _MuscleTone;
		}
		
		public function set MuscleTone(m:Number)
		{
			_MuscleTone = m;
			
			if(_MuscleTone < 0)
			{
				_MuscleTone = 0;
			}
		}
		
		public function get TeaseLevel():int
		{
			return _TeaseLevel;
		}
		
		public function set TeaseLevel(t:int)
		{
			_TeaseLevel = t;
			
			if(_TeaseLevel < 0)
			{
				_TeaseLevel = 0;
			}
		}
		
		public function get HipRating():int
		{
			return _HipRating;
		}
		
		public function set HipRating(h:int)
		{
			_HipRating = h;
			
			if(_HipRating < 0)
			{
				_HipRating = 0;
			}
		}
		
		public function get ButtRating():int
		{
			return _ButtRating;
		}
		
		public function set ButtRating(b:int)
		{
			_ButtRating = b;
			
			if(_ButtRating < 0)
			{
				_ButtRating = 0;
			}
		}
		
		public function get Fertility():int
		{
			return _Fertility;
		}
		
		public function set Fertility(f:int)
		{
			_Fertility = f;
			
			if(_Fertility < 0)
			{
				_Fertility = 0;
			}
		}
		
		public function get inventory():Vector.<Inventory>
		{
			return _Inventory;
		}
		
		public function set inventory(inv:Vector.<Inventory>)
		{
			_Inventory = inv;
		}
	}
}
