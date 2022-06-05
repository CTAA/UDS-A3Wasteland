// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_HostileHeliFormation.sqf
//	@file Author: JoSchaap, AgentRev

if (!isServer) exitWith {};
#include "mainMissionDefines.sqf"

private ["_heliChoices", "_convoyVeh", "_veh1", "_veh2", "_veh3", "_createVehicle", "_vehicles", "_leader", "_speedMode", "_waypoint", "_vehicleName", "_vehicleName2", "_numWaypoints", "_box1", "_box2"];

_setupVars =
{
	_missionType = "Hostile Helicopter Formation";
	_locationsArray = nil; // locations are generated on the fly from towns
};

_setupObjects =
{
	_missionPos = markerPos (((call cityList) call BIS_fnc_selectRandom) select 0);

	_heliChoices =
	[
		["CUP_O_Mi24_Mk4_CSAT_T","CUP_O_Mi24_Mk3_CSAT_T","CUP_O_Mi24_Mk3_CSAT_T"],
		["CUP_O_Ka52_RU","CUP_O_Ka50_DL_RU","CUP_O_Ka50_DL_RU"],
		["CUP_B_AH64D_DL_USA","CUP_B_AH1Z_Dynamic_USMC","CUP_B_AH1Z_Dynamic_USMC"]
	];

	_convoyVeh = _heliChoices call BIS_fnc_selectRandom;

	_veh1 = _convoyVeh select 0;
	_veh2 = _convoyVeh select 1;
	_veh3 = _convoyVeh select 1;

	_createVehicle =
	{
		private ["_type", "_position", "_direction", "_variant", "_vehicle", "_soldier"];

		_type = _this select 0;
		_position = _this select 1;
		_direction = _this select 2;
		_variant = _type param [1,"",[""]];

		if (_type isEqualType []) then
		{
			_type = _type select 0;
		};

		_vehicle = createVehicle [_type, _position, [], 0, "FLY"];
		_vehicle setVariable ["R3F_LOG_disabled", true, true];
		
		if (_variant != "") then
		{
			_vehicle setVariable ["A3W_vehicleVariant", _variant, true];
		};

		[_vehicle] call vehicleSetup;

		_vehicle setDir _direction;
		_aiGroup addVehicle _vehicle;

		// add a driver/pilot/captain to the vehicle
		// the little bird, orca, and hellcat do not require gunners and should not have any passengers
		_soldier = [_aiGroup, _position] call createRandomSoldierC;
		_soldier moveInDriver _vehicle;

		switch (true) do
		{
			case (_type isKindOf "CUP_O_Mi24_Mk4_CSAT_T" || _type isKindOf "CUP_O_Mi24_Mk3_CSAT_T" || _type isKindOf "CUP_O_Ka52_RU" || _type isKindOf "CUP_B_AH1Z_Dynamic_USMC" || _type isKindOf "CUP_B_AH64D_DL_USA"):
			{
				// these choppers need 1 gunner
				_soldier = [_aiGroup, _position] call createRandomSoldierC;
				_soldier moveInGunner _vehicle;
			};
		};

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
	
	/* _directionToFly = random 360;
	_vehicles =
	[
		[_veh1, ([_missionPos,100,0] call BIS_fnc_relPos), _directionToFly ] call _createVehicle,
		[_veh2, ([_missionPos,100,120] call BIS_fnc_relPos), _directionToFly ] call _createVehicle,
		[_veh3, ([_missionPos,100,240] call BIS_fnc_relPos), _directionToFly ] call _createVehicle
	];*/ //New Version test Jet before

	_leader = effectiveCommander (_vehicles select 0);
	_aiGroup selectLeader _leader;

	_aiGroup setCombatMode "RED"; // units will defend themselves
	_aiGroup setBehaviour "COMBAT"; // units feel safe until they spot an enemy or get into contact
	_aiGroup setFormation "VEE";

	_speedMode = if (missionDifficultyHard) then { "NORMAL" } else { "LIMITED" };

	_aiGroup setSpeedMode _speedMode;

	// behaviour on waypoints
	{
		_waypoint = _aiGroup addWaypoint [markerPos (_x select 0), 0];
		_waypoint setWaypointType "MOVE";
		_waypoint setWaypointCompletionRadius 50;
		_waypoint setWaypointCombatMode "YELLOW";
		_waypoint setWaypointBehaviour "SAFE";
		_waypoint setWaypointFormation "VEE";
		_waypoint setWaypointSpeed _speedMode;
	} forEach ((call cityList) call BIS_fnc_arrayShuffle);

	_missionPos = getPosATL leader _aiGroup;

	_missionPicture = getText (configFile >> "CfgVehicles" >> (_veh1 param [0,""]) >> "picture");
	_vehicleName = getText (configFile >> "CfgVehicles" >> (_veh1 param [0,""]) >> "displayName");
	_vehicleName2 = getText (configFile >> "CfgVehicles" >> (_veh2 param [0,""]) >> "displayName");

	_missionHintText = format ["A formation of armed helicopters containing a <t color='%3'>%1</t> and two <t color='%3'>%2</t> are patrolling the island.", _vehicleName, _vehicleName2, mainMissionColor];

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

	_box1 = createVehicle ["Box_EAF_Support_F", _lastPos, [], 5, "None"];
	_box1 setDir random 360;
	[_box1, "mission_Weapon3"] call fn_refillbox;
	
	private _smoke1 = "SmokeShellBlue" createVehicle getPos _box1;
	_smoke1 attachto [_box1,[0,0,-0.5]];
	private _flare1 = "F_40mm_Green" createVehicle getPos _box1;
	_flare1 attachto [_box1,[0,0,-0.5]];

	_box2 = createVehicle ["Box_EAF_WpsLaunch_F", _lastPos, [], 5, "None"];
	_box2 setDir random 360;
	[_box2, "mission_Launchers3"] call fn_refillbox;
	
	private _smoke2 = "SmokeShellBlue" createVehicle getPos _box2;
	_smoke2 attachto [_box2,[0,0,-0.5]];
	private _flare2 = "F_40mm_Green" createVehicle getPos _box2;
	_flare2 attachto [_box2,[0,0,-0.5]];

	_successHintMessage = "The sky is clear again, the enemy patrol was taken out. Ammo crates have fallen near the wreck.";
};

_this call mainMissionProcessor;
