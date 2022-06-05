// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_Truck.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitWith {};
#include "sideMissionDefines.sqf"

private ["_nbUnits", "_vehicleClass", "_vehicle"];

_setupVars =
{
	_missionType = "Supply Truck";
	_locationsArray = MissionSpawnMarkers;
	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;

	_vehicleClass =
	[
		"CUP_B_T810_Unarmed_CZ_WDL",
		"CUP_B_T810_Refuel_CZ_WDL",
		"CUP_B_T810_Reammo_CZ_WDL",
		"CUP_B_T810_Repair_CZ_WDL",
		"CUP_B_Kamaz_CDF",
		"CUP_B_Kamaz_Open_CDF",
		"CUP_B_Kamaz_Refuel_CDF",
		"CUP_B_Kamaz_Repair_CDF",
		"CUP_B_Kamaz_Reammo_CDF",
		"CUP_B_MTVR_USA",
		"CUP_B_MTVR_Ammo_USA",
		"CUP_B_MTVR_Refuel_USA",
		"CUP_B_MTVR_Repair_USA",
		"CUP_B_Ural_CDF",
		"CUP_B_Ural_Open_CDF",
		"CUP_B_Ural_Refuel_CDF",
		"CUP_B_Ural_Repair_CDF",
		"CUP_B_Ural_Reammo_CDF"
	] call BIS_fnc_selectRandom;

	// Class, Position, Fuel, Ammo, Damage, Special
	_vehicle = [_vehicleClass, _missionPos] call createMissionVehicle;
	_vehicle call fn_refilltruck;

	_aiGroup = createGroup CIVILIAN;
	[_aiGroup, _missionPos, _nbUnits] call createCustomGroup;

	_missionPicture = getText (configFile >> "CfgVehicles" >> _vehicleClass >> "picture");
	_vehicleName = getText (configFile >> "CfgVehicles" >> _vehicleClass >> "displayName");

	_missionHintText = format ["A <t color='%2'>%1</t> has been immobilized, go get it for your team.", _vehicleName, sideMissionColor];
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = {!alive _vehicle};

_failedExec =
{
	// Mission failed
	deleteVehicle _vehicle;
};

_successExec =
{
	// Mission completed
	_vehicle allowDamage true;
	[_vehicle, 1] call A3W_fnc_setLockState; // Unlock

	_successHintMessage = "The truck has been captured.";
};

_this call sideMissionProcessor;
