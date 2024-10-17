// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 


if (!isServer) exitwith {};

_object_name = _this select 0;
_sound_name  = _this select 1;
_delay_sound = _this select 2;
_distance_au = _this select 3;

if (!isNil {_object_name getVariable "is_ON"}) exitwith {}; 
_object_name setVariable ["is_ON",true,true];

if (_delay_sound<0) then {[_object_name,[_sound_name,_distance_au]] remoteExec ["say3d"]} 
else {while {!isNull _object_name} do {[_object_name,[_sound_name,_distance_au]] remoteExec ["say3d"];uiSleep _delay_sound}};