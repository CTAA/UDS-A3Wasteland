[] call a3_infistar_vision_fnc_feed;
[] call a3_infiSTAR_vision_fnc_zeus_check;
[] call a3_infiSTAR_vision_fnc_tos;


diag_log "<<< VISION VARS >>>";
{
	_varname = toLower _x;
	if(_varname find "a3_infistar_vision" > -1)then{
		diag_log _x;
	};
} forEach (allvariables missionNamespace);
diag_log "<<< VISION VARS >>>";

true
