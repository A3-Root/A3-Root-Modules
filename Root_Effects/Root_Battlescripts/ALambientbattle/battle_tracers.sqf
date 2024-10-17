// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

private ["_main_tracer_object","_colorred", "_colorgreen", "_colorblue", "_trasor","_xx","_yy","_zz","_life_time_tras"];

if (!isServer) exitWith {};

_main_tracer_object = _this select 0;
_colorred = _this select 1;
_colorgreen = _this select 2;
_colorblue = _this select 3;
_activation_distance = _this select 4;

if (!isNil {_main_tracer_object getVariable "is_ON"}) exitwith {};
_main_tracer_object setVariable ["is_ON",true,true];

al_tracer = true; publicVariable "al_tracer";
al_tracers_sunet_play = false; publicVariable "al_tracers_sunet_play";	

[] spawn {while {al_tracer} do {uiSleep 33 + random 4; al_tracers_sunet_play = false;	publicVariable "al_tracers_sunet_play"}};

[[_main_tracer_object,_colorred,_colorgreen,_colorblue,_activation_distance],"\Root_Effects\Root_Battlescripts\ALambientbattle\battle_tracers_effect.sqf"] remoteExec ["execVM",0,true];