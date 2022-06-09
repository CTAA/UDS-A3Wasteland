// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2022 Ural Death Squad *
// ******************************************************************************************
// @file Version: 1.0
// @file Name: fn_refillboxArrays.sqf  "fn_refillboxArrays"
// @file Author: CTA
// @file Created: 08/6/2022 00:00

// Mission refill handler

// There are multiple entries to change odds of whats picked

missionBoxArray = [
	"mission_rifles1",     // 40.00%
	"mission_rifles2",     // 40.00%
	"mission_rifles3",     // 40.00%
	"mission_rifles4",     // 40.00%
	"mission_rifles5",     // 40.00%
	"mission_rifles6",     // 40.00%
	"mission_rifles1",     // 40.00%
	"mission_rifles2",     // 40.00%
	"mission_rifles3",     // 40.00%
	"mission_rifles4",     // 40.00%
	"mission_rifles5",     // 40.00%
	"mission_rifles6",     // 40.00%
	"mission_rifles1",     // 40.00%
	"mission_rifles2",     // 40.00%
	"mission_rifles3",     // 40.00%
	"mission_rifles4",     // 40.00%
	"mission_rifles5",     // 40.00%
	"mission_rifles6",     // 40.00%

	"mission_lmgs1",       // 20.00%
	"mission_lmgs2",       // 20.00%
	"mission_lmgs3",       // 20.00%
	"mission_lmgs1",       // 20.00%
	"mission_lmgs2",       // 20.00%
	"mission_lmgs3",       // 20.00%
	"mission_lmgs1",       // 20.00%
	"mission_lmgs2",       // 20.00%
	"mission_lmgs3",       // 20.00%

	"mission_smgs1",       // 13.33%
	"mission_smgs2",       // 13.33%
	"mission_smgs1",       // 13.33%
	"mission_smgs2",       // 13.33%
	"mission_smgs1",       // 13.33%
	"mission_smgs2", 	   // 13.33%

	"mission_snipers1",    // 11.11%
	"mission_snipers2",    // 11.11%
	"mission_snipers3",    // 11.11%
	"mission_snipers4",    // 11.11%
	"mission_snipers5",    // 11.11%

	"mission_launchers1",  // 8.88%
	"mission_launchers2",  // 8.88%
	"mission_launchers1",  // 8.88%
	"mission_launchers2",  // 8.88%

	"mission_throwables1", // 6.66%
	"mission_throwables1", // 6.66%
	"mission_throwables1"  // 6.66%
];

// Item Loot Arrays

_refillBipodSnipers = [
	"bipod_01_F_blk",
	"bipod_02_F_blk",
	"bipod_03_F_blk"
];
_refillOpforSniperScopes = [
	"CUP_optic_PSO_1_1",
	"CUP_optic_PSO_1_1_open",
	"CUP_optic_PSO_1",
	"CUP_optic_PSO_1_open",
	"CUP_optic_PSO_3",
	"CUP_optic_PSO_3_open",
	"CUP_optic_NSPU",
	"CUP_optic_AN_PVS_10"
];
_refillBluforSniperScopes = [
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
_refillBluforGhillies = [
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
_refillOpforGhillies = [
	"U_O_GhillieSuit",
	"U_O_FullGhillie_ard",
	"U_O_FullGhillie_lsh",
	"U_O_FullGhillie_sard",
	"U_O_T_FullGhillie_tna_F",
	"CUP_U_O_RUS_Ghillie",
	"CUP_U_O_TK_Ghillie_Top"
];
_refillIndyGhillies = [
	"U_I_GhillieSuit",
	"U_I_FullGhillie_ard",
	"U_I_FullGhillie_lsh",
	"U_I_FullGhillie_sard",
	"CUP_U_I_Ghillie_Top"
];
_refillVests = [
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
_refillBackpacks = [
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
_refillScopes = [
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
_refillAccessories = [
	"acc_flashlight",
	"acc_pointer_IR"
]
_refillSmgSilencers = [
	"muzzle_snds_L",
	"muzzle_snds_acp"
];
_refillRifleSilencers = [
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
_refillSniperSilencers = [
	"muzzle_snds_B",
	"muzzle_snds_H",
	"muzzle_snds_338_black",
	"CUP_muzzle_snds_KZRZP_AK762",
	"CUP_muzzle_mfsup_Suppressor_M107_Black",
	"CUP_muzzle_snds_M110_black",
	"CUP_muzzle_snds_M14",
	"CUP_muzzle_snds_KZRZP_SVD"
];
