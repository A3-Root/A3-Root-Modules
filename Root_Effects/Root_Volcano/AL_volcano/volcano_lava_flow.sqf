// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

if (!hasInterface) exitWith {};

_volcano_object	= _this select 0;

_curgere_lava = "#particlesource" createVehicleLocal [(getPosATL _volcano_object select 0) + random(25), (getPosATL _volcano_object select 1) + random(25), (getPosATL _volcano_object select 2) + random(25)];
_curgere_lava setParticleCircle [20,[0,0,0]];
_curgere_lava setParticleRandom [5,[5,40,0],[0,0,0],1,0.2,[0,0,0,0.1],1,0];
_curgere_lava setParticleParams [["\a3\Data_f\ParticleEffects\Universal\Universal",16,10,32,1],"","Billboard",1,30,[0,0,0],[0,0,-1],1,10,7.9,0,[5,5,10],[[1,1,1,1],[1,1,1,1],[1,1,1,0]],[0.5],1,0, "", "",_volcano_object];
_curgere_lava setDropInterval 0.1;
_curgere_lava setParticleFire [1,50,0.1];

_curgere_lava_1 = "#particlesource" createVehicleLocal [(getPosATL _volcano_object select 0) + random(25), (getPosATL _volcano_object select 1) + random(25), (getPosATL _volcano_object select 2) + random(25)];
_curgere_lava_1 setParticleCircle [20,[0,0,0]];
_curgere_lava_1 setParticleRandom [5,[15,10,0],[0,0,0],1,0.2,[0,0,0,0.1],1,0];
_curgere_lava_1 setParticleParams [["\a3\Data_f\ParticleEffects\Universal\Universal",16,10,32,1],"","Billboard",1,30,[0,0,0],[0,0,-1],1,10,7.9,0,[5,5,10],[[1,1,1,1],[1,1,1,1],[1,1,1,0]],[0.5],1,0, "", "",_volcano_object];
_curgere_lava_1 setDropInterval 0.1;

_curgere_lava_2 = "#particlesource" createVehicleLocal [(getPosATL _volcano_object select 0) + random(25), (getPosATL _volcano_object select 1) + random(25), (getPosATL _volcano_object select 2) + random(25)];
_curgere_lava_2 setParticleCircle [20,[0,0,0]];
_curgere_lava_2 setParticleRandom [5,[3,40,0],[0,0,0],1,0.2,[0,0,0,0.1],1,0];
_curgere_lava_2 setParticleParams [["\a3\Data_f\ParticleEffects\Universal\Universal",16,10,32,1],"","Billboard",1,30,[0,0,0],[0,0,-1],1,10,7.9,0,[5,5,10],[[1,1,1,1],[1,1,1,1],[1,1,1,0]],[0.5],1,0, "", "",_volcano_object];
_curgere_lava_2 setDropInterval 0.1;
_curgere_lava_2 setParticleFire [1,50,0.1];


waitUntil {uiSleep 30; !isNull _volcano_object};
deleteVehicle _curgere_lava;
deleteVehicle _curgere_lava_1;
deleteVehicle _curgere_lava_2;
