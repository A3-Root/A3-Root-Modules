// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

if (!isServer) exitWith {};

_firefly_nest = _this select 0;
_firefly_alt = _this select 1;
_fireflydist = _this select 2;

if (!isNil {_firefly_nest getVariable "is_ON"}) exitwith {}; 
_firefly_nest setVariable ["is_ON",true,true];
[[_firefly_nest, _firefly_alt],"\Root_Effects\Root_AmbientSFX\AL_ambient_SFX\firefly_SFX.sqf"] remoteexec ["execvm",0,true];