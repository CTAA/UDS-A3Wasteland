params["_id","_uid","_name","_jip","_owner"];
if((count _uid) isEqualTo 17 && _owner > 2)then{
	("002|"+_uid) call a3_infiSTAR_vision_fnc_Extension;
} else {
	if!(_uid isEqualTo "__SERVER__")then{
		missionNamespace setVariable ["a3_infiSTAR_vision_HC_ID", _owner];
	};
};
