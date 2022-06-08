// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: customGroup.sqf
//	@file Author: AgentRev

if (!isServer) exitWith {};

private ["_group", "_pos", "_nbUnits", "_unitTypes", "_uPos", "_unit"];

_group = _this select 0;
_pos = _this select 1;
_nbUnits = param [2, 7, [0]];
_radius = param [3, 10, [0]];

_unitTypes =
[
	"C_man_polo_1_F", "C_man_polo_1_F_euro", "C_man_polo_1_F_afro", "C_man_polo_1_F_asia",
	"C_man_polo_2_F", "C_man_polo_2_F_euro", "C_man_polo_2_F_afro", "C_man_polo_2_F_asia",
	"C_man_polo_3_F", "C_man_polo_3_F_euro", "C_man_polo_3_F_afro", "C_man_polo_3_F_asia",
	"C_man_polo_4_F", "C_man_polo_4_F_euro", "C_man_polo_4_F_afro", "C_man_polo_4_F_asia",
	"C_man_polo_5_F", "C_man_polo_5_F_euro", "C_man_polo_5_F_afro", "C_man_polo_5_F_asia",
	"C_man_polo_6_F", "C_man_polo_6_F_euro", "C_man_polo_6_F_afro", "C_man_polo_6_F_asia"
];

for "_i" from 1 to _nbUnits do
{
	_uPos = _pos vectorAdd ([[random _radius, 0, 0], random 360] call BIS_fnc_rotateVector2D);
	_unit = _group createUnit [_unitTypes call BIS_fnc_selectRandom, _uPos, [], 0, "Form"];
	_unit setPosATL _uPos;
	_newMissionRifle = 
	_newMissionAALauncher =
	_newMissionATLauncher = [_unit, selectRandom _missionRifleArray, 3] call BIS_fnc_addWeapon;

	removeAllWeapons _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	_unit addVest selectRandom _missionGearVestArray;


	switch (true) do
	{
		// Grenadier every 3 units, starting from #2
		case ((_i + 4) % 3 == 0):
		{
			_unit addUniform selectRandom _missionGearUniformArray;
			[_unit, selectRandom _missionRifleArray, 6] call BIS_fnc_addWeapon;
		};
		// AT every 6 units, starting from #6
		case (_i % 6 == 0):
		{
			_unit addUniform selectRandom _missionGearUniformArray;
			_unit addBackpack "B_Kitbag_mcamo";
			[_unit, selectRandom _missionRifleArray, 6] call BIS_fnc_addWeapon;
			[_unit, selectRandom _missionATLauncherArray, 1] call BIS_fnc_addWeapon;
		};
		// AA every 6 units, starting from #3
		case ((_i + 3) % 6 == 0):
		{
			_unit addUniform selectRandom _missionGearUniformArray;
			_unit addBackpack "B_Kitbag_mcamo";
			[_unit, selectRandom _missionRifleArray, 6] call BIS_fnc_addWeapon;
			[_unit, selectRandom _missionAALauncherArray, 0] call BIS_fnc_addWeapon;
		};
		// Rifleman
		default
		{
			_unit addUniform selectRandom _missionGearUniformArray;

			if (_unit == leader _group) then
			{
				[_unit, selectRandom _missionRifleArray, 6] call BIS_fnc_addWeapon;
				_unit setRank "SERGEANT";
			}
			else
			{
				[_unit, selectRandom _missionRifleArray, 6] call BIS_fnc_addWeapon;
			};
		};
	};

	_unit addPrimaryWeaponItem "acc_flashlight";
	_unit enablegunlights "forceOn";

	_unit addRating 1e11;
	_unit spawn addMilCap;
	_unit spawn refillPrimaryAmmo;
	_unit call setMissionSkill;
	_unit addEventHandler ["Killed", server_playerDied];
};

[_group, _pos] call defendArea;
