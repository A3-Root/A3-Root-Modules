// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

if (!hasInterface) exitWith {};

params ["_horn"];

if (!isNil {_horn getVariable "is_ON"}) exitwith {};
_horn setVariable ["is_ON",true,true];

while {!isNull _horn} do 
{
	waitUntil {sleep 10; player distance _horn < 1500};
	_emanatie = "#particlesource" createVehicleLocal (getpos _horn);
	_emanatie setParticleCircle [0,[0,0,0]];
	_emanatie setParticleRandom [2,[0.1,0.1,1],[0,0,0],2,0.5,[0,0,0,0.1],1,0];
	_par_sfx = selectRandom [[["\A3\data_f\cl_basic",1,0,1], "", "Billboard", 1,4+round(random 4),[0,0,0],[0,0,0.3],5,10,7.9,random 0.1,[0.3,0.5,2],[[1,1,1,0],[1,1,1,0.5],[1,1,1,0]],[0.8],0.5,0,"","",_horn],
	[["\A3\data_f\ParticleEffects\Universal\Universal",16,7,48,1], "", "Billboard", 1,4+round(random 4),[0,0,0],[0,0,0.2],5,10,7.9,random 0.1,[0.2,0.5,2],[[1,1,1,0.1],[1,1,1,0.3],[1,1,1,0]],[0.5],0.5,0,"","",_horn]];
	_emanatie setParticleParams _par_sfx;
	_emanatie setDropInterval 0.1;
	_vapori = selectrandom ["vapori_01","vapori_02","vapori_03"];
	while {player distance _horn < 1500} do {_horn say3D [_vapori,100];	sleep 8.5};
	deleteVehicle _emanatie;
};