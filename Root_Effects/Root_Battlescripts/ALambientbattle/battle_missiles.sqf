// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 


private ["_main_missiles_object"];

if (!isServer) exitWith {};

params ["_main_missiles_object", "_missle_distance", "_launch_delay"];

if (!isNil {_main_missiles_object getVariable "is_ON"}) exitwith {};
_main_missiles_object setVariable ["is_ON",true,true];

al_missile = true; publicVariable "al_missile";

[[_main_missiles_object, _missle_distance, _launch_delay],"\Root_Effects\Root_Battlescripts\ALambientbattle\battle_missiles_effect.sqf"] remoteExec ["execVM",0,true];