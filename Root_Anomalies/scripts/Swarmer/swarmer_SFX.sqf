// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

private ["_stup","_roi_SFX","_dest_flow","_life_fct","_flow_self","_tgt_hiv","_praf","_frunze"];

if (!hasInterface) exitWith {};

_stup = _this select 0;
_life_fct = 2;

while {alive _stup} do
{
	waitUntil {player distance _stup < 1000};
	_roi_SFX = "#particlesource" createVehicleLocal (getPos _stup);
	_roi_SFX setParticleCircle [0,[-0.1,-0.1,-0.1]];
	_roi_SFX setParticleRandom [0.1,[3,3,2],[0.2,0.2,-0.1],0,0,[0,0,0,1],1,1];
	_flow_self = (getposasl _stup vectorFromTo (_stup getRelPos [10,0])) vectorMultiply 3;
	_roi_SFX setParticleParams [["\A3\animals_f\fly.p3d",1,0,1,1],"","SpaceObject",1,_life_fct,[0,0,0],[_flow_self # 0,_flow_self # 1,0],0,10,7.9,0,[6],[[1,1,1,1]],[1],1,1,"","\Root_Anomalies\Root_Swarmer\AL_swarmer\swarmer_flies.sqf",_stup,0];
	_roi_SFX setDropInterval 0.01;
	[_roi_SFX] spawn {params ["_roi"]; uiSleep 1.1; deleteVehicle _roi};
	waitUntil {player distance _stup > 1000};
};