// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

if (!hasInterface) exitWith {};

_firefly_nest = _this select 0;
_firefly_alt = _this select 1;
_fireflydist = _this select 2;

_firefly_nest setPosATL [getPosATL _firefly_nest select 0, getPosATL _firefly_nest select 1, _firefly_alt];

while {!isNull _firefly_nest} do 
{
	waitUntil {uiSleep 1; sunOrMoon == 0};
	waitUntil {uiSleep 1; player distance _firefly_nest < _fireflydist};
	_firefly_nest = "#particlesource" createVehicleLocal (getPosATL _firefly_nest);
	_firefly_nest setParticleCircle [10,[0,0,0]];
	_firefly_nest setParticleRandom [10,[5,5,2],[0.2,0.2,0.5],1,0,[0,0,0,0.1],1,1];
	_firefly_nest setParticleParams [["\A3\data_f\proxies\muzzle_flash\mf_machineGun_Cheetah.p3d",1,0,1],"","SpaceObject",1,14,[0,0,5],[0,0,0.5],13,1.3,1,0,[0.01,0.01],[[1,1,1,1],[1,1,1,1]],[1],1,1,"","",_firefly_nest];
	_firefly_nest setDropInterval 0.1;
	waitUntil {uiSleep 1; player distance _firefly_nest > _fireflydist};
	deleteVehicle _firefly_nest;
};