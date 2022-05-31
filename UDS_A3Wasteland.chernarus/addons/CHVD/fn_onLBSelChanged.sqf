private "_terrainGrid";
private _index = _this select 0;
_varType = _this select 1;
_text = _this select 2;

switch (_index) do {
	case 0: {_terrainGrid = 10};
	case 1: {_terrainGrid = 7.708};
	case 2: {_terrainGrid = 5.417};
	case 3: {_terrainGrid = 3.125};
};

if (!CHVD_allowNoGrass) then {
	_terrainGrid = _terrainGrid min 10;
};
ctrlSetText [_text, str _terrainGrid];		
call compile format ["%1 = %2",_varType, _terrainGrid];
call compile format ["profileNamespace setVariable ['%1',%1]", _varType];