// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: setMissionSkill.sqf
//	@file Author: AgentRev
//	@file Created: 21/10/2013 19:14
//	@file Args:

if (!isServer) exitWith {};

private "_skill";
private "_accuracy";
private _unit = _this;

if (["A3W_missionsDifficulty"] call isConfigOn) then {
	_skill = 0.7; // Default skill for ARMA3 is 0.5
	_accuracy = 0.25; // Relative multiplier; absolute default accuracy for ARMA3 is 0.25
	_unit setSkill ["commanding", 1];
} else {
	_skill = 0.33;
	_accuracy = 0.2;
};

_unit allowFleeing 0;
_unit setSkill _skill;
// _unit setSkill ["aimingAccuracy", (_unit skill "aimingAccuracy") * _accuracy];
_unit setSkill ["aimingAccuracy", _accuracy];
_unit setSkill ["courage", 1];
_unit setSkill ["spotDistance", 1];

// Available skills are explained here: http://community.bistudio.com/wiki/AI_Sub-skills
// Skill values are between 0 and 1
