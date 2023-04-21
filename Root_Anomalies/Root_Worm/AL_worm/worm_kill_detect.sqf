// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 
params ["_wormkill"];

if (typeOf _wormkill == wormkiller) then 
{
	[_wormkill, "\Root_Anomalies\Root_Worm\AL_worm\worm_kill_confirm.sqf"] remoteExec ["execVM"];
};