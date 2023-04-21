// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 


_blow_up = "#particlesource" createVehicleLocal [_this select 0,_this select 1,_this select 2];
_blow_up setParticleCircle [20,[0,0,0]];
_blow_up setParticleRandom [0,[0,0,0],[50,50,0],0,0,[0,0,0,0],0,0];
_blow_up setParticleParams [["\A3\data_f\cl_basic.p3d",1,0,1],"","Billboard",1,10,[0,0,0],[0,0,30],3,150,1,0,[50,100,150],[[.1,.1,.1,1],[0,0,0,1],[0,0,0,0]],[1000],1,0,"","",[_this select 0,_this select 1,_this select 2]];
_blow_up setDropInterval 0.005;

_earth_tremor = selectrandom [["earthquake_03",10],["earthquake_02",25]];
playsound (_earth_tremor#0);
enableCamShake true; addCamShake [0.5,(_earth_tremor#1)*2,25];
sleep 0.5;
deletevehicle _blow_up;
sleep 1.5;
if ((position player distance _this) < 3000) then {playsound erupt_eko};