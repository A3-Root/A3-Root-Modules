// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 


private ["_search_object"];

if (!isServer) exitWith {};

_search_object	= _this select 0;
_enable_sound	= _this select 1;

if (!isNil {_search_object getVariable "is_ON"}) exitwith {};
_search_object setVariable ["is_ON",true,true];

_obiect_search = createSimpleObject ["A3\data_f\VolumeLight_searchLight.p3d",getposasl _search_object];

al_search_light = true; publicVariable "al_search_light";

[[_obiect_search,_enable_sound],"\Root_Effects\Root_Battlescripts\ALambientbattle\battle_search_light_effect.sqf"] remoteExec ["execVM",0,true];