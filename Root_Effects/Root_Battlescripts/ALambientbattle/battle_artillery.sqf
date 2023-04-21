// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 


if (!isServer) exitWith {};

params ["_main_art_object", "_main_art_radius", "_ground_damage", "_ground_speed", "_ground_type", "_sound_only"];
private ["_xx","_yy","_zz","_dire"];

if (!isNil {_main_art_object getVariable "is_ON"}) exitwith {};
_main_art_object setVariable ["is_ON",true,true];

al_art = true; publicVariable "al_art";

[[_main_art_object, _main_art_radius, _ground_damage, _ground_speed, _ground_type, _sound_only],"\Root_Effects\Root_Battlescripts\ALambientbattle\battle_art_effect.sqf"] remoteExec ["execVM",0,true];