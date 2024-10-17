// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

private ["_strigoi"];

if (!hasInterface) exitWith {};

_strigoi = _this select 0;

if (!alive _strigoi) exitWith {};

while {alive _strigoi} do 
{
	waitUntil {uiSleep 5; player distance _strigoi < 200};
	player setFatigue ((getfatigue player) + 0.2);
	uiSleep 0.5;
};