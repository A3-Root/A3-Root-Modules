// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

if (!isServer) exitWith {};

params ["_gren"];

while {alive _gren} do 
{
	_ck_hiv = (position _gren) nearEntities ["CAManBase",7];
	if (count _ck_hiv >0) then 
	{
		{
			if (!isNil{_x getVariable "isHive"}) then 
			{
				sleep 1;
				_x setDamage 1; 
				[[_x],"\Root_Anomalies\Root_Swarmer\AL_swarmer\swarmer_dead_SFX.sqf"] remoteExec ["execVM"];
			};
		} foreach _ck_hiv;
	};
	sleep 2;
}