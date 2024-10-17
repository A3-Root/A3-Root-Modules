// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 


if (!hasInterface) exitWith {};
params ["_volcano_object","_crater_radius"];

_interior_lava = "#particlesource" createVehicleLocal getPosATL _volcano_object;
_interior_lava setParticleCircle [0,[0,0,0]];
_interior_lava setParticleRandom [3,[_crater_radius,_crater_radius,10],[0,0,0],5,0.2,[0,0,0,0.1],1,0];
_interior_lava setParticleParams [["\A3\data_f\cl_exp",1,0,1],"","Billboard",1,20,[0,0,30],[0,0,0],3,10.05,7.9,0,[_crater_radius*2,_crater_radius*2+10,_crater_radius*2],[[1,1,1,0],[1,1,1,1],[1,1,1,0]],[0.08],1,0,"","",_volcano_object];
_interior_lava setDropInterval 0.1;

_lava_heat = "#particlesource" createVehicleLocal getPosATL _volcano_object;
_lava_heat setParticleCircle [0,[0,0,0]];
_lava_heat setParticleRandom [5,[_crater_radius,_crater_radius,10],[0,0,0],5,0.2,[0,0,0,0.1],1,0];
_lava_heat setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",1,20,[0,0,30],[0,0,0],5,9.5,7.9,0.5,[_crater_radius*3,_crater_radius*2,_crater_radius],[[1,1,1,0],[1,1,1,1],[1,1,1,0]],[1],1,0,"","",_volcano_object];
_lava_heat setDropInterval 0.1;

_lava = "#particlesource" createVehicleLocal position _volcano_object;
_lava setParticleCircle [_crater_radius/2,[0,0,0]];
_lava setParticleRandom [5,[_crater_radius/4,_crater_radius/4,5],[0,0,0],0,0.1,[0,0,0,0],0,0];
_lava setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal",16,12,9,0],"","BillBoard",1,10,[0,0,0],[0,0,30],0,80,7,0,[_crater_radius,_crater_radius*5+20],[[1,0.7,0,1],[0,0,0,0]],[1],1,0,"","",_volcano_object];
_lava setDropInterval 0.7;

_lava_chunks = "#particlesource" createVehicleLocal position _volcano_object;
_lava_chunks setParticleCircle [_crater_radius,[0,0,0]];
_lava_chunks setParticleRandom [5,[_crater_radius/6,_crater_radius/6,50],[15,15,20],0,0.1,[0,0,0,1],1,1];
_lava_chunks setParticleParams [["\A3\data_f\cl_exp",1,0,1],"","Billboard",1,5,[0,0,30],[0,0,50],0,30,6,0,[4,.1],[[1,1,1,1],[1,1,1,1]],[1],1,1,"","",_volcano_object];
_lava_chunks setDropInterval 0.2;

_lava_boil = "#particlesource" createVehicleLocal position _volcano_object;
_lava_boil setParticleCircle [_crater_radius/3,[0,0,0]];
_lava_boil setParticleRandom [0,[_crater_radius/6,_crater_radius/6,0],[0.5,0.5,20],0,0.5,[0,0,0,0.1],1,0];
_lava_boil setParticleParams [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,5,[0,0,0],[0,0,20],0,70,6,0,[_crater_radius,_crater_radius+5,_crater_radius*2],[[1,0.1,0.1,0.5],[1,0.5,0.1,0.3],[1,0.5,0,0]],[1],1,0,"","", _volcano_object];
_lava_boil setDropInterval 0.3;

waitUntil {uiSleep 30; isNull _volcano_object};
deleteVehicle _lava_heat;
deleteVehicle _lava;
deleteVehicle _interior_lava;
deletevehicle _lava_chunks;
deletevehicle _lava_boil;