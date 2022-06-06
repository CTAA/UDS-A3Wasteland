// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: fn_refillbox.sqf  "fn_refillbox"
//	@file Author: [404] Pulse , [404] Costlyy , [404] Deadbeat, AgentRev
//	@file Created: 22/1/2012 00:00
//	@file Args: [OBJECT (Weapons box that needs filling), STRING (Name of the fill to give to object)]



// EXAMPLE EXAMPLE EXAMPLE EXAMPLE EXAMPLE EXAMPLE EXAMPLE EXAMPLE EXAMPLE EXAMPLE EXAMPLE EXAMPLE EXAMPLE EXAMPLE EXAMPLE EXAMPLE EXAMPLE EXAMPLE EXAMPLE 
/*
	case "mission_Weapon1": {
		_boxItems = [
			["wep", ["Binocular", "Rangefinder"], RANDOM_BETWEEN(0,3)],
			["itm", "Medikit", RANDOM_BETWEEN(1,3)],
			["itm", "Toolkit", RANDOM_BETWEEN(1,3)],
			["itm", ["optic_Aco", "optic_Arco_ghex_F", "optic_ERCO_khk_F", "optic_ERCO_snd_F", "optic_Hamr_khk_F","optic_Aco_grn", "optic_MRCO", "optic_Hamr", "optic_Arco"], RANDOM_BETWEEN(2,4)],
			["itm", ["muzzle_snds_M", "muzzle_snds_H", "muzzle_snds_H_MG", "muzzle_snds_B", "muzzle_snds_acp", "muzzle_snds_58_ghex_F", "muzzle_snds_65_TI_ghex_F", ["muzzle_snds_338_black", "muzzle_snds_338_green", "muzzle_snds_338_sand"], ["muzzle_snds_93mmg", "muzzle_snds_93mmg_tan"]], RANDOM_BETWEEN(1,5)],
			["wep", [["MMG_02_sand_F", "MMG_02_camo_F", "MMG_02_black_F"], ["MMG_01_tan_F", "MMG_01_hex_F"]], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(2,4)],
			["wep", ["LMG_Mk200_F", "LMG_Zafir_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
			["wep", ["arifle_AKM_F", "arifle_AKS_F", "arifle_CTARS_hex_F", "arifle_CTAR_hex_F", "arifle_MX_F", "arifle_MXM_F", "arifle_ARX_hex_F", "arifle_SPAR_01_khk_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(4,8)],
			["wep", ["srifle_EBR_F", "srifle_DMR_01_F"], RANDOM_BETWEEN(0,2), RANDOM_BETWEEN(4,8)],
			["wep", "CUP_smg_MP5A5_flashlight", RANDOM_BETWEEN(2,3)],
			["wep", "arifle_SDAR_F", RANDOM_BETWEEN(0,2), RANDOM_BETWEEN(3,5)],
			["wep", ["hgun_Pistol_heavy_01_F", "hgun_Pistol_heavy_01_MRD_F", "hgun_Pistol_heavy_02_F", "hgun_Pistol_heavy_02_Yorris_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(4,8)],
			["mag", "30Rnd_556x45_Stanag", RANDOM_BETWEEN(5,10)],
			["mag", "30Rnd_65x39_caseless_mag", RANDOM_BETWEEN(5,10)],
			["mag", "30Rnd_65x39_caseless_green", RANDOM_BETWEEN(5,10)],
			["mag", "9Rnd_45ACP_Mag", RANDOM_BETWEEN(5,10)],
			["mag", "16Rnd_9x21_Mag", RANDOM_BETWEEN(5,10)],
			["mag", "CUP_30Rnd_9x19_MP5", RANDOM_BETWEEN(5,10)],
			["itm", [["H_HelmetB", "H_HelmetIA"], ["H_HelmetSpecB", "H_HelmetSpecO_ocamo"], "H_HelmetLeaderO_ocamo"], RANDOM_BETWEEN(1,4)],
			["itm", [["V_PlateCarrier1_rgr", "V_PlateCarrier1_blk", "V_PlateCarrierIA1_dgtl"],["V_PlateCarrier2_rgr", "V_PlateCarrier2_blk", "V_PlateCarrierIA2_dgtl"],["V_PlateCarrierSpec_rgr", "V_PlateCarrierSpec_blk", "V_PlateCarrierSpec_mtp"],["V_PlateCarrierGL_rgr", "V_PlateCarrierGL_blk", "V_PlateCarrierGL_mtp", "V_PlateCarrierIAGL_dgtl", "V_PlateCarrierIAGL_oli"]], RANDOM_BETWEEN(1,4)]
		];
	};
*/
// EXAMPLE EXAMPLE EXAMPLE EXAMPLE EXAMPLE EXAMPLE EXAMPLE EXAMPLE EXAMPLE EXAMPLE EXAMPLE EXAMPLE EXAMPLE EXAMPLE EXAMPLE EXAMPLE EXAMPLE EXAMPLE EXAMPLE 

if (!isServer) exitWith {};

#define RANDOM_BETWEEN(START,END) ((START) + floor random ((END) - (START) + 1))
#define RANDOM_ODDS(ODDS) ([0,1] select (random 1 < (ODDS))) // between 0.0 and 1.0

private "_boxItems";
private "_item";
private _box = _this select 0;
private _boxType = _this select 1;

_box setVariable [call vChecksum, true];

_box allowDamage false; // No more fucking busted crates
_box setVariable ["allowDamage", false, true];
_box setVariable ["A3W_inventoryLockR3F", true, true];

// Clear pre-existing cargo first
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
			["itm", "G_Diving", RANDOM_BETWEEN(4,7)],
		]
	}
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
