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
			case "A10aGun": { _pylons = ["","","","","","","","","","",""]};
			case "A10aLight": { _pylons = ["CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","PylonMissile_1Rnd_Mk82_F","PylonMissile_1Rnd_Mk82_F","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_GBU12_M","PylonMissile_1Rnd_Mk82_F","PylonMissile_1Rnd_Mk82_F","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_ANAAQ_28"]};
			case "A10aHeavy": { _pylons = ["CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_3Rnd_Mk82_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_3Rnd_Mk82_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_ANAAQ_28"]};
			default           { _pylons = ["CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_3Rnd_Mk82_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_3Rnd_Mk82_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_ANAAQ_28"]};
		};
    };
	// A-149 Gryphon
	case (_class isKindOf "CUP_B_JAS39_HIL"):
	{
		switch (_variant) do
		{
			// MUST ADD MAGS
			case "A149Gun" : { _pylons = ["","","","","",""]};
			case "A149CAS" : { _pylons = ["CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_ANAAQ_28","CUP_PylonPod_2Rnd_Mk82_M"]};
		}
	}
	// AV8B Harrier
	case (_class isKindOf "CUP_B_AV8B_DYN_USMC"):
	{
		switch (_variant) do
		{
			// MUST ADD MAGS
			case "AV8BGun" : { _pylons = ["","","","","",""]};
			case "AV8BCAS" : { _pylons = ["CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_ANAAQ_28","CUP_PylonPod_2Rnd_GBU12_M","CUP_PylonPod_2Rnd_GBU12_M","CUP_PylonPod_2Rnd_Mk82_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M"]};
		}
	}
};