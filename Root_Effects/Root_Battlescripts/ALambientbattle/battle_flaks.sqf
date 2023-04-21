// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 


if (!isServer) exitWith {};

_main_air_object = _this select 0;
_main_air_radius = _this select 1;
_main_air_altitude = _this select 2;
_aaa_damage_vic = _this select 3;
_islethal = _this select 4;
_aaa_speed = _this select 5;
_aaa_damage_inf = _this select 6;

if (!isNil {_main_air_object getVariable "is_ON"}) exitwith {};
_main_air_object setVariable ["is_ON",true,true];

al_aaa = true; publicVariable "al_aaa";

[[_main_air_object, _main_air_radius, _main_air_altitude, _aaa_damage_vic, _islethal, _aaa_speed, _aaa_damage_inf],"\Root_Effects\Root_Battlescripts\ALambientbattle\battle_flaks_effect.sqf"] remoteExec ["execVM",0,true];
