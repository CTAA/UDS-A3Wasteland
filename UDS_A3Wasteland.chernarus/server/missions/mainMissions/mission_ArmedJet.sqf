// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_ArmedHeli.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitWith {};
#include "mainMissionDefines.sqf";

private "_vehicleClass";
private "_nbUnits";

_setupVars =
{
	_vehicleClass = selectRandom
	[
		[["CUP_B_A10_DYN_USA","A10aWarthog"],
		["CUP_B_F35B_BAF","F35bCAS"],
		["CUP_B_GR9_DYN_GB","GR9Extra"],
		["CUP_B_Su25_Dyn_CDF","Su25AT"],
		["CUP_B_AV8B_DYN_USMC","Av8bAA"],
		"CUP_I_L39_AAF"]
	];

	_missionType = "Armed Jet";
	_locationsArray = MissionSpawnMarkers;

	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_this call mission_VehicleCapture;
