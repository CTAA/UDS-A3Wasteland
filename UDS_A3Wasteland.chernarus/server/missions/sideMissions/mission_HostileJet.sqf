// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_HostileUAV.sqf
//	@file Author: JoSchaap, AgentRev, AryX

if (!isServer) exitWith {};
#include "sideMissionDefines.sqf"

private ["_vehicleClass", "_vehicle", "_createVehicle", "_vehicles", "_leader", "_speedMode", "_waypoint", "_vehicleName", "_numWaypoints", "_box1", "_box2"];

_setupVars =
{
	_missionType = "Hostile Jet";
	_locationsArray = nil; // locations are generated on the fly from towns
};

_setupObjects =
{
	_missionPos = markerPos (((call cityList) call BIS_fnc_selectRandom) select 0);

	_vehicleClass = if (missionDifficultyHard) then
	{
		selectRandom [["CUP_B_A10_DYN_USA","A10aWarthog"],["CUP_B_F35B_BAF","F35bCAS"],["CUP_B_GR9_DYN_GB","GR9Extra"],["CUP_B_Su25_Dyn_CDF","Su25AT"],["CUP_B_AV8B_DYN_USMC","Av8bAA"],"CUP_I_L39_AAF"];
	}
	else
	{
		selectRandom ["CUP_B_A10_DYN_USA","A10aHeavy"],
		["CUP_B_AV8B_DYN_USMC","AV8BCAS"],
		["CUP_B_F35B_BAF","F35BCAS"],
		["CUP_B_JAS39_HIL","A149CAS"],
		["CUP_B_L39_CZ","L39CAS"],
		["CUP_B_Su25_Dyn_CDF","SU25CAS"],
		["CUP_B_SU34_CDF"];
	};

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

		// Spawns pilot for vehicle
		_soldier = [_aiGroup, _position] call createRandomPilot;
		_soldier moveInDriver _vehicle;

		// Removing flares
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

	// _vehicle = [_vehicleClass, _missionPos, 0] call _createVehicle;
	_directionToFly = random 360;
	_vehicle = [_vehicleClass, ([_missionPos,100,0] call BIS_fnc_relPos), _directionToFly] call _createVehicle;

	_leader = effectiveCommander _vehicle;
	_aiGroup selectLeader _leader;

	_aiGroup setCombatMode "RED"; // Defensive behaviour
	_aiGroup setBehaviour "COMBAT";
	_aiGroup setFormation "STAG COLUMN";

	_speedMode = if (missionDifficultyHard) then { "NORMAL" } else { "LIMITED" };

	_aiGroup setSpeedMode _speedMode;

	// behaviour on waypoints
	{
		_waypoint = _aiGroup addWaypoint [markerPos (_x select 0), 0];
		_waypoint setWaypointType "MOVE";
		_waypoint setWaypointCompletionRadius 50;
		_waypoint setWaypointCombatMode "RED";
		_waypoint setWaypointBehaviour "COMBAT";
		_waypoint setWaypointFormation "STAG COLUMN";
		_waypoint setWaypointSpeed _speedMode;
	} forEach ((call cityList) call BIS_fnc_arrayShuffle);

	_missionPos = getPosATL leader _aiGroup;

	_missionPicture = getText (configFile >> "CfgVehicles" >> (_vehicleClass param [0,""]) >> "picture");
	_vehicleName = getText (configFile >> "CfgVehicles" >> (_vehicleClass param [0,""]) >> "displayName");

	_missionHintText = format ["A <t color='%2'>%1</t> is patrolling the island. Intercept it and recover its high value cargo!", _vehicleName, sideMissionColor];

	_numWaypoints = count waypoints _aiGroup;
};

_waitUntilMarkerPos = {getPosATL _leader};
_waitUntilExec = nil;
_waitUntilCondition = {currentWaypoint _aiGroup >= _numWaypoints};

_failedExec = nil;

// _vehicle is automatically deleted or unlocked in missionProcessor depending on the outcome

_successExec =
{	
	// wait until heli is down to spawn crates
	_vehicle spawn
	{
		_veh = _this;

		waitUntil
		{
			sleep 0.1;
			_pos = getPos _veh;
			(isTouchingGround _veh || _pos select 2 < 5) && {vectorMagnitude velocity _veh < [1,5] select surfaceIsWater _pos}
		};
		
		_box1 = createVehicle ["Box_East_WpsSpecial_F", (getPosATL _veh) vectorAdd ([[_veh call fn_vehSafeDistance, 0, 0], random 360] call BIS_fnc_rotateVector2D), [], 5, "None"];
		//_box1 = createVehicle ["Box_East_WpsSpecial_F", _lastPos, [], 5, "None"];
		_box1 setDir random 360;
		[_box1, selectRandom missionBoxArray] call fn_refillbox;

		_box2 = createVehicle ["Box_East_WpsLaunch_F", (getPosATL _veh) vectorAdd ([[_veh call fn_vehSafeDistance, 0, 0], random 360] call BIS_fnc_rotateVector2D), [], 5, "None"];
		//_box2 = createVehicle ["Box_East_WpsLaunch_F", _lastPos, [], 5, "None"];
		_box2 setDir random 360;
		[_box2, selectRandom missionBoxArray] call fn_refillbox;
	};

	_successHintMessage = "The sky is clear again, the enemy jet was taken out! Ammo crates have fallen near the wreck.";
};

_this call sideMissionProcessor;
