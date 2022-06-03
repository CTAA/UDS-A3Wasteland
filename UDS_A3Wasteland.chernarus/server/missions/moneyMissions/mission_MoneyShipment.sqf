// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 2.1
//	@file Name: mission_MoneyShipment.sqf
//	@file Author: JoSchaap / routes by Del1te - (original idea by Sanjo), AgentRev
//	@file Created: 31/08/2013 18:19

if (!isServer) exitWith {};
#include "moneyMissionDefines.sqf";

private ["_MoneyShipment", "_moneyAmount", "_convoys", "_vehChoices", "_moneyText", "_vehClasses", "_createVehicle", "_vehicles", "_veh2", "_leader", "_speedMode", "_waypoint", "_vehicleName", "_numWaypoints", "_cash"];

_setupVars =
{
	_locationsArray = LandConvoyPaths;

	// Money Shipments settings
	// Difficulties : Min = 1, Max = infinite
	// Convoys per difficulty : Min = 1, Max = infinite
	// Vehicles per convoy : Min = 1, Max = infinite
	// Choices per vehicle : Min = 1, Max = infinite
	_MoneyShipment = selectRandom
	[
		// Easy
		[
			"Small Money Shipment", // Marker text
			25000, // Money
			[
				[ // NATO convoy
					["CUP_B_BAF_Coyote_L2A1_D", "CUP_B_BAF_Coyote_GMG_D", "CUP_B_M163_USA"], // Veh 1
					["CUP_B_BAF_Coyote_L2A1_D", "CUP_B_BAF_Coyote_GMG_D"] // Veh 2
				],
				[ // CSAT convoy
					["CUP_B_BAF_Coyote_L2A1_D", "CUP_B_BAF_Coyote_GMG_D", "CUP_B_M163_USA"], // Veh 1
					["CUP_B_BAF_Coyote_L2A1_D", "CUP_B_BAF_Coyote_GMG_D"] // Veh 2
				],
				[ // AAF convoy
					["CUP_B_M1135_ATGMV_Woodland", "CUP_B_BAF_Coyote_GMG_D", "CUP_B_M163_USA"], // Veh 1
					["CUP_B_BAF_Coyote_L2A1_D", "CUP_B_M163_USA", "CUP_B_M1135_ATGMV_Woodland"] // Veh 2
				]
			]
		],
		// Medium
		[
			"Medium Money Shipment", // Marker text
			50000, // Money
			[
				[ // NATO convoy
					["CUP_B_BAF_Coyote_L2A1_D", "CUP_B_BAF_Coyote_GMG_D"], // Veh 1
					["CUP_B_LAV25_green", "CUP_B_M1126_ICV_M2_Woodland_Slat", "CUP_B_M163_USA"], // Veh 2
					["CUP_B_BAF_Coyote_L2A1_D", "CUP_B_BAF_Coyote_GMG_D"] // Veh 3
				],
				[ // CSAT convoy
					["CUP_B_BAF_Coyote_L2A1_D", "CUP_B_BAF_Coyote_GMG_D"], // Veh 1
					["CUP_B_LAV25_green", "CUP_B_M1126_ICV_M2_Woodland_Slat", "CUP_B_M163_USA"], // Veh 2
					["CUP_B_BAF_Coyote_L2A1_D", "CUP_B_BAF_Coyote_GMG_D"] // Veh 3
				],
				[ // AAF convoy
					["CUP_B_BAF_Coyote_L2A1_D", "CUP_B_BAF_Coyote_GMG_D", "CUP_B_M1128_MGS_Woodland"], // Veh 1
					["CUP_B_LAV25_green", "CUP_B_M1126_ICV_M2_Woodland_Slat"], // Veh 2
					["CUP_B_BAF_Coyote_L2A1_D", "CUP_B_BAF_Coyote_GMG_D", "CUP_B_M1135_ATGMV_Woodland"] // Veh 3
				]
			]
		],
		// Hard
		[
			"Large Money Shipment", // Marker text
			75000, // Money
			[
				[ // NATO convoy
					["CUP_B_LAV25_green", "CUP_B_M1126_ICV_M2_Woodland_Slat", "CUP_B_M163_USA"], // Veh 1
					["B_MBT_01_cannon_F", "CUP_O_T90_RU", "CUP_B_M163_USA"], // Veh 2
					["CUP_B_LAV25_green", "CUP_B_M1126_ICV_M2_Woodland_Slat", "CUP_B_M163_USA"] // Veh 3
				],
				[ // CSAT convoy
					["CUP_B_LAV25_green", "CUP_B_M1126_ICV_M2_Woodland_Slat", "CUP_B_M163_USA"], // Veh 1
					["CUP_B_Challenger2_Woodland_BAF", "O_MBT_04_cannon_F"], // Veh 2
					["CUP_B_LAV25_green", "CUP_B_M1126_ICV_M2_Woodland_Slat", "CUP_B_M163_USA"] // Veh 3
				],
				[ // AAF convoy
					["CUP_B_LAV25_green", "CUP_B_M1126_ICV_M2_Woodland_Slat"], // Veh 1
					["CUP_B_M1A2_TUSK_MG_USMC", "CUP_B_M163_USA"], // Veh 2
					["CUP_B_LAV25_green", "CUP_B_M1126_ICV_M2_Woodland_Slat"] // Veh 3
				]
			]
		],
		// Extreme
		[
			"Heavy Money Shipment", // Marker text
			100000, // Money
			[
				[ // NATO convoy
					["CUP_B_LAV25_green", "CUP_B_M1126_ICV_M2_Woodland_Slat", "CUP_B_M163_USA", "B_MBT_01_cannon_F", "CUP_O_T90_RU"], // Veh 1
					["CUP_B_M163_USA", "B_MBT_01_cannon_F", "CUP_O_T90_RU"], // Veh 2
					["CUP_B_LAV25_green", "CUP_B_M1126_ICV_M2_Woodland_Slat", "CUP_B_M163_USA", "B_MBT_01_cannon_F", "CUP_O_T90_RU"], // Veh 3
					["CUP_B_M163_USA", "CUP_B_M1126_ICV_M2_Woodland_Slat", "CUP_B_M163_USA"], // Veh 4
					["CUP_B_LAV25_green", "CUP_B_M1126_ICV_M2_Woodland_Slat", "CUP_B_M163_USA", "B_MBT_01_cannon_F", "CUP_O_T90_RU"] // Veh 5
				],
				[ // CSAT convoy
					["O_APC_Wheeled_02_rcws_F", "CUP_B_M1126_ICV_M2_Woodland_Slat", "CUP_B_M163_USA", "CUP_B_Challenger2_Woodland_BAF"], // Veh 1
					["CUP_B_M163_USA", "CUP_B_Challenger2_Woodland_BAF"], // Veh 2
					["O_APC_Wheeled_02_rcws_F", "CUP_B_M1126_ICV_M2_Woodland_Slat", "CUP_B_M163_USA", "CUP_B_Challenger2_Woodland_BAF"], // Veh 3
					["CUP_B_M163_USA", "CUP_B_M1126_ICV_M2_Woodland_Slat", "CUP_B_M163_USA"], // Veh 4
					["O_APC_Wheeled_02_rcws_F", "CUP_B_M1126_ICV_M2_Woodland_Slat", "CUP_B_M163_USA", "CUP_B_Challenger2_Woodland_BAF"] // Veh 5
				],
				[ // AAF convoy
					["CUP_B_LAV25_green", "CUP_B_M1126_ICV_M2_Woodland_Slat", "CUP_B_M1A2_TUSK_MG_USMC"], // Veh 1
					["CUP_B_M1126_ICV_M2_Woodland_Slat", "CUP_B_M1A2_TUSK_MG_USMC"], // Veh 2
					["CUP_B_LAV25_green", "CUP_B_M1126_ICV_M2_Woodland_Slat", "CUP_B_M1A2_TUSK_MG_USMC"], // Veh 3
					["CUP_B_LAV25_green", "CUP_B_M1126_ICV_M2_Woodland_Slat", "CUP_B_M1A2_TUSK_MG_USMC"], // Veh 4
					["CUP_B_M163_USA", "CUP_B_M1126_ICV_M2_Woodland_Slat", "CUP_B_M163_USA"], // Veh 4
					["CUP_B_LAV25_green", "CUP_B_M1126_ICV_M2_Woodland_Slat", "CUP_B_M1A2_TUSK_MG_USMC"] // Veh 5
				]
			]
		]
	];

	_missionType = _MoneyShipment select 0;
	_moneyAmount = _MoneyShipment select 1;
	_convoys = _MoneyShipment select 2;
	_vehChoices = selectRandom _convoys;

	_moneyText = format ["$%1", [_moneyAmount] call fn_numbersText];

	_vehClasses = [];
	{ _vehClasses pushBack selectRandom _x } forEach _vehChoices;
};

_setupObjects =
{
	private ["_starts", "_startDirs", "_waypoints"];
	call compile preprocessFileLineNumbers format ["mapConfig\convoys\%1.sqf", _missionLocation];
	
	diag_log format["Error Logger: MoneyShip %1",_missionLocation];

	_createVehicle =
	{
		private ["_type", "_position", "_direction", "_vehicle", "_soldier"];

		_type = _this select 0;
		_position = _this select 1;
		_direction = _this select 2;

		_vehicle = createVehicle [_type, _position, [], 0, "None"];
		_vehicle setVariable ["R3F_LOG_disabled", true, true];
		_vehicle setVariable ["A3W_skipAutoSave", true, true];
		[_vehicle] call vehicleSetup;
		
		// apply tropical textures to vehicles on Tanoa
		if (worldName == "Tanoa" && _type select [1,3] != "_T_") then
		{
			switch (toUpper (_type select [0,2])) do
			{
				case "B_": { [_vehicle, ["Olive"]] call applyVehicleTexture };
				case "O_": { [_vehicle, ["GreenHex"]] call applyVehicleTexture };
			};
		};

		_vehicle setDir _direction;
		_aiGroup addVehicle _vehicle;

		_soldier = [_aiGroup, _position] call createRandomSoldier;
		_soldier moveInDriver _vehicle;

		if !(_type isKindOf "LT_01_base_F") then
		{
			_soldier = [_aiGroup, _position] call createRandomSoldier;
			_soldier moveInCargo [_vehicle, 0];
		};

		if !(_type isKindOf "Truck_F") then
		{
			_soldier = [_aiGroup, _position] call createRandomSoldier;
			_soldier moveInGunner _vehicle;
			if (_type isKindOf "LT_01_base_F") exitWith {};

			_soldier = [_aiGroup, _position] call createRandomSoldier;

			if (_vehicle emptyPositions "commander" > 0) then
			{
				_soldier moveInCommander _vehicle;
			}
			else
			{
				_soldier moveInCargo [_vehicle, 1];
			};
		};

		[_vehicle, _aiGroup] spawn checkMissionVehicleLock;

		_vehicle
	};

	_aiGroup = createGroup CIVILIAN;

	_vehicles = [];
	{
		// _vehicles pushBack ([_x, _starts select (_forEachIndex max 0 min (count _starts - 1)), _startdirs select (_forEachIndex max 0 min (count _startdirs - 1)), _aiGroup] call _createVehicle);
		_vehicles pushBack ([_x, _starts select 0, _startdirs select 0, _aiGroup] call _createVehicle);
	} forEach _vehClasses;

	_veh2 = _vehClasses select (1 min (count _vehClasses - 1));

	_leader = effectiveCommander (_vehicles select 0);
	_aiGroup selectLeader _leader;

	_aiGroup setCombatMode "YELLOW"; // units will defend themselves
	_aiGroup setBehaviour "SAFE"; // units feel safe until they spot an enemy or get into contact
	_aiGroup setFormation "STAG COLUMN";

	_speedMode = if (missionDifficultyHard) then { "NORMAL" } else { "LIMITED" };

	_aiGroup setSpeedMode _speedMode;

	{
		_waypoint = _aiGroup addWaypoint [_x, 0];
		_waypoint setWaypointType "MOVE";
		_waypoint setWaypointCompletionRadius 25;
		_waypoint setWaypointCombatMode "YELLOW";
		_waypoint setWaypointBehaviour "SAFE"; // safe is the best behaviour to make AI follow roads, as soon as they spot an enemy or go into combat they WILL leave the road for cover though!
		_waypoint setWaypointFormation "STAG COLUMN";
		_waypoint setWaypointSpeed _speedMode;
	} forEach _waypoints;

	_missionPos = getPosATL leader _aiGroup;

	_missionPicture = getText (configFile >> "CfgVehicles" >> _veh2 >> "picture");
	_vehicleName = getText (configFile >> "cfgVehicles" >> _veh2 >> "displayName");

	_missionHintText = format ["A convoy transporting <t color='%1'>%2</t> escorted by a <t color='%1'>%3</t> is en route to an unknown location.<br/>Stop them!", moneyMissionColor, _moneyText, _vehicleName];

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

	for "_i" from 1 to 10 do
	{
		_cash = createVehicle ["Land_Money_F", _lastPos, [], 5, "None"];
		_cash setPos ([_lastPos, [[2 + random 3,0,0], random 360] call BIS_fnc_rotateVector2D] call BIS_fnc_vectorAdd);
		_cash setDir random 360;
		_cash setVariable ["cmoney", _moneyAmount / 10, true];
		_cash setVariable ["owner", "world", true];
	};

	_successHintMessage = "The convoy has been stopped, the money and vehicles are now yours to take.";
};

_this call moneyMissionProcessor;
