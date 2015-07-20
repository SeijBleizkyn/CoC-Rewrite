/* ----------------------------------------------------------------------------------------------------
 * This is the enumeration class of different types items.
 * 
 * Game made by Fenoxo.
 * Code rewritten by Seij Bleizkyn.
 * ---------------------------------------------------------------------------------------------------- */

package CoC_Game.Enumerations.Item
{
	import CoC_Engine.Miscellaneous.Base002;

	public final class Item_Type extends Base002
	{
		public static const _ACCESSORY:String			= "accessory"; // For things like rings and necklaces.
		public static const _ARMOUR:String				= "armour"; // For armours.
		public static const _CONSUMABLE:String			= "consumable"; // For all items that can be consumed.
		public static const _EQUIPMENT:String			= "equipment"; // As in either a weapon or an armour.
		public static const _HEAVY:String				= "heavy"; // For things like a weapon or an armour.
		public static const _KEY:String					= "key"; // For all key items.
		public static const _LIGHT:String				= "light"; // For things like a weapon or an armour.
		public static const _MEDIUM:String				= "medium"; // For things like a weapon or an armour.
		public static const _SHEILD:String				= "sheild"; // For armours.
		public static const _UNARMED:String				= "unarmed"; // For unarmed.
		public static const _WEAPON:String				= "weapon"; // For weapons.
		
		public function Item_Type()
		{
		}
	}
}