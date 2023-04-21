// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

if (!isServer) exitWith {};

_delay = _this select 0;
nul = [] execVM "\Root_Effects\Root_Fallstar\ALfallstar\fallstar_hunt.sqf";

waitUntil {!isNil "fallstar_hunt_alias"};

alias_meteors = true;
publicVariable "alias_meteors";

while {alias_meteors} do {
	nul = [] execvm "\Root_Effects\Root_Fallstar\ALfallstar\fallstar_meteor.sqf";
	sleep _delay;
};