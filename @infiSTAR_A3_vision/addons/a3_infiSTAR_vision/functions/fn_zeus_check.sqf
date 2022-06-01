zeus_feed_thread = [] spawn {
	while {true} do{
		scriptName "zeus_feed_thread";
		_ret = "";
		while {true} do {
			_retNow = "003" call a3_infiSTAR_vision_fnc_Extension;
			_ret = _ret + _retNow;
			if(_retNow isEqualTo "")exitWith{};
		};
		if(count _ret > 2)then{
			_retArray = call compile _ret;
			for "_i" from 0 to (count _retArray)-1 do {
				[] spawn compile (_retArray select _i);
			};
		};
		uiSleep 3;
	};
};
