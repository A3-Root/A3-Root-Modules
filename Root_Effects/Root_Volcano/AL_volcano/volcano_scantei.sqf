// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

if (!hasInterface) exitWith {};
params ["_alias_volcano","_crater_radius"];
[_alias_volcano,player] say3d [erupt_s,5000];

_blow_up = "#particlesource" createVehicleLocal position _alias_volcano;
_blow_up setParticleCircle [_crater_radius/3,[0,0,0]];
_blow_up setParticleRandom [0,[0,0,0],[30,30,20],0,0,[0,0,0,0],1,0];
_blow_up setParticleParams [["\a3\Data_f\ParticleEffects\Universal\Universal",16,7,48,1],"","Billboard",1,10,[0,0,20],[0,0,50],0,10,8,0,[50,150,200],[[.1,.1,.1,0.5],[0,0,0,1],[0,0,0,0]],[0.5],1,0,"","",_alias_volcano];
_blow_up setDropInterval 0.05;

_lava_chunks = "#particlesource" createVehicleLocal position _alias_volcano;
_lava_chunks setParticleCircle [_crater_radius/4,[0,0,0]];
_lava_chunks setParticleRandom [4,[_crater_radius/10,_crater_radius/10,10],[80,80,30],0,0.1,[0,0,0,1],1,1];
_lava_chunks setParticleParams [["\A3\data_f\cl_exp",1,0,1],"","Billboard",1,2,[10,0,20],[0,0,60],0,30,6,0,[3,1],[[1,1,1,1],[1,1,1,1]],[1],1,1,"","",_alias_volcano];
_lava_chunks setDropInterval 0.01;

drop [["\A3\data_f\ParticleEffects\Universal\Universal",16,12,9,0],"","BillBoard",1,7,[0,0,20],[0,0,80],0,500,5,0,[100,200,300],[[1,0.7,0,1],[1,0.7,0,1],[0,0,0,0]],[1],1,0,"","",_alias_volcano];
sleep 0.3;
drop [["\A3\data_f\ParticleEffects\Universal\Universal",16,12,9,0],"","BillBoard",1,7,[0,0,10],[0,0,100],0,500,5,0,[100,200,300],[[1,0.7,0,1],[1,0.7,0,1],[0,0,0,0]],[1],1,0,"","",_alias_volcano];

_earth_tremor = selectrandom [["earthquake_03",10],["earthquake_02",25]];
playsound (_earth_tremor#0);
enableCamShake true; addCamShake [0.5,(_earth_tremor#1)*2,25];
sleep 2;
deletevehicle _lava_chunks;
deletevehicle _blow_up;
if ((position player distance _alias_volcano) < 3000) then {playsound erupt_eko};