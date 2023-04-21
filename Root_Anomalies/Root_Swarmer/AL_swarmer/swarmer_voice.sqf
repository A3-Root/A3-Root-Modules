// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

if (!hasInterface) exitWith {};

params ["_swarmer"];
private ["_swarmer"];
enableCamShake true;
sleep 5;
while {alive _swarmer} do 
{
	if (player distance _swarmer > 500) then {_queen_call = selectrandom ["hive_queen_01","hive_queen_02"];_swarmer say3D [_queen_call,2000]};
	if (player distance _swarmer < 500) then {_swarmer say3D ["roi_02",300]};
	if (player distance _swarmer < 15) then {_baz_c = selectrandom ["insect_01","insect_03","insect_04","insect_05","insect_07","insect_08"]; playsound _baz_c};
	if ((player == _swarmer getVariable "tgt")and(player distance _swarmer < 5)) then {addCamShake [5,2,5];[60] call BIS_fnc_bloodEffect};	
	sleep 11;
};