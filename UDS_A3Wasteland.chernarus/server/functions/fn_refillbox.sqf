// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
// @file Version: 1.0
// @file Name: fn_refillbox.sqf  "fn_refillbox"
// @file Author: [404] Pulse, [404] Costlyy, [404] Deadbeat, AgentRev
// @file Created: 22/1/2012 00:00
// @file Args: [OBJECT (weapons box that needs filling), STRING (name of the fill to give to object)] 

if (!isServer) exitWith {};

#define RANDOM_BETWEEN(START, END) ((START) + floor random ((END) - (START) + 1))
#define RANDOM_ODDS(ODDS) ([0, 1] select (random 1 < (ODDS))) // Between 0.0 and 1.0

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

// Mission refill handler
// There are multiple entries to change odds of whats picked
missionBoxArray = [
	"mission_rifles1",     // 40.90%
	"mission_rifles2",     // 40.90%
	"mission_rifles3",     // 40.90%
	"mission_rifles4",     // 40.90%
	"mission_rifles5",     // 40.90%
	"mission_rifles6",     // 40.90%
	"mission_rifles1",     // 40.90%
	"mission_rifles2",     // 40.90%
	"mission_rifles3",     // 40.90%
	"mission_rifles4",     // 40.90%
	"mission_rifles5",     // 40.90%
	"mission_rifles6",     // 40.90%
	"mission_rifles1",     // 40.90%
	"mission_rifles2",     // 40.90%
	"mission_rifles3",     // 40.90%
	"mission_rifles4",     // 40.90%
	"mission_rifles5",     // 40.90%
	"mission_rifles6",     // 40.90%

	"mission_lmgs1",       // 20.45%%
	"mission_lmgs2",       // 20.45%%
	"mission_lmgs3",       // 20.45%%
	"mission_lmgs1",       // 20.45%%
	"mission_lmgs2",       // 20.45%%
	"mission_lmgs3",       // 20.45%%
	"mission_lmgs1",       // 20.45%%
	"mission_lmgs2",       // 20.45%% 
	"mission_lmgs3",       // 20.45%%

	"mission_snipers1",    // 11.36%
	"mission_snipers2",    // 11.36%
	"mission_snipers3",    // 11.36%
	"mission_snipers4",    // 11.36%
	"mission_snipers5",    // 11.36%

	"mission_launchers1",  // 9.09%
	"mission_launchers2",  // 9.09%
	"mission_launchers1",  // 9.09%
	"mission_launchers2",  // 9.09%

	"mission_smgs1",       // 9.09%
	"mission_smgs2",       // 9.09%
	"mission_smgs1",       // 9.09%
	"mission_smgs2",       // 9.09%

	"mission_throwables1", // 6.82%
	"mission_throwables1", // 6.82%
	"mission_throwables1", // 6.82%

	"mission_Gear_Diving", // 4.55%
	"mission_Gear_Diving"  // 4.55%
];

switch (_boxType) do {
	case "mission_rifles1": {
		_boxItems = [
			["wep", ["CUP_arifle_AK101", "CUP_arifle_AK101_top_rail", "CUP_arifle_AK101_railed"], 1, RANDOM_BETWEEN(4,9)],
			["wep", ["CUP_arifle_AK102", "CUP_arifle_AK102_top_rail", "CUP_arifle_AK102_railed"], 1, RANDOM_BETWEEN(4,9)],
			["wep", ["CUP_arifle_AK103", "CUP_arifle_AK103_top_rail", "CUP_arifle_AK103_railed"], 1, RANDOM_BETWEEN(4,9)],
			["wep", ["CUP_arifle_AK104", "CUP_arifle_AK104_top_rail", "CUP_arifle_AK104_railed"], 1, RANDOM_BETWEEN(4,9)],
			["wep", ["CUP_arifle_AK105", "CUP_arifle_AK105_top_rail", "CUP_arifle_AK105_railed"], 1, RANDOM_BETWEEN(4,9)],
			["wep", ["CUP_arifle_AK107", "CUP_arifle_AK107_top_rail", "CUP_arifle_AK107_railed"], 1, RANDOM_BETWEEN(4,9)],
			["wep", ["CUP_arifle_AK108", "CUP_arifle_AK108_top_rail", "CUP_arifle_AK108_railed"], 1, RANDOM_BETWEEN(4,9)],
			["wep", ["CUP_arifle_AK109", "CUP_arifle_AK109_top_rail", "CUP_arifle_AK109_railed"], 1, RANDOM_BETWEEN(4,9)],
			["itm", "ToolKit", RANDOM_BETWEEN(1,2)],
			["itm", "Medikit", RANDOM_BETWEEN(1,2)],
			["itm", "FirstAidKit", RANDOM_BETWEEN(2,4)],
			["itm", _vests, RANDOM_BETWEEN(2,4)],
			["itm", _scopes, RANDOM_BETWEEN(2,4)],
			["itm", _rifleSilencers, RANDOM_ODDS(0.25)],
			["itm", _accessories, RANDOM_ODDS(0.25)],
			["bac", _backpacks, RANDOM_BETWEEN(2,4)]
		];
	};
	case "mission_rifles2": {
		_boxItems = [
			["wep", ["arifle_AK12_F", "arifle_AK12_arid_F"], 1, RANDOM_BETWEEN(4,9)],
			["wep", ["arifle_AK12U_F", "arifle_AK12U_arid_F"], 1, RANDOM_BETWEEN(4,9)],
			["wep", "arifle_AKM_F", 1, RANDOM_BETWEEN(4,9)],
			["wep", "arifle_AKS_F", 1, RANDOM_BETWEEN(4,9)],
			["wep", "CUP_arifle_AUG_A1", 1, RANDOM_BETWEEN(4,9)],
			["wep", "arifle_CTAR_blk_F", 1, RANDOM_BETWEEN(4,9)],
			["wep", ["CUP_arifle_CZ805_A2_blk","CUP_CZ_BREN2_762_14"], 1, RANDOM_BETWEEN(4,9)],
			["wep", ["CUP_arifle_FNFAL","CUP_arifle_FNFAL_railed","CUP_arifle_FNFAL_OSW"], 1, RANDOM_BETWEEN(4,9)],
			["itm", "ToolKit", RANDOM_BETWEEN(1,2)],
			["itm", "Medikit", RANDOM_BETWEEN(1,2)],
			["itm", "FirstAidKit", RANDOM_BETWEEN(2,4)],
			["itm", _vests, RANDOM_BETWEEN(2,4)],
			["itm", _scopes, RANDOM_BETWEEN(2,4)],
			["itm", _rifleSilencers, RANDOM_ODDS(0.25)],
			["itm", _accessories, RANDOM_ODDS(0.25)],
			["bac", _backpacks, RANDOM_BETWEEN(2,4)]
		];
	};
	case "mission_rifles3": {
		_boxItems = [
			["wep", ["CUP_arifle_G36A_RIS", "CUP_arifle_G3A3_ris"], 1, RANDOM_BETWEEN(4,9)],
			["wep", ["CUP_arifle_HK416_Wood", "CUP_arifle_HK416_CQB_Black"], 1, RANDOM_BETWEEN(4,9)],
			["wep", ["CUP_srifle_L129A1", "CUP_srifle_L129A1_HG"], 1, RANDOM_BETWEEN(4,9)],
			["wep", "CUP_arifle_L85A2_G", 1, RANDOM_BETWEEN(4,9)],
			["wep", "CUP_arifle_M16A1", 1, RANDOM_BETWEEN(4,9)],
			["wep", "CUP_arifle_M16A2", 1, RANDOM_BETWEEN(4,9)],
			["wep", "CUP_arifle_M16A4_Base", 1, RANDOM_BETWEEN(4,9)],
			["wep", "CUP_arifle_HK_M27_VFG", 1, RANDOM_BETWEEN(4,9)],
			["itm", "ToolKit", RANDOM_BETWEEN(1,2)],
			["itm", "Medikit", RANDOM_BETWEEN(1,2)],
			["itm", "FirstAidKit", RANDOM_BETWEEN(2,4)],
			["itm", _vests, RANDOM_BETWEEN(2,4)],
			["itm", _scopes, RANDOM_BETWEEN(2,4)],
			["itm", _rifleSilencers, RANDOM_ODDS(0.25)],
			["itm", _accessories, RANDOM_ODDS(0.25)],
			["bac", _backpacks, RANDOM_BETWEEN(2,4)]
		];
	};
	case "mission_rifles4": {
		_boxItems = [
			["wep", ["CUP_arifle_M4A1_black", "CUP_arifle_M4A3_black"], 1, RANDOM_BETWEEN(4,9)],
			["wep", ["CUP_arifle_Mk17_CQC_FG", "CUP_arifle_Mk17_CQC_SFG"], 1, RANDOM_BETWEEN(4,9)],
			["wep", "CUP_arifle_SBR_od", 1, RANDOM_BETWEEN(4,9)],
			["wep", "CUP_arifle_Mk20", 1, RANDOM_BETWEEN(4,9)],
			["wep", "CUP_arifle_mk18_black", 1, RANDOM_BETWEEN(4,9)],
			["wep", "arifle_Mk20C_plain_F", 1, RANDOM_BETWEEN(4,9)],
			["wep", "arifle_MX_F", 1, RANDOM_BETWEEN(4,9)],
			["wep", "CUP_arifle_OTS14_GROZA_762_Grip", 1, RANDOM_BETWEEN(4,9)],
			["itm", "ToolKit", RANDOM_BETWEEN(1,2)],
			["itm", "Medikit", RANDOM_BETWEEN(1,2)],
			["itm", "FirstAidKit", RANDOM_BETWEEN(2,4)],
			["itm", _vests, RANDOM_BETWEEN(2,4)],
			["itm", _scopes, RANDOM_BETWEEN(2,4)],
			["itm", _rifleSilencers, RANDOM_ODDS(0.25)],
			["itm", _accessories, RANDOM_ODDS(0.25)],
			["bac", _backpacks, RANDOM_BETWEEN(2,4)]
		];
	};
	case "mission_rifles5": {
		_boxItems = [
			["wep", ["CUP_arifle_RPK74_45", "CUP_arifle_RPK74_45_top_rail"], 1, RANDOM_BETWEEN(4,9)],
			["wep", ["CUP_arifle_Sa58P", "CUP_arifle_Sa58RIS2"], 1, RANDOM_BETWEEN(4,9)],
			["wep", "CUP_arifle_SAIGA_MK03", 1, RANDOM_BETWEEN(4,9)],
			["wep", "arifle_SPAR_01_blk_F", 1, RANDOM_BETWEEN(4,9)],
			["wep", "CUP_arifle_SR3M_Vikhr_VFG_top_rail", 1, RANDOM_BETWEEN(4,9)],
			["wep", "arifle_TRG21_F", 1, RANDOM_BETWEEN(4,9)],
			["wep", "arifle_ARX_blk_F", 1, RANDOM_BETWEEN(4,9)],
			["wep", "CUP_arifle_TYPE_56_2_top_rail", 1, RANDOM_BETWEEN(4,9)],
			["itm", "ToolKit", RANDOM_BETWEEN(1,2)],
			["itm", "Medikit", RANDOM_BETWEEN(1,2)],
			["itm", "FirstAidKit", RANDOM_BETWEEN(2,4)],
			["itm", _vests, RANDOM_BETWEEN(2,4)],
			["itm", _scopes, RANDOM_BETWEEN(2,4)],
			["itm", _rifleSilencers, RANDOM_ODDS(0.25)],
			["itm", _accessories, RANDOM_ODDS(0.25)],
			["bac", _backpacks, RANDOM_BETWEEN(2,4)]
		];
	};
	case "mission_rifles6": {
		_boxItems = [
			["wep", ["CUP_arifle_XM8_Carbine", "CUP_arifle_XM8_Railed"], 1, RANDOM_BETWEEN(4,9)],
			["wep", "CUP_arifle_HK416_CQB_Black", 1, RANDOM_BETWEEN(4,9)],
			["wep", "CUP_arifle_X95", 1, RANDOM_BETWEEN(4,9)],
			["wep", "CUP_arifle_XM16E1", 1, RANDOM_BETWEEN(4,9)],
			["wep", "CUP_arifle_xm8_sharpshooter", 1, RANDOM_BETWEEN(4,9)],
			["wep", "arifle_SPAR_01_khk_F", 1, RANDOM_BETWEEN(4,9)],
			["wep", "CUP_arifle_M16A1", 1, RANDOM_BETWEEN(4,9)],
			["wep", "arifle_AK12U_F", 1, RANDOM_BETWEEN(4,9)],
			["itm", "ToolKit", RANDOM_BETWEEN(1,2)],
			["itm", "Medikit", RANDOM_BETWEEN(1,2)],
			["itm", "FirstAidKit", RANDOM_BETWEEN(2,4)],
			["itm", _vests, RANDOM_BETWEEN(2,4)],
			["itm", _scopes, RANDOM_BETWEEN(2,4)],
			["itm", _rifleSilencers, RANDOM_ODDS(0.25)],
			["itm", _accessories, RANDOM_ODDS(0.25)],
			["bac", _backpacks, RANDOM_BETWEEN(2,4)]
		];
	};
	case "mission_snipers1": {
		_boxItems = [
			["wep", "CUP_arifle_AS_VAL", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_srifle_G22_des", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_srifle_AS50", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "srifle_DMR_07_blk_F", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_srifle_CZ550_rail", 1, RANDOM_BETWEEN(4, 9)],
			["itm", _bipodSniper, RANDOM_BETWEEN(2, 3)],
			["itm", _opforSniperScope, RANDOM_BETWEEN(1, 2)],
			["itm", _bluforSniperScope, RANDOM_BETWEEN(2, 4)],
			["itm", _bluforGhillie, 1],
			["itm", _opforGhillie, 1],
			["itm", _indyGhillie, 1],
			["itm", "ToolKit", RANDOM_BETWEEN(1,2)],
			["itm", "Medikit", RANDOM_BETWEEN(1,2)],
			["itm", "FirstAidKit", RANDOM_BETWEEN(2,4)],
			["itm", _vests, RANDOM_BETWEEN(2,4)],
			["itm", _sniperSilencers, RANDOM_ODDS(0.25)],
			["itm", _accessories, RANDOM_ODDS(0.25)],
			["bac", _backpacks, RANDOM_BETWEEN(2,4)]
		];
	};
	case "mission_snipers2": {
		_boxItems = [
			["wep", "CUP_srifle_CZ750", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_arifle_AS_VAL_VFG_top_rail", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_arifle_HK417_20", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_srifle_ksvk", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_srifle_AWM_wdl", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_srifle_LeeEnfield_rail", 1, RANDOM_BETWEEN(4, 9)],
			["itm", _bipodSniper, RANDOM_BETWEEN(2, 3)],
			["itm", _opforSniperScope, RANDOM_BETWEEN(1, 2)],
			["itm", _bluforSniperScope, RANDOM_BETWEEN(2, 4)],
			["itm", _bluforGhillie, 1],
			["itm", _opforGhillie, 1],
			["itm", _indyGhillie, 1],
			["itm", "ToolKit", RANDOM_BETWEEN(1,2)],
			["itm", "Medikit", RANDOM_BETWEEN(1,2)],
			["itm", "FirstAidKit", RANDOM_BETWEEN(2,4)],
			["itm", _vests, RANDOM_BETWEEN(2,4)],
			["itm", _sniperSilencers, RANDOM_ODDS(0.25)],
			["itm", _accessories, RANDOM_ODDS(0.25)],
			["bac", _backpacks, RANDOM_BETWEEN(2,4)]
		];
	};
	case "mission_snipers3": {
		_boxItems = [
			["wep", "CUP_srifle_M107_Base", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_srifle_m110_kac_black", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_srifle_M14", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_srifle_M24_wdl", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "srifle_LRR_LRPS_F", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_srifle_M40A3", 1, RANDOM_BETWEEN(4, 9)],
			["itm", _bipodSniper, RANDOM_BETWEEN(2, 3)],
			["itm", _opforSniperScope, RANDOM_BETWEEN(1, 2)],
			["itm", _bluforSniperScope, RANDOM_BETWEEN(2, 4)],
			["itm", _bluforGhillie, 1],
			["itm", _opforGhillie, 1],
			["itm", _indyGhillie, 1],
			["itm", "ToolKit", RANDOM_BETWEEN(1,2)],
			["itm", "Medikit", RANDOM_BETWEEN(1,2)],
			["itm", "FirstAidKit", RANDOM_BETWEEN(2,4)],
			["itm", _vests, RANDOM_BETWEEN(2,4)],
			["itm", _sniperSilencers, RANDOM_ODDS(0.25)],
			["itm", _accessories, RANDOM_ODDS(0.25)],
			["bac", _backpacks, RANDOM_BETWEEN(2,4)]
		];
	};
	case "mission_snipers4": {
		_boxItems = [
			["wep", "CUP_srifle_M14_DMR", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "srifle_LRR_camo_LRPS_F", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "srifle_DMR_06_camo_F", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "srifle_EBR_F", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_srifle_Mk12SPR", 1, RANDOM_BETWEEN(4, 9)],
			["itm", _bipodSniper, RANDOM_BETWEEN(2, 3)],
			["itm", _opforSniperScope, RANDOM_BETWEEN(1, 2)],
			["itm", _bluforSniperScope, RANDOM_BETWEEN(2, 4)],
			["itm", _bluforGhillie, 1],
			["itm", _opforGhillie, 1],
			["itm", _indyGhillie, 1],
			["itm", "ToolKit", RANDOM_BETWEEN(1,2)],
			["itm", "Medikit", RANDOM_BETWEEN(1,2)],
			["itm", "FirstAidKit", RANDOM_BETWEEN(2,4)],
			["itm", _vests, RANDOM_BETWEEN(2,4)],
			["itm", _sniperSilencers, RANDOM_ODDS(0.25)],
			["itm", _accessories, RANDOM_ODDS(0.25)],
			["bac", _backpacks, RANDOM_BETWEEN(2,4)]
		];
	};
	case "mission_snipers5": {
		_boxItems = [
			["wep", "srifle_DMR_03_F", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "arifle_MXM_F", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "srifle_DMR_01_F", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "arifle_SPAR_03_blk_F", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_srifle_SVD", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_srifle_VSSVintorez_VFG_top_rail", 1, RANDOM_BETWEEN(4, 9)],
			["itm", _bipodSniper, RANDOM_BETWEEN(2, 3)],
			["itm", _opforSniperScope, RANDOM_BETWEEN(1, 2)],
			["itm", _bluforSniperScope, RANDOM_BETWEEN(2, 4)],
			["itm", _bluforGhillie, 1],
			["itm", _opforGhillie, 1],
			["itm", _indyGhillie, 1],
			["itm", "ToolKit", RANDOM_BETWEEN(1,2)],
			["itm", "Medikit", RANDOM_BETWEEN(1,2)],
			["itm", "FirstAidKit", RANDOM_BETWEEN(2,4)],
			["itm", _vests, RANDOM_BETWEEN(2,4)],
			["itm", _sniperSilencers, RANDOM_ODDS(0.25)],
			["itm", _accessories, RANDOM_ODDS(0.25)],
			["bac", _backpacks, RANDOM_BETWEEN(2,4)]
		];
	};
	case "mission_lmgs1": {
		_boxItems = [
			["wep", "arifle_CTARS_blk_F", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_lmg_L110A1", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_lmg_L7A2_Flat", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_arifle_L86A2", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "LMG_03_F", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_lmg_M240", 1, RANDOM_BETWEEN(4, 9)],
			["itm", "ToolKit", RANDOM_BETWEEN(1,2)],
			["itm", "Medikit", RANDOM_BETWEEN(1,2)],
			["itm", "FirstAidKit", RANDOM_BETWEEN(2,4)],
			["itm", _vests, RANDOM_BETWEEN(2,4)],
			["itm", _scopes, RANDOM_BETWEEN(2,4)],
			["itm", _accessories, RANDOM_ODDS(0.25)],
			["bac", _backpacks, RANDOM_BETWEEN(2,4)]
		];
	};
	case "mission_lmgs2": {
		_boxItems = [
			["wep", ["CUP_lmg_m249_SQuantoon","CUP_lmg_M249_E2"], 1, RANDOM_BETWEEN(4, 9)],
			["wep", ["CUP_lmg_M60","CUP_lmg_M60E4"], 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_lmg_FNMAG_RIS", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_arifle_MG36", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_lmg_MG3_rail", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_lmg_minimi_railed", 1, RANDOM_BETWEEN(4, 9)],
			["itm", "ToolKit", RANDOM_BETWEEN(1,2)],
			["itm", "Medikit", RANDOM_BETWEEN(1,2)],
			["itm", "FirstAidKit", RANDOM_BETWEEN(2,4)],
			["itm", _vests, RANDOM_BETWEEN(2,4)],
			["itm", _scopes, RANDOM_BETWEEN(2,4)],
			["itm", _accessories, RANDOM_ODDS(0.25)],
			["bac", _backpacks, RANDOM_BETWEEN(2,4)]
		];
	};
	case "mission_lmgs3": {
		_boxItems = [
			["wep", "CUP_lmg_Mk48", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_lmg_PKM", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_lmg_Pecheneg_woodland", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_arifle_RPK74", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_lmg_UK59", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_arifle_xm8_SAW", 1, RANDOM_BETWEEN(4, 9)],
			["wep", ["arifle_SPAR_02_blk_F","arifle_SPAR_02_snd_F"], 1, RANDOM_BETWEEN(4, 9)],
			["itm", "ToolKit", RANDOM_BETWEEN(1,2)],
			["itm", "Medikit", RANDOM_BETWEEN(1,2)],
			["itm", "FirstAidKit", RANDOM_BETWEEN(2,4)],
			["itm", _vests, RANDOM_BETWEEN(2,4)],
			["itm", _scopes, RANDOM_BETWEEN(2,4)],
			["itm", _accessories, RANDOM_ODDS(0.25)],
			["bac", _backpacks, RANDOM_BETWEEN(2,4)]
		];
	};
	case "mission_launchers1": {
		_boxItems = [
			["wep", "CUP_launch_9K32Strela", RANDOM_BETWEEN(1, 2)],
			["wep", "CUP_launch_FIM92Stinger", RANDOM_BETWEEN(1, 2)],
			["wep", "CUP_launch_Igla", RANDOM_BETWEEN(1, 2)],
			["wep", "CUP_launch_RPG18", RANDOM_BETWEEN(1, 2)],
			["wep", ["CUP_launch_M72A6","CUP_launch_M72A6_Special"], RANDOM_BETWEEN(1, 2)],
			["itm", "ToolKit", RANDOM_BETWEEN(1,2)],
			["itm", "Medikit", RANDOM_BETWEEN(1,2)],
			["itm", "FirstAidKit", RANDOM_BETWEEN(2,4)],
			["itm", _vests, RANDOM_BETWEEN(2,4)],
			["bac", _backpacks, RANDOM_BETWEEN(2,4)]
		];
	};
	case "mission_launchers2": {
		_boxItems = [
			["wep", "CUP_launch_Mk153Mod0", 1, RANDOM_BETWEEN(2, 4)],
			["wep", "CUP_launch_Javelin", RANDOM_ODDS(0.25), RANDOM_BETWEEN(2, 4)],
			["wep", "CUP_launch_M136", RANDOM_BETWEEN(1,2)],
			["wep", "CUP_launch_M47", RANDOM_ODDS(0.50), RANDOM_BETWEEN(2, 4)],
			["wep", "CUP_launch_Metis", RANDOM_ODDS(0.50), RANDOM_BETWEEN(2, 4)],
			["wep", "CUP_launch_RPG7V", 1, RANDOM_BETWEEN(2, 4)],
			["itm", "ToolKit", RANDOM_BETWEEN(1,2)],
			["itm", "Medikit", RANDOM_BETWEEN(1,2)],
			["itm", "FirstAidKit", RANDOM_BETWEEN(2,4)],
			["itm", _vests, RANDOM_BETWEEN(2,4)],
			["bac", _backpacks, RANDOM_BETWEEN(2,4)]
		];
	};
	case "mission_smgs1": {
		_boxItems = [
			["wep", "SMG_03C_black", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_hgun_BallisticShield_Armed", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_smg_EVO", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_smg_Mac10", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_smg_MP5A5", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_smg_MP7", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "hgun_PDW2000_F", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "SMG_01_F", 1, RANDOM_BETWEEN(4, 9)],
			["itm", "ToolKit", RANDOM_BETWEEN(1,2)],
			["itm", "Medikit", RANDOM_BETWEEN(1,2)],
			["itm", "FirstAidKit", RANDOM_BETWEEN(2,4)],
			["itm", _vests, RANDOM_BETWEEN(2,4)],
			["itm", _smgSilencers, RANDOM_ODDS(0.50)],
			["itm", _scopes, RANDOM_BETWEEN(2,4)],
			["bac", _backpacks, RANDOM_BETWEEN(2,4)]
		];
	};
	case "mission_smgs2": {
		_boxItems = [
			["wep", "CUP_smg_MP5SD6", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_smg_vityaz", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_smg_bizon", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "SMG_05_F", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_smg_SA61", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "CUP_smg_saiga9", 1, RANDOM_BETWEEN(4, 9)],
			["wep", "SMG_02_F", 1, RANDOM_BETWEEN(4, 9)],
			["itm", "ToolKit", RANDOM_BETWEEN(1,2)],
			["itm", "Medikit", RANDOM_BETWEEN(1,2)],
			["itm", "FirstAidKit", RANDOM_BETWEEN(2,4)],
			["itm", _vests, RANDOM_BETWEEN(2,4)],
			["itm", _smgSilencers, RANDOM_ODDS(0.50)],
			["itm", _scopes, RANDOM_BETWEEN(2,4)],
			["bac", _backpacks, RANDOM_BETWEEN(2,4)]
		];
	};
	case "mission_throwables1": {
		_boxItems = [
			["wep", "HandGrenade", RANDOM_BETWEEN(5, 10)],
			["wep", "MiniGrenade", RANDOM_BETWEEN(5, 10)],
			["wep", "SmokeShellYellow", RANDOM_BETWEEN(2, 5)],
			["wep", "SmokeShellGreen", RANDOM_BETWEEN(2, 5)],
			["itm", "ToolKit", RANDOM_BETWEEN(1,2)],
			["itm", "Medikit", RANDOM_BETWEEN(1,2)],
			["itm", "FirstAidKit", RANDOM_BETWEEN(2,4)],
			["itm", _vests, RANDOM_BETWEEN(2,4)],
			["bac", _backpacks, RANDOM_BETWEEN(2,4)]
		];
	};
	// Diving Loot
	case "mission_Gear_Diving": {
		_boxItems = [
			["itm", "V_RebreatherB", RANDOM_BETWEEN(2, 4)],
			["itm", "V_RebreatherIR", RANDOM_BETWEEN(2, 4)],
			["itm", "V_RebreatherIA", RANDOM_BETWEEN(2, 4)],
			["itm", "U_B_Wetsuit", RANDOM_BETWEEN(2, 4)],
			["itm", "U_O_Wetsuit", RANDOM_BETWEEN(2, 4)],
			["itm", "U_I_Wetsuit", RANDOM_BETWEEN(2, 4)],
			["itm", "G_Diving", RANDOM_BETWEEN(4, 7)],
			["bac", "B_LegStrapBag_black_F", RANDOM_BETWEEN(3, 4)],
			["wep", "arifle_SDAR_F", RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(5, 10)],
			["itm", ["Chemlight_red","Chemlight_green","Chemlight_yellow","Chemlight_blue"], RANDOM_BETWEEN(3, 6)]
		];
	};
	// Night Loot
	case "mission_Gear_Night": {
		_boxItems = [
			["itm", "CUP_NVG_HMNVS", RANDOM_BETWEEN(2, 4)], // Night Vision goggles
			["itm", [
				"CUP_optic_AN_PVS_4",
				"CUP_optic_AN_PVS_4_M14",
				"CUP_optic_AN_PVS_4_M16",
			"CUP_optic_AN_PVS_10"], RANDOM_BETWEEN(2, 4)], // Night Vision Scope
			["itm", [
				"CUP_NVG_GPNVG_black",
				"CUP_NVG_GPNVG_tan",
				"CUP_NVG_GPNVG_green",
			"CUP_NVG_GPNVG_winter"], RANDOM_BETWEEN(2, 4)], // Night Vision goggles
			["itm", [
				"CUP_NVG_PVS15_black",
				"CUP_NVG_PVS15_tan",
				"CUP_NVG_PVS15_green",
			"CUP_NVG_PVS15_winter"], RANDOM_BETWEEN(2, 4)], // Night Vision goggles
			["itm", [
				"Chemlight_red",
				"Chemlight_green",
				"Chemlight_yellow",
			"Chemlight_blue"], RANDOM_BETWEEN(3, 6)]
		];
	};
};

[_box, _boxItems] call processItems;