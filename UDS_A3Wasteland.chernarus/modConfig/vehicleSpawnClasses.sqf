// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2016 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: vehicleSpawnClasses.sqf
//	@file Author: AgentRev


//Civilian Vehicle List - Random Spawns
civilianVehicles =
[
	"CUP_C_Octavia_CIV",
	"CUP_C_Golf4_random_Civ",
	"CUP_C_Datsun",
	"CUP_C_Datsun_4seat",
	"CUP_O_SUV_TKA",
];

//Light Military Vehicle List - Random Spawns
lightMilitaryVehicles =
[
	"CUP_O_Datsun_PK_Random",
	"CUP_O_UAZ_Unarmed_CHDKZ",
	"CUP_O_UAZ_Open_CHDKZ",
	"CUP_O_Ural_RU",
	"CUP_B_HMMWV_SOV_M2_NATO_T",
	"CUP_B_HMMWV_Transport_NATO_T",
	"CUP_B_HMMWV_Unarmed_NATO_T"
];

//Medium Military Vehicle List - Random Spawns
mediumMilitaryVehicles =
[
	"CUP_B_Mastiff_HMG_GB_D",
	"CUP_B_Ridgback_HMG_GB_D",
	"CUP_B_Wolfhound_HMG_GB_W",
	"CUP_B_Dingo_GL_GER_Wdl",
	"CUP_I_SUV_Armored_ION",
	"CUP_B_M1151_NATO_T",
	"CUP_B_M1165_GMV_NATO_T"
];

//Water Vehicles - Random Spawns
waterVehicles =
[
	"CUP_B_Zodiac_USMC",
	"CUP_B_RHIB_USMC",
	"CUP_B_RHIB2Turret_USMC",
	"CUP_B_MK10_GB",
	"CUP_B_LCU1600_USMC"
];

//Object List - Random Spawns.
staticWeaponsList =
[
	"B_Mortar_01_F",
	"O_Mortar_01_F",
	"I_Mortar_01_F",
	"I_G_Mortar_01_F"
];

//Object List - Random Helis.
staticHeliList =
[
	"CUP_C_IDAP_412",
	"CUP_C_IDAP_412_Utility",
	"CUP_B_MH60M_OBS_USA",
	"CUP_O_Ka60_Grey_RU",
	"CUP_B_A159_Unarmed_RN_Blackcat"
];

//Object List - Random Planes.
staticPlaneList =
[
	"CUP_C_CESSNA_CIV",
	"CUP_C_Plane_Orbit"
];
//removed a comma here just noting in case
A3W_planeSpawnOdds = 0.25; // 0.0 to 1.0

//Random Weapon List - Change this to what you want to spawn in cars.
vehicleWeapons =
[
	"CUP_arifle_AK101",
	"CUP_arifle_AK102",
	"CUP_arifle_AK103",
	"CUP_arifle_AK104",
	"CUP_arifle_AK105",
	"CUP_arifle_AK107",
	"CUP_arifle_AK108",
	"CUP_arifle_AK109",
	"arifle_AK12_F",
	"arifle_AKM_F",
	"arifle_AK12U_F",
	"CUP_arifle_AUG_A1",
	"CUP_arifle_CZ805_A2_blk",
	"CUP_CZ_BREN2_762_14",
	"CUP_arifle_FNFAL",
	"CUP_arifle_FNFAL_OSW",
	"CUP_arifle_G36A_RIS",
	"CUP_arifle_HK416_Wood",
	"CUP_arifle_HK417_12_M203",
	"CUP_srifle_L129A1",
	"CUP_arifle_L85A2_G",
	"CUP_arifle_M16A",
	"CUP_arifle_M16A4_Base",
	"CUP_arifle_SBR_od",
	"CUP_arifle_M4A1_black",
	"CUP_arifle_Mk17_CQC_FG",
	"CUP_arifle_Mk20",
	"CUP_arifle_mk18_black",
	"CUP_arifle_OTS14_GROZA_762_Grip",
	"CUP_arifle_RPK74_45",
	"CUP_arifle_Sa58P",
	"CUP_arifle_SAIGA_MK03",
	"arifle_SPAR_01_blk_F",
	"CUP_arifle_SR3M_Vikhr_VFG_top_rail",
	"arifle_TRG21_F",
	"arifle_ARX_blk_F",
	"CUP_arifle_TYPE_56_2_top_rail",
	"CUP_arifle_X95",
	"CUP_arifle_XM16E1",
	"CUP_arifle_XM8_Carbine",
	"CUP_arifle_xm8_sharpshooter",
	"SMG_01_F",
	"SMG_02_F",
	"CUP_smg_saiga9",
	"CUP_smg_SA61",
	"SMG_05_F",
	"CUP_smg_bizon",
	"CUP_smg_vityaz",
	"CUP_smg_MP7",
	"CUP_smg_MP5SD6",
	"CUP_smg_MP5A5",
	"SMG_03C_black",
	"CUP_smg_EVO",
	"CUP_sgun_AA12",
	"CUP_sgun_M1014",
	"sgun_HunterShotgun_01_F",
	"CUP_sgun_CZ584",
	"CUP_sgun_Saiga12K_top_rail"
];

vehicleAddition =
[
	"muzzle_snds_L",
	"muzzle_snds_acp",
	"muzzle_snds_M",
	"muzzle_snds_570",
	"muzzle_snds_58_blk_F",
	"muzzle_snds_H",
	"muzzle_snds_B",
	"muzzle_snds_338_black",
	"muzzle_snds_93mmg", 
	"CUP_muzzle_snds_G36_black",
	"CUP_muzzle_snds_SCAR_L",
	"CUP_muzzle_snds_M16",
	"CUP_muzzle_snds_XM8",
	"CUP_muzzle_snds_KZRZP_AK762",
	"CUP_muzzle_Bizon",
	"CUP_muzzle_PBS4",
	"CUP_muzzle_snds_L85",
	"optic_MRCO",
	"optic_ERCO_blk_F",
	"optic_Arco",
	"optic_Hamr",
	"optic_SOS",
	"optic_DMS",
	"optic_KHS_blk",
	"CUP_optic_ElcanM145",
	"CUP_optic_G33_HWS_BLK",
	"CUP_optic_ACOG_TA01B_Black",
	"FirstAidKit",
	"Medikit",
	"ToolKit",
	"MineDetector",
	"Binocular",
	"Rangefinder"
];

vehicleAddition2 =
[
	"Chemlight_blue",
	"Chemlight_green",
	"Chemlight_yellow",
	"Chemlight_red"
];