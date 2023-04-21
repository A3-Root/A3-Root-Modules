// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

if (!isServer) exitWith {};

_delay_fall_star = _this select 0;
nul = [] execVM "\Root_Effects\Root_Fallstar\ALfallstar\fallstar_hunt.sqf";

waitUntil {!isNil "fallstar_hunt_alias"};

alias_fallingstar=true;
publicVariable "alias_fallingstar";

while {alias_fallingstar} do 
{
	nul = [] execvm "\Root_Effects\Root_Fallstar\ALfallstar\fallstar_fallingstar.sqf";
	sleep _delay_fall_star;
};