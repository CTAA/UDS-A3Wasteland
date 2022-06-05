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
		["CUP_B_A10_DYN_USA","A10aHeavy"],
		["CUP_B_AV8B_DYN_USMC","AV8BCAS"],
		["CUP_B_F35B_BAF","F35BCAS"],
		["CUP_B_JAS39_HIL","A149CAS"],
		["CUP_B_L39_CZ","L39CAS"],
		["CUP_B_Su25_Dyn_CDF","SU25CAS"],
		["CUP_B_SU34_CDF"]
	];

	_missionType = "Armed Jet";
	_locationsArray = MissionSpawnMarkers;

	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_this call mission_VehicleCapture;
