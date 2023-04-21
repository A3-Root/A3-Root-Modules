// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 
params ["_grenade_insect"];

if (typeOf _grenade_insect == insecticid) then 
{
	[_grenade_insect,"\Root_Anomalies\Root_Swarmer\AL_swarmer\swarmer_kill_hive.sqf"] remoteExec ["execVM"];
};