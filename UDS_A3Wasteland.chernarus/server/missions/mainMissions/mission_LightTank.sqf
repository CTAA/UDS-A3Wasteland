// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_LightArmVeh.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitWith {};
#include "mainMissionDefines.sqf";

private ["_vehicleClass", "_nbUnits"];

_setupVars = {
	_vehicleClass = [
		"CUP_B_M1128_MGS_Woodland_Slat",
		"CUP_B_M60A3_TTS_USMC",
		"CUP_O_T55_CSAT_T",
		"CUP_O_T34_TKA"
	] call BIS_fnc_selectRandom;

	_missionType = "Light Tank";
	_locationsArray = MissionSpawnMarkers;

	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_this call mission_VehicleCapture;
