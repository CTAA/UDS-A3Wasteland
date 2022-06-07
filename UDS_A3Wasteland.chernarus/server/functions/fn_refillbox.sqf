// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: fn_refillbox.sqf  "fn_refillbox"
//	@file Author: [404] Pulse , [404] Costlyy , [404] Deadbeat, AgentRev
//	@file Created: 22/1/2012 00:00
//	@file Args: [OBJECT (Weapons box that needs filling), STRING (Name of the fill to give to object)] 

if (!isServer) exitWith {};

#define RANDOM_BETWEEN(START,END) ((START) + floor random ((END) - (START) + 1))
#define RANDOM_ODDS(ODDS) ([0,1] select (random 1 < (ODDS))) // Between 0.0 and 1.0

private "_boxItems";
private "_item";
private _box = _this select 0;
private _boxType = _this select 1;

_box setVariable [call vChecksum, true];

_box allowDamage false; // Invincible Crates
_box setVariable ["allowDamage", false, true];
_box setVariable ["A3W_inventoryLockR3F", true, true];

// Empty Crates
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;
clearAllItemsFromBackpack _box;

switch (_boxType) do {
	case "mission_rifles1": {
		_boxItems = [
			["wep", "CUP_arifle_AK101", RANDOM_BETWEEN(0,2), RANDOM_BETWEEN(3,7)],
			["wep", "CUP_arifle_AK102", RANDOM_BETWEEN(0,2), RANDOM_BETWEEN(3,7)],
			["wep", "CUP_arifle_AK103", RANDOM_BETWEEN(0,2), RANDOM_BETWEEN(3,7)],
			["wep", "CUP_arifle_AK104", RANDOM_BETWEEN(0,2), RANDOM_BETWEEN(3,7)],
			["wep", "CUP_arifle_AK105", RANDOM_BETWEEN(0,2), RANDOM_BETWEEN(3,7)],
			["wep", "CUP_arifle_AK107", RANDOM_BETWEEN(0,2), RANDOM_BETWEEN(3,7)],
			["wep", "CUP_arifle_AK108", RANDOM_BETWEEN(0,2), RANDOM_BETWEEN(3,7)],
			["wep", "CUP_arifle_AK109", RANDOM_BETWEEN(0,2), RANDOM_BETWEEN(3,7)],
			["itm", "U_O_Wetsuit", RANDOM_BETWEEN(2,4)],
			["itm", "U_I_Wetsuit", RANDOM_BETWEEN(2,4)],
			["itm", "G_Diving", RANDOM_BETWEEN(4,7)]
		];
	};
	case "mission_snipers1": {
		_boxItems = [
			["wep", "CUP_arifle_AS_VAL", 1, RANDOM_BETWEEN(4,9)],
			["wep", "CUP_arifle_AS_VAL_VFG_top_rail", 1, RANDOM_BETWEEN(4,9)],
			["wep", "CUP_srifle_AS50", 1, RANDOM_BETWEEN(4,9)],
			["wep", "srifle_DMR_07_blk_F", 1, RANDOM_BETWEEN(4,9)],
			["wep", "srifle_DMR_05_blk_F", 1, RANDOM_BETWEEN(4,9)],
			["wep", "CUP_srifle_CZ550_rail", 1, RANDOM_BETWEEN(4,9)],
		];
	};
	// Diving Loot
	case "mission_Gear_Diving": {
		_boxItems = [
			["itm", "V_RebreatherB", RANDOM_BETWEEN(2,4)],
			["itm", "V_RebreatherIR", RANDOM_BETWEEN(2,4)],
			["itm", "V_RebreatherIA", RANDOM_BETWEEN(2,4)],
			["itm", "U_B_Wetsuit", RANDOM_BETWEEN(2,4)],
			["itm", "U_O_Wetsuit", RANDOM_BETWEEN(2,4)],
			["itm", "U_I_Wetsuit", RANDOM_BETWEEN(2,4)],
			["itm", "G_Diving", RANDOM_BETWEEN(4,7)],
			["bac", "B_LegStrapBag_black_F", RANDOM_BETWEEN(3,4)], 
			["wep", "arifle_SDAR_F", RANDOM_BETWEEN(3,7), RANDOM_BETWEEN(5,10)],
			["itm", [
				"Chemlight_red", 
				"Chemlight_green", 
				"Chemlight_yellow", 
				"Chemlight_blue"], RANDOM_BETWEEN(3,6)]
		];
	};
	// Night Loot
	case "mission_Gear_Night": {	
		_boxItems = [
			["itm", "CUP_NVG_HMNVS", RANDOM_BETWEEN(2,4)], // Night Vision Goggles
			["itm", [
				"CUP_optic_AN_PVS_4",
				"CUP_optic_AN_PVS_4_M14",
				"CUP_optic_AN_PVS_4_M16",
				"CUP_optic_AN_PVS_10"], RANDOM_BETWEEN(2,4)], // Night Vision Scope
			["itm", [
				"CUP_NVG_GPNVG_black", 
				"CUP_NVG_GPNVG_tan", 
				"CUP_NVG_GPNVG_green",
				"CUP_NVG_GPNVG_winter"], RANDOM_BETWEEN(2,4)], // Night Vision Goggles
			["itm", [
				"CUP_NVG_PVS15_black", 
				"CUP_NVG_PVS15_tan", 
				"CUP_NVG_PVS15_green", 
				"CUP_NVG_PVS15_winter"], RANDOM_BETWEEN(2,4)], // Night Vision Goggles
			["itm", [
				"Chemlight_red", 
				"Chemlight_green", 
				"Chemlight_yellow", 
				"Chemlight_blue"], RANDOM_BETWEEN(3,6)]
		];
	};
};

[_box, _boxItems] call processItems;
