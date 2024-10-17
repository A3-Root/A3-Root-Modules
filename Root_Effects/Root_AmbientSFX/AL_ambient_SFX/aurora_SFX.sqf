// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

if (!hasInterface) exitwith {};

_sky_obj = _this select 0;
_sky_alt = _this select 1;
_speed = _this select 2;

_sky_obj setPosATL [getPosATL _sky_obj select 0, getPosATL _sky_obj select 1, _sky_alt];

while {!isNull _sky_obj} do 
{
	waitUntil {uiSleep _speed; sunOrMoon==0};
	_plasma_wave = "#particlesource" createVehicleLocal (getPosATL _sky_obj);  
	_plasma_wave setParticleCircle [0,[0,0,0]];  
	_plasma_wave setParticleRandom [5,[2500,20,10],[0,0,0],10,0,[0,0,0,0],1,0];  
	_plasma_wave setParticleParams [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,180,[0,0,0],[0,0,0],13,9.999,7.9,0.005,[150,150,150,300],[[0,1,0,0],[0,1,0,1],[0,0.3,0.7,0.5],[0.9,0,0.7,1],[0.4,0,0.2,0]],[0.08],1,0,"","",_sky_obj];
	_plasma_wave setDropInterval 0.05;
	waitUntil {uiSleep _speed; sunOrMoon==1};
	deleteVehicle _plasma_wave;
};