// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 
_list_units_in_range = "NO-INFANTRY-IN-RANGE";

_object_burp_damage = _this select 0;
_burper_radius = _this select 1;
_vehicle_allowed = _this select 2;
_anti_burp = _this select 3;

if (isNil "_anti_burp") then {
	_anti_burp = "ANTIBURP-NOT-CONFIGURED";
};

if (!isNil "obj_prot_burper") then {
while {alive _object_burp_damage} do 
{
	if (_vehicle_allowed == true) then {
		_list_units_in_range = (position _object_burp_damage) nearEntities [["Man", "LandVehicle"], _burper_radius];
	} else {
		_list_units_in_range = (position _object_burp_damage) nearEntities ["Man", _burper_radius];
};
//_list_units_in_range = (position _object_burp_damage) nearEntities [["Man","LandVehicle"],9];
if (count _list_units_in_range>0) then 
{
	{
	if (
		(typeOf _x == "VirtualCurator_F")or
		(headgear _x == obj_prot_burper)or
		(goggles _x == obj_prot_burper)or
		(uniform _x == obj_prot_burper)or
		(vest _x == obj_prot_burper)or
		(Backpack _x == obj_prot_burper)or
		(typeOf _x == _anti_burp)or
		(obj_prot_burper in (assigneditems _x + items _x))) then 
	{/*to do*/} 
	else
		{
		_tipat=["strigat_1","strigat_2","strigat_3","strigat_4","strigat_5","strigat_6","strigat_7","strigat_8","strigat_9","strigat_91","strigat_92"] call BIS_fnc_selectRandom;
		[_x,[_tipat,100]] remoteExec ["say3d",0];
		sleep 0.5 + (random 0.5);
		_x setDamage 1;
		_x hideObjectGlobal true;
		if !(_x isKindOf "LandVehicle") then { deletevehicle _x; };
		_oase = createVehicle ["Land_HumanSkeleton_F", [getposATL _x select 0,getposATL _x select 1,1.5], [], 0, "CAN_COLLIDE"];
		[_oase] remoteExec ["ROOT_fnc_burperDamageEffect",[0,-2] select isDedicated];
		_balta_sange = createVehicle ["BloodSplatter_01_Medium_New_F", [getposATL _x select 0,getposATL _x select 1,0], [], 0, "CAN_COLLIDE"];
		_oase setDir random 360;
		_oase setVectorUp [0,-1,1];
		[_object_burp_damage,["blood_splash",100]] remoteExec ["say3d",0];
		sleep 0.3;
		[_balta_sange,["bones_drop",100]] remoteExec ["say3d",0];
		};
	} foreach _list_units_in_range;
};

sleep 1;
};
} else {

while {alive _object_burp_damage} do 
{
//_list_units_in_range = (position _object_burp_damage) nearEntities [["Man","LandVehicle"],9];
if (_vehicle_allowed == true) then {
	_list_units_in_range = (position _object_burp_damage) nearEntities [["Man", "LandVehicle"], _burper_radius];
	} else {
		_list_units_in_range = (position _object_burp_damage) nearEntities ["Man", _burper_radius];
};
if (count _list_units_in_range>0) then 
{
	{
		if ((typeOf _x != "VirtualCurator_F") or (typeOf _x != _anti_burp)) then {
		_tipat=["strigat_1","strigat_2","strigat_3","strigat_4","strigat_5","strigat_6","strigat_7","strigat_8","strigat_9","strigat_91","strigat_92"] call BIS_fnc_selectRandom;
		[_x,[_tipat,100]] remoteExec ["say3d",0];
		sleep 0.5 + (random 0.5);
		_x setDamage 1;
		_x hideObjectGlobal true;
		if !(_x isKindOf "LandVehicle") then { deletevehicle _x; };
		_oase = createVehicle ["Land_HumanSkeleton_F", [getposATL _x select 0,getposATL _x select 1,1.5], [], 0, "CAN_COLLIDE"];
		[_oase] remoteExec ["ROOT_fnc_burperDamageEffect",[0,-2] select isDedicated];
		_balta_sange = createVehicle ["BloodSplatter_01_Medium_New_F", [getposATL _x select 0,getposATL _x select 1,0], [], 0, "CAN_COLLIDE"];
		_oase setVectorUp [0,-1,1];
		[_object_burp_damage,["blood_splash",100]] remoteExec ["say3d",0];
		sleep 0.3;
		[_balta_sange,["bones_drop",100]] remoteExec ["say3d",0];
		};
	} foreach _list_units_in_range;
};

sleep 1;
};

};