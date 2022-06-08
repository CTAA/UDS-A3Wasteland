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

// Item Loot Arrays

private _bipodSniper = [
	"bipod_01_F_blk",
	"bipod_02_F_blk",
	"bipod_03_F_blk"
];
private _opforSniperScope = [
	"CUP_optic_PSO_1_1",
	"CUP_optic_PSO_1_1_open",
	"CUP_optic_PSO_1",
	"CUP_optic_PSO_1_open",
	"CUP_optic_PSO_3",
	"CUP_optic_PSO_3_open",
	"CUP_optic_NSPU",
	"CUP_optic_AN_PVS_10"
];
private _bluforSniperScope = [
	"CUP_optic_LeupoldMk4_25x50_LRT_DESERT",
	"CUP_optic_Leupold_VX3",
	"CUP_optic_LeupoldMk4",
	"CUP_optic_LeupoldMk4_CQ_T",
	"optic_AMS",
	"optic_KHS_blk",
	"optic_DMS",
	"optic_SOS",
	"optic_LRPS",
	"CUP_optic_SB_11_4x20_PM"
];
private _bluforGhillie = [
	"U_B_GhillieSuit",
	"U_B_FullGhillie_ard",
	"U_B_FullGhillie_lsh",
	"U_B_FullGhillie_sard",
	"U_B_T_FullGhillie_tna_F",
	"CUP_U_B_CZ_WDL_Ghillie",
	"CUP_U_B_BAF_MTP_GHILLIE",
	"CUP_U_B_BAF_DDPM_GHILLIE",
	"CUP_U_B_BAF_DPM_GHILLIE",
	"CUP_U_B_CZ_DST_Ghillie"
];
private _opforGhillie = [
	"U_O_GhillieSuit",
	"U_O_FullGhillie_ard",
	"U_O_FullGhillie_lsh",
	"U_O_FullGhillie_sard",
	"U_O_T_FullGhillie_tna_F",
	"CUP_U_O_RUS_Ghillie",
	"CUP_U_O_TK_Ghillie_Top"
];
private _indyGhillie = [
	"U_I_GhillieSuit",
	"U_I_FullGhillie_ard",
	"U_I_FullGhillie_lsh",
	"U_I_FullGhillie_sard",
	"CUP_U_I_Ghillie_Top"
];
private _vests = [
	"V_LegStrapBag_olive_F",
	"V_PlateCarrier1_rgr",
	"V_PlateCarrier2_rgr",
	"V_PlateCarrierGL_rgr",
	"V_PlateCarrierSpec_rgr",
	"V_PlateCarrierIA1_dgtl",
	"V_PlateCarrierIA2_dgtl",
	"V_PlateCarrierIAGL_dgtl",
	"V_SmershVest_01_F",
	"V_CarrierRigKBT_01_heavy_Olive_F",
	"V_CarrierRigKBT_01_light_Olive_F",
	"V_CarrierRigKBT_01_Olive_F",
	"V_EOD_olive_F",
	"V_HarnessO_brn",
	"V_BandollierB_rgr",
	"V_Chestrig_rgr",
	"V_Chestrig_oli",
	"V_Pocketed_olive_F",
	"V_TacChestrig_grn_F",
	"V_PlateCarrier2_rgr_noflag_F",
	"V_TacVest_oli",
	"V_TacVestIR_blk",
	"CUP_V_CDF_6B3_1_Green",
	"CUP_V_RUS_6B45_1_BeigeDigital",
	"CUP_V_CZ_vest01",
	"CUP_V_CZ_NPP2006_nk_vz95",
	"CUP_V_B_ALICE",
	"CUP_V_B_GER_Armatus_Fleck",
	"CUP_V_B_GER_Armatus_BB_Fleck",
	"CUP_V_B_GER_Carrier_Vest_3",
	"CUP_V_B_Interceptor_Base_Olive",
	"CUP_V_O_SLA_M23_1_OD",
	"CUP_V_I_RACS_Carrier_Rig_wdl_2",
	"CUP_V_B_PASGT_OD",
	"CUP_V_B_Delta_1",
	"CUP_V_B_GER_Tactical_Trop",
	"CUP_V_PMC_CIRAS_Black_Veh"
];
private _backpacks = [
	"B_Messenger_Olive_F",
	"CUP_B_ACRScout_m95",
	"B_AssaultPack_rgr",
	"CUP_B_USMC_AssaultPack",
	"B_FieldPack_green_F",
	"B_Kitbag_rgr",
	"BWA3_TacticalPack_Fleck",
	"B_ViperLightHarness_oli_F",
	"CUP_B_RUS_Backpack",
	"CUP_B_GER_Pack_Flecktarn",
	"CUP_B_Motherlode_MTP",
	"CUP_B_AlicePack_Khaki",
	"CUP_B_Predator_MTP",
	"B_ViperHarness_oli_F",
	"CUP_B_USMC_MOLLE",
	"CUP_B_Kombat_Olive",
	"CUP_B_HikingPack_Civ",
	"CUP_B_USPack_Coyote",
	"B_Carryall_oli",
	"B_Bergen_tna_F",
	"B_RadioBag_01_ghex_F"
];
private _scopes = [
	"optic_Aco",
	"optic_Holosight",
	"optic_ico_01_f",
	"optic_MRCO",
	"optic_ERCO_blk_F",
	"optic_Arco",
	"optic_Hamr",
	"CUP_optic_ElcanM145",
	"CUP_optic_G33_HWS_BLK",
	"CUP_optic_HensoldtZO",
	"CUP_optic_ACOG_TA01B_Black",
	"CUP_optic_MRad",
	"CUP_optic_Kobra"
];
private _accessories = [
	"acc_flashlight",
	"acc_pointer_IR"
]
private _smgSilencers = [
	"muzzle_snds_L",
	"muzzle_snds_acp"
];
private _rifleSilencers = [
	"muzzle_snds_M",
	"muzzle_snds_570",
	"muzzle_snds_58_blk_F",
	"muzzle_snds_H",
	"muzzle_snds_B",
	"CUP_muzzle_snds_G36_black",
	"CUP_muzzle_snds_SCAR_L",
	"CUP_muzzle_snds_M16",
	"CUP_muzzle_snds_XM8",
	"CUP_muzzle_snds_KZRZP_AK762",
	"CUP_muzzle_Bizon",
	"CUP_muzzle_snds_KZRZP_AK545",
	"CUP_muzzle_TGPA",
	"CUP_muzzle_PBS4",
	"CUP_muzzle_snds_SCAR_H",
	"CUP_muzzle_snds_L85"
];
private _sniperSilencers = [
	"muzzle_snds_B",
	"muzzle_snds_H",
	"muzzle_snds_338_black",
	"CUP_muzzle_snds_KZRZP_AK762",
	"CUP_muzzle_mfsup_Suppressor_M107_Black",
	"CUP_muzzle_snds_M110_black",
	"CUP_muzzle_snds_M14",
	"CUP_muzzle_snds_KZRZP_SVD"
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
			["wep", "HandGrenade", RANDOM_BETWEEN(10, 20)],
			["wep", "MiniGrenade", RANDOM_BETWEEN(10, 20)],
			["wep", "SmokeShellRed", RANDOM_BETWEEN(5, 10)],
			["wep", "SmokeShellYellow", RANDOM_BETWEEN(5, 10)],
			["wep", "SmokeShellGreen", RANDOM_BETWEEN(5, 10)],
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