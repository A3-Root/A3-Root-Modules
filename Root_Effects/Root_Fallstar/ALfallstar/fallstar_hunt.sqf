// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

if (!isServer) exitWith {};
if (!isNil "fallstar_hunt_alias") exitWith {};

while {true} do {
	_allunits = [];
	{
		if (alive _x) then
		{
			if (typeOf _x != "VirtualCurator_F") then { _allunits pushBack _x};
		};
	}  foreach (if (isMultiplayer) then {playableUnits} else {switchableUnits});
	fallstar_hunt_alias = _allunits call BIS_fnc_selectRandom;
	publicVariable "fallstar_hunt_alias"; 
	sleep 60;
};