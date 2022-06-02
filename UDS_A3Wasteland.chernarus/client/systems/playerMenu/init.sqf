// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
#include "dialog\player_sys.sqf";
//if(isnil {player getVariable "cmoney"}) then {player setVariable["cmoney",0,true];};
if(dialog) exitWith{};

disableSerialization;

createDialog "playerSettings";

private _Dialog = (findDisplay playersys_DIALOG);
private _moneytext = _Dialog displayCtrl money_text;
private _mvalue = _Dialog displayCtrl money_value;
private _rogue = _Dialog displayCtrl rogue_text;
_uptime = _Dialog displayCtrl uptime_text;
_groupButton = _Dialog displayCtrl groupButton;
_moneytext ctrlSetText format["%1", [player getVariable ["cmoney", 0]] call fn_numbersText];
private _infotext = _Dialog displayCtrl title_value;
_infostring = "Discord: <t color='#00BAFF'><a href='https://www.discord.gg/S25QBgb47y'>discord.gg/S25QBgb47y</a></t>";
_infotext ctrlSetStructuredText parseText _infostring;

{
	_mvalue lbSetData [_mvalue lbAdd format ["$%1", [_x] call fn_numbersText], str _x];
} forEach [5, 15, 20, 25, 50, 75, 100, 200, 300, 400, 500, 1000, 2000, 3000, 4000, 5000, 10000, 15000, 20000, 25000, 50000];

[] spawn
{
	disableSerialization;
	_dialog = findDisplay playersys_DIALOG;
	while {!isNull _dialog} do
	{
		_escMenu = findDisplay 49;
		if (!isNull _escMenu) exitWith { _escMenu closeDisplay 0 }; // Force close Esc menu if open
		sleep 0.1;
	};
};
