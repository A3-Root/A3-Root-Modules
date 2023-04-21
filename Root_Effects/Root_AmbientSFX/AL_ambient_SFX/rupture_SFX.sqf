// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

if (!hasInterface) exitwith {};

_sky_obj = _this select 0;
_sky_alt = _this select 1;
_speed = _this select 2;

_sky_obj setPosATL [getPosATL _sky_obj select 0, getPosATL _sky_obj select 1, _sky_alt];

while {!isNull _sky_obj} do 
{
	waitUntil {sleep _speed; sunOrMoon==0};
	_sp_rupture = "#particlesource" createVehicleLocal getPosATL _sky_obj;
	_sp_rupture setParticleCircle [0,[0,0,0]];
	_sp_rupture setParticleRandom [10,[2000,5,5],[0,0,0],0.01,1,[0,0,0,0.1],1,0];
	_sp_rupture setParticleParams [["\A3\data_f\VolumeLight", 1, 0, 1], "", "SpaceObject", 1,180,[0,0,0],[0,0,0],0,9.996,7.84,0,[20,30,20],[[0,0,0,0],[1,1,0.25,1],[0.5,1,0.5,0]],[0.08],1,0,"","",_sky_obj];
	_sp_rupture setDropInterval 0.05;
	waitUntil {sleep _speed; sunOrMoon==1};
	deleteVehicle _sp_rupture;
};