// by ALIAS

if (!isServer) exitwith {};

private ["_marker_sursa_smugg", "_mobile_anomaly", "_device_detector", "_spawn_classname", "_delay_between_spawn", "_teleport_protect", "_dmg_on_teleport", "_noseize"];

_marker_sursa_smugg = _this select 0;
_mobile_anomaly 	= _this select 1;
_device_detector	= _this select 2;
_spawn_classname	= _this select 3;
_delay_between_spawn= _this select 4;
_teleport_protect	= _this select 5;
_dmg_on_teleport    = _this select 6;
_noseize            = _this select 7;

_sursa_smugg = createVehicle ["Land_HelipadEmpty_F", [getmarkerpos _marker_sursa_smugg select 0,getmarkerpos _marker_sursa_smugg select 1,2], [], 0, "CAN_COLLIDE"];
_sursa_smugg_core = createVehicle ["Land_HelipadEmpty_F", [getmarkerpos _marker_sursa_smugg select 0,getmarkerpos _marker_sursa_smugg select 1,2], [], 0, "CAN_COLLIDE"];
_sursa_smugg_core attachTo [_sursa_smugg,[0,0,0]];

protection_smug = _teleport_protect; publicVariable "protection_smug";
detect_smug = _device_detector; publicVariable "detect_smug";

if (_device_detector !="") then 
{
	null= [_sursa_smugg] execvm "\Root_Anomalies\Root_Smuggler\AL_smuggler\smuggler_ai_avoid_smugg.sqf"
} else 
{
	null= [_sursa_smugg] execvm "\Root_Anomalies\Root_Smuggler\AL_smuggler\smuggler_ai_avoid_smugg_visible.sqf"
};

[[_sursa_smugg,_sursa_smugg_core],"\Root_Anomalies\Root_Smuggler\AL_smuggler\smuggler_sfx.sqf"] remoteExec ["execVM",0,true];

[[_sursa_smugg,_sursa_smugg_core, _dmg_on_teleport, _noseize],"\Root_Anomalies\Root_Smuggler\AL_smuggler\smuggler_teleport.sqf"] remoteExec ["execVM",0,true];

if (count _spawn_classname >0) then 
{ 
	if(_delay_between_spawn <=0) exitwith {hint "The delay between spawns must be bigger than 0"}; 
	spawn_delay_smugg=_delay_between_spawn; publicVariable"spawn_delay_smugg"; 
	null=[_spawn_classname,_sursa_smugg_core] execvm "\Root_Anomalies\Root_Smuggler\AL_smuggler\smuggler_spawn.sqf"
};

if (_mobile_anomaly) then 
{
	while {!isNull _sursa_smugg} do 
	{
		_poz_ini_smug = getposatl _sursa_smugg;
		_new_poz = [_poz_ini_smug,0.01,0.3,1,0,-1,0] call BIS_fnc_findSafePos;
		_sursa_smugg setPos [_new_poz select 0,_new_poz select 1, _poz_ini_smug select 2];
		sleep 3+random 30;
	};
};