// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 


params ["_ai","_burper"];

//[str _list_ai_in_range] remoteExec ["hint",0];
_reldir = [_ai, getPos _burper] call BIS_fnc_dirTo;
_fct = [30,-30] call BIS_fnc_selectRandom;
if (_reldir<180) then {_op_dir=_reldir+180 +_fct} else {_op_dir=_reldir-180+_fct};
_avoid_poz = [getposATL _ai,100+random 500, _op_dir] call BIS_fnc_relPos;
_ai doMove _avoid_poz;
_ai setSkill ["commanding", 1];

