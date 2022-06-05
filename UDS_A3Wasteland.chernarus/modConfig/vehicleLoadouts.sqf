// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2017 A3Wasteland.com *
// ******************************************************************************************
//    @file Name: vehicleLoadouts.sqf
//    @file Author: AgentRev

/*
    HOW TO CREATE A PYLON LOADOUT:
     1. Create new scenario in Eden, add vehicle, adjust pylon loadout, and set Object Init to: copyToClipboard str getPylonMagazines this
     3. Play scenario, wait until loaded, then pause game and return to Eden.
     4. Your pylon array is now in the clipboard, which you can paste in this file, e.g. _pylons = ["PylonMissile_Missile_AA_R73_x1","","","","","","","","","","","","",""];

    Note: You can use any pylon type you want in the script, even if not shown in the editor, it should normally work! e.g. "PylonRack_12Rnd_missiles" for "B_Plane_Fighter_01_F"
*/

switch (true) do
{

	// PLANES

	// A10-A Thunderbolt II
    case (_class isKindOf "CUP_B_A10_DYN_USA"):
    {
		_mags =
		[
			["Laserbatteries", [-1]],
			["240Rnd_CMFlare_Chaff_Magazine", [-1]]
		];
		switch (_variant) do
		{
			case "A10aGun": { _pylons = ["","","","","","","","","","",""]};
			case "A10aLight": { _pylons = ["CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","PylonMissile_1Rnd_Mk82_F","PylonMissile_1Rnd_Mk82_F","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_GBU12_M","PylonMissile_1Rnd_Mk82_F","PylonMissile_1Rnd_Mk82_F","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_ANAAQ_28"]};
			case "A10aHeavy": { _pylons = ["CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_3Rnd_Mk82_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_3Rnd_Mk82_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_ANAAQ_28"]};
			default           { _pylons = ["","","","","","","","","","",""]};
		};
    };
	// A-149 Gryphon
	case (_class isKindOf "CUP_B_JAS39_HIL"):
	{
		_mags =
		[
			["magazine_Fighter01_Gun20mm_AA_x450", [-1]],
			["magazine_Fighter01_Gun20mm_AA_x450", [-1]],
			["Laserbatteries", [-1]],
			["240Rnd_CMFlare_Chaff_Magazine", [-1]]
		];
		switch (_variant) do
		{
			case "A149Gun" : { _pylons = ["","","","","",""]};
			case "A149CAS" : { _pylons = ["CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_ANAAQ_28","CUP_PylonPod_2Rnd_Mk82_M"]};
			default          { _pylons = ["","","","","",""]};
		};
	};
	// AV-8B Harrier II
	case (_class isKindOf "CUP_B_AV8B_DYN_USMC"):
	{
		_mags =
		[
			["CUP_300Rnd_TE1_Red_Tracer_25mm_GAU12_M", [-1]],
			["CUP_300Rnd_TE1_Red_Tracer_25mm_GAU12_M", [-1]],
			["Laserbatteries", [-1]],
			["240Rnd_CMFlare_Chaff_Magazine", [-1]]
		];
		switch (_variant) do
		{
			case "AV8BGun" : { _pylons = ["","","","","",""]};
			case "AV8BCAS" : { _pylons = ["CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_ANAAQ_28","CUP_PylonPod_2Rnd_GBU12_M","CUP_PylonPod_2Rnd_GBU12_M","CUP_PylonPod_2Rnd_Mk82_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M"]};
			default          { _pylons = ["","","","","",""]};
		};
	};
	// F-35B Lightning II
	case (_class isKindOf "CUP_B_F35B_USMC"):
	{
		_mags =
		[
			["CUP_220Rnd_TE1_White_Tracer_30mm_GAU22_M", [-1]],
			["CUP_220Rnd_TE1_White_Tracer_30mm_GAU22_M", [-1]],
			["CUP_220Rnd_TE1_White_Tracer_30mm_GAU22_M", [-1]],
			["Laserbatteries", [-1]],
			["240Rnd_CMFlare_Chaff_Magazine", [-1]]
		];
		_weapons =
        [
            ["CUP_Vacannon_GAU22_veh", [-1]]
        ];
		switch (_variant) do
		{
			case "F35BGun" : { _pylons = ["","","","","","","","","","",""]};
			case "F35BCAS" : { _pylons = ["CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_1Rnd_Mk82_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_ANAAQ_28","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_Mk82_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M"]};
			default          { _pylons = ["","","","","","","","","","",""]};
		};
	};
	// L-39ZA
	case (_class isKindOf "CUP_B_L39_CZ"):
	{
		_mags =
		[
			["CUP_150Rnd_TE2_Green_Tracer_GSh23_23mm_APHE_M", [-1]],
			["CUP_150Rnd_TE2_Green_Tracer_GSh23_23mm_APHE_M", [-1]],
			["CUP_150Rnd_TE2_Green_Tracer_GSh23_23mm_APHE_M", [-1]],
			["CUP_150Rnd_TE2_Green_Tracer_GSh23_23mm_APHE_M", [-1]],
			["Laserbatteries", [-1]],
			["240Rnd_CMFlare_Chaff_Magazine", [-1]]
		];
		switch (_variant) do
		{
			case "L39Gun" : { _pylons = ["","","",""]};
			case "L39CAS" : { _pylons = ["CUP_PylonPod_16Rnd_S5_plane_M","CUP_PylonPod_1Rnd_FAB250_plane_M","CUP_PylonPod_1Rnd_FAB250_plane_M","CUP_PylonPod_16Rnd_S5_plane_M"]};
			default         { _pylons = ["","","",""]};
		};
	};
	// Su-25 Frogfoot
	case (_class isKindOf "CUP_B_Su25_Dyn_CDF"):
	{
		_mags =
		[
			["CUP_750Rnd_TE1_30mm_GSh302K_HE_M", [-1]],
			["Laserbatteries", [-1]],
			["240Rnd_CMFlare_Chaff_Magazine", [-1]]
		];
		switch (_variant) do
		{
			case "SU25Gun" : { _pylons = ["","","","","","","","","",""]};
			case "SU25CAS" : { _pylons = ["CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_20Rnd_S8_plane_M","CUP_PylonPod_1Rnd_KAB250_M","CUP_PylonPod_1Rnd_KAB250_M","CUP_PylonPod_1Rnd_FAB250_plane_M","CUP_PylonPod_1Rnd_FAB250_plane_M","CUP_PylonPod_1Rnd_KAB250_M","CUP_PylonPod_1Rnd_KAB250_M","CUP_PylonPod_20Rnd_S8_plane_M","CUP_PylonPod_1Rnd_R73_Vympel"]};
			default          { _pylons = ["","","","","","","","","",""]};
		};
	};
	// Su-34
	case (_class isKindOf "CUP_B_SU34_CDF"):
	{
		_mags =
		[
			["Laserbatteries", [-1]],
			["240Rnd_CMFlare_Chaff_Magazine", [-1]]
		];
		_pylons = ["CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_20Rnd_S8_plane_M","CUP_PylonPod_1Rnd_KAB250_M","CUP_PylonPod_1Rnd_FAB250_plane_M","CUP_PylonPod_2Rnd_Ataka_M","","","CUP_PylonPod_2Rnd_Ataka_M","CUP_PylonPod_1Rnd_FAB250_plane_M","CUP_PylonPod_1Rnd_KAB250_M","CUP_PylonPod_20Rnd_S8_plane_M","CUP_PylonPod_1Rnd_R73_Vympel"];
	};

	// HELICOPTERS

	// AH-1Z
	case (_class isKindOf "CUP_B_AH1Z_Dynamic_USMC"):
	{
		_pylons = ["","CUP_PylonPod_19Rnd_Rocket_FFAR_M","CUP_PylonPod_2Rnd_Ataka_M","CUP_PylonPod_2Rnd_Ataka_M","CUP_PylonPod_19Rnd_Rocket_FFAR_M",""];
	};
	// AH-64D
	case (_class isKindOf "CUP_B_AH64D_DL_USA"):
	{
		_pylons = ["CUP_PylonPod_19Rnd_Rocket_FFAR_M","CUP_PylonPod_2Rnd_Ataka_M","CUP_PylonPod_2Rnd_Ataka_M","CUP_PylonPod_19Rnd_Rocket_FFAR_M","CUP_PylonPod_2Rnd_Ataka_M","CUP_PylonPod_2Rnd_Ataka_M"];
	};
	// Ka-50 Black Shark
	case (_class isKindOf "CUP_O_Ka50_DL_RU"):
	{
		_pylons = ["CUP_PylonPod_20Rnd_S8_CCIP_M","CUP_PylonPod_20Rnd_S8_CCIP_M","CUP_PylonPod_20Rnd_S8_CCIP_M","CUP_PylonPod_20Rnd_S8_CCIP_M"];
	};
	// Ka-52
	case (_class isKindOf "CUP_O_Ka52_RU"):
	{
		_pylons = ["CUP_PylonPod_4Rnd_Ataka_Empty_M","CUP_PylonPod_20Rnd_S8_CCIP_M","CUP_PylonPod_20Rnd_S8_CCIP_M","CUP_PylonPod_4Rnd_Ataka_Empty_M"];
	};
	// Ka-60 Kasatka Transport
	case (_class isKindOf "CUP_O_Ka60_Grey_RU"):
	{
		_pylons = ["",""]
	};
	// Mi-24 Superhind Mk. III
	case (_class isKindOf "CUP_O_Mi24_Mk3_CSAT_T"):
	{
		_pylons = ["CUP_PylonPod_2Rnd_Ataka_M","CUP_PylonPod_20Rnd_S8N_CCIP_M","CUP_PylonPod_20Rnd_S8N_CCIP_M","CUP_PylonPod_20Rnd_S8N_CCIP_M","CUP_PylonPod_20Rnd_S8N_CCIP_M","CUP_PylonPod_2Rnd_Ataka_M"];
	};
	// Mi-24 Superhind Mk. IV
	case (_class isKindOf "CUP_O_Mi24_Mk4_CSAT_T"):
	{
		_pylons = ["CUP_PylonPod_4Rnd_Ataka_Empty_M","CUP_PylonPod_20Rnd_S8N_CCIP_M","CUP_PylonPod_20Rnd_S8N_CCIP_M","CUP_PylonPod_20Rnd_S8N_CCIP_M","CUP_PylonPod_20Rnd_S8N_CCIP_M","CUP_PylonPod_4Rnd_Ataka_Empty_M"];
	};

	// DRONES

	// MQ-4A Greyhawk
	case (_class isKindOf "B_UAV_02_dynamicLoadout_F"):
	{
		_pylons = ["CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_GBU12_M"];
	};
	// MQ-9 Reaper
	case (_class isKindOf "CUP_B_USMC_DYN_MQ9"):
	{
		_pylons = ["CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_2Rnd_GBU12_M","CUP_PylonPod_2Rnd_GBU12_M","CUP_PylonPod_1Rnd_GBU12_M"];
	};
	// UCAV Sentinel
	case (_class isKindOf "B_UAV_05_F"):
	{
		_pylons = ["",""];
	};
	// SDV SDAR turret
    case (_class isKindOf "SDV_01_base_F"):
    {
        _mags =
        [
            ["20Rnd_556x45_UW_mag", [0]],
            ["20Rnd_556x45_UW_mag", [0]],
            ["20Rnd_556x45_UW_mag", [0]],
            ["20Rnd_556x45_UW_mag", [0]],
            ["20Rnd_556x45_UW_mag", [0]],
            ["20Rnd_556x45_UW_mag", [0]],
            ["30Rnd_556x45_Stanag", [0]],
            ["30Rnd_556x45_Stanag", [0]],
            ["30Rnd_556x45_Stanag", [0]],
            ["Laserbatteries", [0]]
        ];
        _weapons =
        [
            ["arifle_SDAR_F", [0]],
            ["Laserdesignator_mounted", [0]]
        ];
    };
};