// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

if (!hasInterface) exitWith {};

_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
explozie_end = "\Root_Anomalies\Root_Steamer\sound\explozie_3.ogg";

params ["_steamer_poz"];

enableCamShake true;
playSound3D ["\Root_Anomalies\Root_Steamer\sound\explozie_3.ogg", "", false, [_steamer_poz # 0, _steamer_poz # 1, 10],7,5,1];
_blast_dust = "#particlesource" createVehicleLocal _steamer_poz;
_blast_dust setParticleCircle [3,[-5,-5,0]];
_blast_dust setParticleRandom [0.1,[2,2,0],[-10,-10,0],5,0.1,[0,0,0,0.1],1,0.5];
_blast_dust setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02.p3d",8,0,40,1],"","Billboard",1,5,[0,0,0],[0,0,0.1],0,10,7.9,0,[10,30],[[0.3,0.27,0.15,0.3],[0.3,0.27,0.15,0]],[0.5],1,0.5,"","",_steamer_poz];
_blast_dust setDropInterval 0.001;
[_blast_dust] spawn {params ["_sterg"]; sleep 0.1; deleteVehicle _sterg};

_palarie = "#particlesource" createVehicleLocal _steamer_poz;
_palarie setParticleCircle [10,[0,0,0]];
_palarie setParticleRandom [0.1,[0,0,0],[0,0,0],1,0.1,[0,0,0,0],0,0];
_palarie setParticleParams [["\A3\data_f\cl_basic",1,0,1],"","Billboard",1,7,[0,0,0],[0,0,5],13,8,7,0.05,[5,10,15],[[1,1,1,0.5],[1,1,1,0.3],[1,1,1,0]],[1],1,0,"","",_steamer_poz];
_palarie setDropInterval 0.001;	
[_palarie] spawn {params ["_sterg"]; sleep 0.1; deleteVehicle _sterg};

_steam = "#particlesource" createVehicleLocal _steamer_poz;
_steam setParticleCircle [15,[0,0,0]];
_steam setParticleRandom [1,[10,10,0],[0,0,0],1,0.5,[0,0,0,1],0,0];
_steam setParticleParams [["\A3\data_f\cl_basic",1,0,1],"","Billboard",1,12,[0,0,0],[0,0,0],3,9,7,0.1,[10,15,20],[[1,1,1,0],[1,1,1,0.1],[1,1,1,0]],[1],1,0,"","",_steamer_poz];
_steam setDropInterval 0.01;	
[_steam] spawn {params ["_sterg"]; sleep 0.5; deleteVehicle _sterg};

if (player distance _steamer_poz < 200) then {addCamShake [5,2,5]};

sleep 1.5;

_palarie = "#particlesource" createVehicleLocal _steamer_poz;
_palarie setParticleCircle [10,[0,0,0]];
_palarie setParticleRandom [0.1,[0,0,0],[0,0,0],1,0.1,[0,0,0,0],0,0];
_palarie setParticleParams [["\A3\data_f\cl_basic",1,0,1],"","Billboard",1,5,[0,0,0],[0,0,5],13,8,7,0.05,[10,15,20],[[1,1,1,0],[1,1,1,0.1],[1,1,1,0]],[1],1,0,"","",_steamer_poz];
_palarie setDropInterval 0.001;	
[_palarie] spawn {params ["_sterg"]; sleep 0.1; deleteVehicle _sterg};