// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2019 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_Falcon.sqf
//	@file Author: AryX
//	@file Version: 0.2
//	@file Description: Falcon Extra-Mission

if (!isServer) exitWith {};
#include "extraMissionDefines.sqf";

private ["_box1", "_uav"];

_setupVars = {
	_missionType = "Reaper Disabled";
	_locationsArray = [ForestMissionMarkers, MissionSpawnMarkers] select (ForestMissionMarkers isEqualTo []);
};
	
_setupObjects = {
	_missionPos = markerPos _missionLocation;
	_baseToDelete = nearestObjects [_missionPos, ["All"], 25];
	{ deleteVehicle _x } forEach _baseToDelete; 
	
	_randomCase = ["Box_FIA_Support_F","Box_FIA_Wps_F","Box_FIA_Ammo_F"] call BIS_fnc_selectRandom;
	
	_uav = createVehicle ["CUP_B_USMC_DYN_MQ9", _missionPos, [], 3, "None"];
	_uav allowDamage false;
	_uav setDir random 360;
	_uav setVariable ["R3F_LOG_disabled", false];
	
	_box1 = createVehicle [_randomCase, _missionPos, [], 5, "None"];
	_box1 setDir random 360;
	_box1 addItemCargoGlobal ["B_UavTerminal", 1];
	[_box1, selectRandom missionBoxArray] call fn_refillbox;
	
	{ _x setVariable ["R3F_LOG_disabled", true, true] } forEach [_box1];

	_aiGroup = createGroup CIVILIAN;
	[_aiGroup,_missionPos] spawn createCustomGroupAirSpetsnaz;

	_aiGroup setCombatMode "RED";
	_aiGroup setBehaviour "COMBAT";
	
	_missionHintText = format ["<br/>A <t color='%1'>MQ-9 Reaper</t> has crashed some where.. it seems to be heavily guarded by Spetsnaz", extraMissionColor];
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec = {
	// Mission failed
	{ deleteVehicle _x } forEach [_box1, _uav];
};

_successExec = {
	// Mission completed
	_successHintMessage = format ["The MQ-9 Reaper site has been secured."];
	_uav allowDamage true;
	{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach [_box1];
	// { deleteVehicle _x } forEach [_uav];
};

_this call extraMissionProcessor;