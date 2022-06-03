// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_VehicleCapture.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, JoSchaap, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitWith {};
#include "sideMissionDefines.sqf";

private ["_nbUnits", "_outpost", "_objects","_vehicleClass","_vehicle"];

_setupVars =
{
	_missionType = "Enemy Outpost";
	_locationsArray = MissionSpawnMarkers;
	_nbUnits = AI_GROUP_MEDIUM;
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;

	_outpost = (call compile preprocessFileLineNumbers "server\missions\outposts\outpostsList.sqf") call BIS_fnc_selectRandom;
	_objects = [_outpost, _missionPos, 0] call createOutpost;

	_aiGroup = createGroup CIVILIAN;
	[_aiGroup, _missionPos, _nbUnits, 5] call createCustomGroup;

	_missionHintText = format ["An armed <t color='%1'>outpost</t> containing weapon crates has been spotted near the marker, go capture it!", sideMissionColor]
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec =
{
	// Mission failed
	{ deleteVehicle _x } forEach _objects;
};

_successExec =
{
	// Mission complete
	{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach _objects;
	[_locationsArray, _missionLocation, _objects] call setLocationObjects;
	
	playSound3D ["A3\data_f_curator\sound\cfgsounds\air_raid.wss", _missionPos, false, _missionPos, 15, 1, 1500];
	uiSleep 5;

	{ deleteVehicle _x } forEach _objects;
	uiSleep 1;

	_vehicleClass =
	[	"CUP_B_MCV80_GB_D_SLAT",
		"CUP_B_M1A2_TUSK_MG_USMC",
		"CUP_B_AH6X_USA",
		"CUP_B_FV432_Bulldog_GB_W",
		"CUP_B_M163_USA",
		"CUP_O_Mi24_P_Dynamic_RU",
		"CUP_B_MV22_USMC_RAMPGUN",
		"CUP_B_M270_DPICM_USA",
		"CUP_B_M1128_MGS_Desert"
	] call BIS_fnc_selectRandom;

	_vehicle = [_vehicleClass, _missionPos] call createMissionVehicle;
	[_vehicle, 1] call A3W_fnc_setLockState; // Unlock

	_successHintMessage = "The outpost has been captured, good work.";
};

_this call sideMissionProcessor;
