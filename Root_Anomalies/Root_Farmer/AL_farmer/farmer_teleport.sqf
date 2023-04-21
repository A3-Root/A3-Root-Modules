// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

if (!hasInterface) exitWith {};
_crater = _this#0;
enableCamShake true;

_ground = "#particlesource" createVehicleLocal (getpos _crater);
_ground setParticleCircle [2,[0,0,0]];
_ground setParticleRandom [0,[0.2,0.2,0],[0,0,0],0,0.5,[0,0,0,0],0,0];
_ground setParticleParams [["\A3\data_f\ParticleEffects\Universal\Mud.p3d",1,0,1],"","SpaceObject",1,20,[0,0,0],[0,0,0.1],0,20,7.9,0,[1.5,0.1],[[0,0,0,1],[0,0,0,0]],[1],0,0,"","",_crater,0,true,0.1,[[0,0,0,0]]];
_ground setDropInterval 0.05;
[_ground] spawn {_de_sters=_this#0;sleep 0.5;deleteVehicle _de_sters};

_pamant = "#particlesource" createVehicleLocal (getpos _crater);
_pamant setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal",16,12,9,0],"","BillBoard",1,3,[0,0,1],[0,0,10],0,50,0.01,0,[5,20],[[0.1,0.1,0.1,1],[0.1,0.1,0.1,0]],[1000],1,0,"","",_crater];
_pamant setParticleRandom [0.5,[1,1,0.5],[1,1,2],20,0.1,[0,0,0,0.5],1,0,1,0];
_pamant setParticleCircle [0,[0,0,0]];
_pamant setDropInterval 0.2;
[_pamant] spawn {_de_sters = _this select 0;sleep 0.5;deleteVehicle _de_sters};

_blast_wave = "#particlesource" createVehicleLocal (getpos _crater);
_blast_wave setParticleCircle [0,[-0.2,-0.2,0]];
_blast_wave setParticleRandom [0.1,[0.3,0.3,0.5],[0.2,0.2,0.5],0,0.1,[0,0,0,0.1],1,0];
_blast_wave setParticleParams [["\A3\data_f\cl_basic",1,0,1],"","Billboard",1,5,[0,0,0.3],[0,0,2],5,10,7,1,[5,10],[[0.05,0.04,0.03,1],[0.05,0.04,0.03,0]],[1],1,0,"","",_crater];
_blast_wave setDropInterval 0.1;
[_blast_wave] spawn {_de_sters = _this select 0;sleep 0.5; deleteVehicle _de_sters};

_bolovani = "#particlesource" createVehicleLocal (getpos _crater);
_bolovani setParticleCircle [1,[-5,-5,0]];
_bolovani setParticleRandom [0.1,[1,1,0],[5,5,5],0,0.2,[0,0,0,1],1,0];
_bolovani setParticleParams [["\A3\data_f\ParticleEffects\Universal\Mud.p3d",1,0,1],"","SpaceObject",1,10,[0,0,0],[0,0,10],2,200,5,3,[0.5,0.5,0.5],[[0,0,0,1],[0,0,0,1],[0,0,0,0]],[1],1,0,"","",_crater,round (random 360),true,0.1];
_bolovani setDropInterval 0.05;	
[_bolovani] spawn {params ["_sterg"]; sleep 0.5; deleteVehicle _sterg};
_pp = linearConversion [0,100,player distance _crater,5,0,true];
addCamShake [_pp,2,30];