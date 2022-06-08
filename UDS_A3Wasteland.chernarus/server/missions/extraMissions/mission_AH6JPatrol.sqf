// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2019 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_Pawnee.sqf
//	@file Author: AryX
//	@file Version: 0.1
//	@file Description: Pawnee Extra-Mission

if (!isServer) exitWith {};
#include "extraMissionDefines.sqf"

private ["_heliChoices", "_convoyVeh", "_veh1", "_veh2", "_veh3", "_createVehicle", "_vehicles", "_leader", "_speedMode", "_waypoint", "_vehicleName", "_numWaypoints", "_box1", "_box2", "_randomBox1", "_randomBox2"];

_setupVars =
{
	_missionType = "AH-6X patrol";
	_locationsArray = nil; // locations are generated on the fly from towns
};

_setupObjects =
{
	_missionPos = markerPos (((call cityList) call BIS_fnc_selectRandom) select 0);

	_heliChoices =
	[
		["CUP_B_AH6J_USA", "CUP_B_AH6J_USA"],
		["CUP_B_AH6J_USA", "CUP_B_AH6J_USA"],
		["CUP_B_AH6J_USA", "CUP_B_AH6J_USA"]
	];

	if (missionDifficultyHard) then
	{
		(_heliChoices select 0) set [0, "CUP_B_AH6J_USA"];
		(_heliChoices select 1) set [0, "CUP_B_AH6J_USA"];
		(_heliChoices select 2) set [0, "CUP_B_AH6J_USA"];
	};

	_convoyVeh = _heliChoices call BIS_fnc_selectRandom;

	_veh1 = _convoyVeh select 0;
	_veh2 = _convoyVeh select 1;
	_veh3 = _convoyVeh select 1;

	_createVehicle =
	{
		private ["_type", "_position", "_direction", "_vehicle", "_soldier"];

		_type = _this select 0;
		_position = _this select 1;
		_direction = _this select 2;

		_vehicle = createVehicle [_type, _position, [], 0, "FLY"];
		_vehicle setVariable ["R3F_LOG_disabled", true, true];
		[_vehicle] call vehicleSetup;

		_vehicle setDir _direction;
		_aiGroup addVehicle _vehicle;

		// add a driver/pilot/captain to the vehicle
		// the little bird, orca, and hellcat do not require gunners and should not have any passengers
		_soldier = [_aiGroup, _position] call createRandomSoldierC;
		_soldier moveInDriver _vehicle;

		// remove flares because it overpowers AI choppers
		if (_type isKindOf "Air") then
		{
			{
				if (["CMFlare", _x] call fn_findString != -1) then
				{
					_vehicle removeMagazinesTurret [_x, [-1]];
				};
			} forEach getArray (configFile >> "CfgVehicles" >> _type >> "magazines");
		};

		[_vehicle, _aiGroup] spawn checkMissionVehicleLock;
		_vehicle
	};

	_aiGroup = createGroup CIVILIAN;

	_vehicles =
	[
		[_veh1, _missionPos vectorAdd ([[random 50, 0, 0], random 360] call BIS_fnc_rotateVector2D), 0] call _createVehicle,
		[_veh2, _missionPos vectorAdd ([[random 50, 0, 0], random 360] call BIS_fnc_rotateVector2D), 0] call _createVehicle,
		[_veh3, _missionPos vectorAdd ([[random 50, 0, 0], random 360] call BIS_fnc_rotateVector2D), 0] call _createVehicle
	];

	_leader = effectiveCommander (_vehicles select 0);
	_aiGroup selectLeader _leader;

	_aiGroup setCombatMode "GREEN"; // units will defend themselves
	_aiGroup setBehaviour "SAFE"; // units feel safe until they spot an enemy or get into contact
	_aiGroup setFormation "VEE";

	_speedMode = if (missionDifficultyHard) then { "NORMAL" } else { "LIMITED" };

	_aiGroup setSpeedMode _speedMode;

	// behaviour on waypoints
	{
		_waypoint = _aiGroup addWaypoint [markerPos (_x select 0), 0];
		_waypoint setWaypointType "MOVE";
		_waypoint setWaypointCompletionRadius 50;
		_waypoint setWaypointCombatMode "GREEN";
		_waypoint setWaypointBehaviour "SAFE";
		_waypoint setWaypointFormation "VEE";
		_waypoint setWaypointSpeed _speedMode;
	} forEach ((call cityList) call BIS_fnc_arrayShuffle);

	_missionPos = getPosATL leader _aiGroup;

	_missionPicture = getText (configFile >> "CfgVehicles" >> _veh1 >> "picture");
	_vehicleName = getText (configFile >> "CfgVehicles" >> _veh1 >> "displayName");
	
	_missionHintText = format ["There is a <t color='%2'>%1</t> formation. Intercept them and take them out.", _vehicleName, extraMissionColor];

	_numWaypoints = count waypoints _aiGroup;
};

_waitUntilMarkerPos = {getPosATL _leader};
_waitUntilExec = nil;
_waitUntilCondition = {currentWaypoint _aiGroup >= _numWaypoints};

_failedExec = nil;

// _vehicles are automatically deleted or unlocked in missionProcessor depending on the outcome

_successExec =
{
	// Mission completed
	_randomBox1 = ["mission_launchers1","mission_launchers2"] call BIS_fnc_selectRandom;

	_box1 = createVehicle ["Box_T_East_Wps_F", _lastPos, [], 5, "None"];
	_box1 setDir random 360;
	[_box1, _randomBox1] call fn_refillbox;

	_randomBox2 = ["mission_rifles1","mission_rifles2","mission_rifles3","mission_rifles4","mission_rifles5","mission_rifles6"] call BIS_fnc_selectRandom;

	_box2 = createVehicle ["Box_EAF_Support_F", _lastPos, [], 5, "None"];
	_box2 setDir random 360;
	[_box2, _randomBox2] call fn_refillbox;

	_successHintMessage = "The AH-6X patrol has been taken out.";
};

_this call extraMissionProcessor;