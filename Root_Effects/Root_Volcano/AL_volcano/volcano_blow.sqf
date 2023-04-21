// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

if (!hasInterface) exitWith {};
params ["_alias_volcano","_crater_radius"];

[_alias_volcano, player] say3d [erupt_s,1];
enableCamShake true; addCamShake [0.5,durata_eruptie,25];

drop [["\a3\Data_f\ParticleEffects\Universal\Universal",16,1,15,1],"","Billboard",0.8,1,[0,0,50],[0,0,100],0,10,8,0,[(_crater_radius/10)*50,(_crater_radius/10)*60,(_crater_radius/10)*2],[[1,1,1,0.5],[1,1,1,1],[1,1,1,1]],[1],1,0,"\Root_Effects\Root_Volcano\AL_volcano\volcano_puf.sqf","",_alias_volcano];
sleep 0.3;
drop [["\a3\Data_f\ParticleEffects\Universal\Universal",16,1,15,0],"","Billboard",1,1,[0,0,50],[0,0,50],0,10,8,0,[(_crater_radius/10)*50,(_crater_radius/10)*60,(_crater_radius/10)*2],[[1,1,1,0],[1,1,1,1],[1,1,1,1]],[1],1,0,"","",_alias_volcano];

_lava = "#particlesource" createVehicleLocal position _alias_volcano;
_lava setParticleCircle [_crater_radius/3,[0,0,0]];
_lava setParticleRandom [1,[0,0,10],[0,0,0],0,0.1,[0,0,0,0],0,0];
_lava setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal",16,12,9,0],"","BillBoard",1,13,[0,0,50],[0,0,50],0,50,7,0,[_crater_radius*3,_crater_radius*8],[[1,0.7,0,1],[0,0,0,0]],[1],1,0,"","",_alias_volcano];
_lava setDropInterval 0.1;
sleep 1;
deletevehicle _lava;
_earth_tremor = selectrandom ["earthquake_03","earthquake_02"];
playsound _earth_tremor;
enableCamShake true; addCamShake [0.5,durata_eruptie*2,25];

if ((position player distance _alias_volcano) < 3000) then {playsound erupt_eko};