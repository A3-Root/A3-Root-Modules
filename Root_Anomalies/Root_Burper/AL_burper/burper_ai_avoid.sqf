// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

private ["_avoid_poz","_op_dir","_reldir"];

_obj_teleporter = _this select 0;

while {alive _obj_teleporter} do 
{
_list_ai_in_range = (position _obj_teleporter) nearEntities ["Man",80];
if (count _list_ai_in_range>0) then 
{
	{
	if ((local _x) and ((headgear _x == detectiv_tool)or(goggles _x==detectiv_tool)or(uniform _x==detectiv_tool)or(vest _x==detectiv_tool)or(Backpack _x==detectiv_tool) or (detectiv_tool in (assigneditems _x + items _x)))) then 
	{
		//[str _list_ai_in_range] remoteExec ["hint",0];
		_reldir = [_x, getPos _obj_teleporter] call BIS_fnc_dirTo;
		_fct = [30,-30] call BIS_fnc_selectRandom;
		if (_reldir<180) then {_op_dir=_reldir+180 +_fct} else {_op_dir=_reldir-180+_fct};
		_avoid_poz = [getposATL _x,100+random 500, _op_dir] call BIS_fnc_relPos;
		_x doMove _avoid_poz;
		_x setSkill ["commanding", 1];
	}
	} foreach _list_ai_in_range;
};
sleep 30;
};
