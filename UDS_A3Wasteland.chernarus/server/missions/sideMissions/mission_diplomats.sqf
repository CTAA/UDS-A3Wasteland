// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_Smugglers.sqf
//	@file Author: JoSchaap, AgentRev, LouD

if (!isServer) exitWith {};
#include "sideMissionDefines.sqf";

private ["_positions", "_smugglerVeh", "_vehicle1", "_vehicle2", "_boxes1", "_currBox1", "_randomBox", "_box1", "_boxes2", "_currBox2", "_box2", "_cashrandomizera", "_cashamountrandomizera", "_cashpilerandomizera", "_casha", "_cashamounta", "_cashpilea", "_cashrandomizerb", "_cashamountrandomizerb", "_cashpilerandomizerb", "_cashb", "_cashamountb", "_cashpileb", "_cash1", "_cash2", "_drop_item", "_drugpilerandomizer", "_drugpile"];

_setupVars =
{
	_missionType = "EU diplomats";
	_locationsArray = MissionSpawnMarkers;
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;
	_smugglerVeh = ["CUP_O_BRDM2_TKA","CUP_O_BRDM2_TKA","CUP_O_BRDM2_TKA"] call BIS_fnc_selectRandom; 

	_vehicle1 = [_smugglerVeh,[(_missionPos select 0) - 5, (_missionPos select 1) + 10,0],0.5,1,0,"NONE"] call createMissionVehicle;
	_vehicle1 setVariable [call vChecksum, true, false];
	_vehicle1 setFuel 1;
	_vehicle1 setVehicleLock "UNLOCKED";
	_vehicle1 setVariable ["R3F_LOG_disabled", false, true];
	
	_vehicle2 = [_smugglerVeh,[(_missionPos select 0) - 5, (_missionPos select 1) - 10,0],0.5,1,0,"NONE"] call createMissionVehicle;
	_vehicle2 setVariable [call vChecksum, true, false];
	_vehicle2 setFuel 1;
	_vehicle2 setVehicleLock "UNLOCKED";
	_vehicle2 setVariable ["R3F_LOG_disabled", false, true];
	
	_boxes1 = ["Box_FIA_Support_F","Box_FIA_Wps_F","Box_FIA_Ammo_F"];
	_currBox1 = _boxes1 call BIS_fnc_selectRandom;
	_box1 = createVehicle [_currBox1,[(_missionPos select 0), (_missionPos select 1),0],[], 0, "NONE"];
	[_box1, selectRandom missionBoxArray] call fn_refillbox;
	
	_boxes2 = ["Box_FIA_Support_F","Box_FIA_Wps_F","Box_FIA_Ammo_F"];
	_currBox2 = _boxes2 call BIS_fnc_selectRandom;
	_box2 = createVehicle [_currBox2,[(_missionPos select 0) - 5, (_missionPos select 1) - 8,0],[], 0, "NONE"];
	_box2 allowDamage false;
	_box2 setVariable ["R3F_LOG_disabled", true, true];
	
	_aiGroup = createGroup CIVILIAN;
	[_aiGroup,_missionPos] spawn createsmugglerGroup;

	_aiGroup setCombatMode "RED";
	_aiGroup setBehaviour "COMBAT";
	
	_missionPicture = getText (configFile >> "CfgVehicles" >> _smugglerVeh >> "picture");
	
	_missionHintText = format ["A number of EU diplomats have entered Chernarus illegaly. Take them out.", sideMissionColor];
};
	
_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec =
{
	// Mission failed
	{ deleteVehicle _x } forEach [_box1, _box2, _vehicle1, _vehicle2];
};

_drop_item = 
{
	private["_item", "_pos"];
	_item = _this select 0;
	_pos = _this select 1;

	if (isNil "_item" || {typeName _item != typeName [] || {count(_item) != 2}}) exitWith {};
	if (isNil "_pos" || {typeName _pos != typeName [] || {count(_pos) != 3}}) exitWith {};

	private["_id", "_class"];
	_id = _item select 0;
	_class = _item select 1;

	private["_obj"];
	_obj = createVehicle [_class, _pos, [], 5, "None"];
	_obj setPos ([_pos, [[2 + random 3,0,0], random 360] call BIS_fnc_rotateVector2D] call BIS_fnc_vectorAdd);
	_obj setVariable ["mf_item_id", _id, true];
};

_successExec =
{
	// Mission completed
	{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach [_box1, _box2];
	{ _x setVariable ["A3W_missionVehicle", true] } forEach [_vehicle1, _vehicle2];
	
	//Random fake - real money
	//_cashrandomizera = ["money","cmoney"];
	_cashamountrandomizera = [2500,5000,10000,15000,20000,25000,30000,35000];
	_cashpilerandomizera = [3,5];
		
	//_casha = _cashrandomizera call BIS_fnc_SelectRandom;
	_cashamounta = _cashamountrandomizera call BIS_fnc_SelectRandom;
	_cashpilea = _cashpilerandomizera call BIS_fnc_SelectRandom;
	
	for "_i" from 1 to _cashpilea do
	{
		_cash1 = createVehicle ["Land_Money_F",[(_lastPos select 0), (_lastPos select 1) - 5,0],[], 0, "NONE"];
		_cash1 setPos ([_lastPos, [[2 + random 3,0,0], random 360] call BIS_fnc_rotateVector2D] call BIS_fnc_vectorAdd);
		_cash1 setDir random 360;
		//_cash1 setVariable [_casha, _cashamounta, true];
		_cash1 setVariable ["cmoney", _cashamounta, true];
		_cash1 setVariable ["owner", "world", true];
	};
	
	_cashrandomizerb = ["money","cmoney","money","cmoney"];
	_cashamountrandomizerb = [2500,5000,10000,15000,20000,25000,30000,35000];
	_cashpilerandomizerb = [3,5];
		
	_cashb = _cashrandomizerb call BIS_fnc_SelectRandom;
	_cashamountb = _cashamountrandomizerb call BIS_fnc_SelectRandom;
	_cashpileb = _cashpilerandomizerb call BIS_fnc_SelectRandom;
	
	for "_i" from 1 to _cashpileb do
	{
		_cash2 = createVehicle ["Land_Money_F",[(_lastPos select 0), (_lastPos select 1) - 5,0],[], 0, "NONE"];
		_cash2 setPos ([_lastPos, [[2 + random 3,0,0], random 360] call BIS_fnc_rotateVector2D] call BIS_fnc_vectorAdd);
		_cash2 setDir random 360;
		_cash2 setVariable [_cashb, _cashamountb, true];
		_cash2 setVariable ["owner", "world", true];
	};
	
	_drugpilerandomizer = [4,8];
	_drugpile = _drugpilerandomizer call BIS_fnc_SelectRandom;
	
	for "_i" from 1 to _drugpile do 
	{
	  private["_item"];
	  _item = [
	          ["lsd", "Land_WaterPurificationTablets_F"],
	          ["marijuana", "Land_VitaminBottle_F"],
	          ["cocaine","Land_PowderedMilk_F"],
	          ["heroin", "Land_PainKillers_F"]
	        ] call BIS_fnc_selectRandom;
	  [_item, _lastPos] call _drop_item;
	};
	
	_successHintMessage = format ["The EU diplomats and their bodyguards have been eliminated."];
};

_this call sideMissionProcessor;
