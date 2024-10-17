// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 


private ["_spark_poz_rel","_pauza_intre_sclipiri","_lamp", "_altitude"];

if (!isServer) exitWith {};

_lamp = _this select 0;
_altitude = _this select 1;
_sparksdelay = _this select 2;

if (!isNil {_lamp getVariable "is_ON"}) exitwith {}; 
_lamp setVariable ["is_ON",true,true];

while {!isNull _lamp} do 
{
	_sclipiri = 1+ floor (random 5);
	_nr = 0;
	while {_nr<_sclipiri} do 
	{
		_pauza_intre_sclipiri = 0.1+ (random 2);
		[[_lamp,_pauza_intre_sclipiri,_altitude],"\Root_Effects\Root_AmbientSFX\AL_ambient_SFX\spark_effect.sqf"] remoteExec ["execvm"];
		uiSleep _pauza_intre_sclipiri;
		_nr=_nr+1;
	};
	uiSleep _sparksdelay;
};