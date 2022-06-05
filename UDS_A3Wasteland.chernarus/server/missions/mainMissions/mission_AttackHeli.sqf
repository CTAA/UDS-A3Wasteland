// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_MBT.sqf
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
		["CUP_O_Ka52_RU","CUP_O_Mi24_Mk3_CSAT_T","CUP_B_AH64D_DL_USA","CUP_B_AH1Z_Dynamic_USMC"]
	];
	
	_missionType = "Attack Helicopter";

	_locationsArray = MissionSpawnMarkers;

	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_this call mission_VehicleCapture;
