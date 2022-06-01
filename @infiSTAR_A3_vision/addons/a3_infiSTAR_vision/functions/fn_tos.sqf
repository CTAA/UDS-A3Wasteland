_text = "
In order to serve its purpose of preventing and detecting the use of cheat software with the goal of ensuring a fair game environment, infiSTAR may process the following information from you:<br/>
<br/>
- IP address<br/>
- Game identifiers (e.g. in-game name, account ID, etc.)<br/>
- Hardware device information and identifiers (e.g. serial numbers)<br/>
- Information about the running operating system<br/>
- Information about game-related and operating-system-related files and memory<br/>
<br/>
infiSTAR follows a data minimization policy that ensures that data is only being stored when necessary, i.e. when infiSTAR finds information that may potentially indicate the use of cheat software. As a result, infiSTAR generally will not store any information on most users.<br/>
<br/>
infiSTAR may store the information for the entire duration of the provision of its services for the game.<br/>
<br/>
You may contact infiSTAR at any time to exercise your rights in relation to this data processing. See infiSTAR's <a color=""#D0E354"" href=""https://infistar.de/privacy-policy"">Privacy Policy</a> for more information.<br/>
";

_code = {
	if(profileNamespace getVariable ["infiSTAR_agb", false])exitWith{};
	waitUntil{getClientStateNumber >= 10 && !isNull findDisplay 46};
	disableSerialization;
	_display = findDisplay 49;if !(isNull _display) then{_display closeDisplay 2;};
	_result = [parseText _this, "infiSTAR TOS", "Yes", "No"] call BIS_fnc_guiMessage;
	waitUntil { !isNil "_result" };
	if(_result)then{
		profileNamespace setVariable ["infiSTAR_agb", true];
		saveProfileNamespace;
		systemChat "infiSTAR TOS accepted!";
	} else {
		systemChat "infiSTAR TOS not accepted! You have been kicked to the lobby.";
		findDisplay 46 closeDisplay 0;
	};
};
[_text, _code] remoteExecCall ["spawn", -2, "vision_agb_jip"];
