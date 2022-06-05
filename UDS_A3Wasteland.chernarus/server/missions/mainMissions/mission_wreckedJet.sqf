// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.1
//	@file Name: mission_WreckedJet.sqf
//	@file Author: Aryx

if (!isServer) exitWith {};
#include "mainMissionDefines.sqf";

private ["_vehicle", "_vehicleName", "_vehDeterminer", "_vehicleClass", "_variant"];

_setupVars =
{
	_vehicleClass =
	[
		["CUP_B_A10_DYN_USA","A10aHeavy"],
		["CUP_B_AV8B_DYN_USMC","AV8BCAS"],
		["CUP_B_F35B_BAF","F35BCAS"],
		["CUP_B_JAS39_HIL","A149CAS"],
		["CUP_B_L39_CZ","L39CAS"],
		["CUP_B_Su25_Dyn_CDF","SU25CAS"],
		["CUP_B_SU34_CDF"]
	] call BIS_fnc_selectRandom;

	_missionType = "Wrecked Jet";
	_locationsArray = MissionSpawnMarkers;
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;

	// Class, Position, Fuel, Ammo, Damage, Special
	_vehicle = [_vehicleClass, _missionPos] call createMissionVehicle;
	
	if (_vehicleClass isEqualType []) then
	{
		_variant = _vehicleClass param [1,"",[""]];
		_vehicleClass = _vehicleClass select 0;
	};

	_aiGroup = createGroup CIVILIAN;
	[_aiGroup,_missionPos,12,15] spawn createCustomGroupAirSpecOps;

	_missionPicture = getText (configFile >> "CfgVehicles" >> _vehicleClass >> "picture");
	_vehicleName = getText (configFile >> "CfgVehicles" >> _vehicleClass >> "displayName");

	_vehDeterminer = if ("AEIMO" find (_vehicleName select [0,1]) != -1) then { "An" } else { "A" };

	_missionHintText = format ["%1 <t color='%3'>%2</t> has been immobilized.", _vehDeterminer, _vehicleName, mainMissionColor];	
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
//_waitUntilCondition = nil;
_waitUntilCondition = {!alive _vehicle};

_failedExec =
{
	// Mission failed
	deleteVehicle _vehicle;
};

_successExec =
{
	// Mission completed
	_vehicle lock 1;
	_vehicle setVariable ["R3F_LOG_disabled", false, true];

	_successHintMessage = format ["The %1 has been captured.", _vehicleName];
};

_this call mainMissionProcessor;