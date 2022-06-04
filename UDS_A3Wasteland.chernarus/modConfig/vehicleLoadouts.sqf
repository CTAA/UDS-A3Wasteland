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
	// A10-A Thunderbolt II
    case (_class isKindOf "CUP_B_A10_DYN_USA"):
    {
		switch (_variant) do
		{
			case "A10aGun": { _pylons = ["","","","","","","","","","",""] };
		};
    };
	
	// F-35B Lightning II
    case (_class isKindOf "CUP_B_F35B_BAF"):
	{
		switch (_variant) do
		{
			case "F35bGun": { _pylons = ["","","","","","CUP_PylonWeapon_220Rnd_TE1_Red_Tracer_GAU22_M","","","","",""] };
		};
	};

    // Harrier GR.9
	case (_class isKindOf "CUP_B_GR9_DYN_GB"):
	{
		switch (_variant) do
		{
			case "GR9Gun" : { _pylons = ["","","","","PylonWeapon_300Rnd_20mm_shells"."","","",""]; };
		};
	};

    // SU-25 Frogfoot
    case (_class isKindOf "CUP_B_Su25_Dyn_CDF"):
	{
		switch (_variant) do
		{
			case "Su25Gun": { _pylons = ["","","","","","","","","",""] };
		};
    };

    // AV-8B Harrier II
	case (_class isKindOf "CUP_B_AV8B_DYN_USMC"):
	{
		switch (_variant) do
		{
			case "Av8bGun": { _pylons = ["","","","","",""] };
		};
    };

    // UH-60L DAP (2 Stores)
    case (_class isKindOf "CUP_B_MH60L_DAP_2x_US"):
    {
		switch (_variant) do
		{
		};
    };

    // UH-60L DAP (4 Stores)
	case (_class isKindOf "CUP_B_MH60L_DAP_4x_US"):
	{
		switch (_variant) do
		{
		};
    };

    // AH-64D
    case (_class isKindOf "CUP_B_AH64D_DL_USA"):
	{
		switch (_variant) do
		{
		};
    };
};