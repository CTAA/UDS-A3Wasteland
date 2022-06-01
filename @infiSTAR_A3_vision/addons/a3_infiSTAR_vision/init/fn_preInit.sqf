diag_log format["<<< VISION preInit >>> updatevision callExtension: %1","updatevision" callExtension "update"];

diag_log format["<<< VISION preInit >>> a3_infiSTAR_vision_fnc_PlayerConnected: %1", !isNil "a3_infiSTAR_vision_fnc_PlayerConnected"];
rem_PlayerConnected_id = addMissionEventHandler ["PlayerConnected", { call a3_infiSTAR_vision_fnc_PlayerConnected; }];
diag_log ("<<< VISION preInit >>> rem_PlayerConnected_id: " + (str rem_PlayerConnected_id));

diag_log format["<<< VISION preInit >>> a3_infiSTAR_vision_fnc_PlayerDisconnected: %1", !isNil "a3_infiSTAR_vision_fnc_PlayerDisconnected"];
rem_PlayerDisconnected_id = addMissionEventHandler ["PlayerDisconnected", { call a3_infiSTAR_vision_fnc_PlayerDisconnected; }];
diag_log ("<<< VISION preInit >>> rem_PlayerDisconnected_id: " + (str rem_PlayerDisconnected_id));

true
