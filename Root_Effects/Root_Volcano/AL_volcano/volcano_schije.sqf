// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

if (!hasInterface) exitWith {};
params ["_alias_volcano","_crater_radius"];
[_alias_volcano,player] say3d [erupt_s,5000];

_blow_up = "#particlesource" createVehicleLocal getPosATL _alias_volcano;
_blow_up setParticleCircle [_crater_radius/3,[0,0,0]];
_blow_up setParticleRandom [0,[0,0,0],[50,50,20],0,0,[0,0,0,0],1,0];

_blow_up setParticleParams [["\a3\Data_f\ParticleEffects\Universal\Universal",16,7,48,1],"","Billboard",1,10,[0,0,20],[0,0,50],0,10,8,0,[50,150,200],[[.1,.1,.1,0.5],[0,0,0,1],[0,0,0,0]],[0.5],1,0,"","",_alias_volcano];
_blow_up setDropInterval 0.02;

_bolovani = "#particlesource" createVehicleLocal getPosATL _alias_volcano;
_bolovani setParticleCircle [_crater_radius/3,[0,0,0]];
_bolovani setParticleRandom [5,[10,10,50],[100,100,50],0.5,0.5,[0,0,0,1],1,0];
if (selectrandom [true,false]) then {
			[] spawn {
				trail_evo=0;
				while {trail_evo<50} do {trail_evo=trail_evo+1; sleep 0.3	}
			};
			_bolovani setParticleParams [["\A3\data_f\ParticleEffects\Universal\Mud.p3d",1,0,1],"","SpaceObject",0.05,7,[0,0,0],[0,0,150],1,1000,5,0,[8,8,.1],[[0,0,0,1],[0,0,0,1],[0.5,0.5,0.5,1]],[0.125],1,0,"\Root_Effects\Root_Volcano\AL_volcano\volcano_rock_trail.sqf","", _alias_volcano]
		} else {
			_bolovani setParticleParams [["\A3\data_f\ParticleEffects\Universal\Mud.p3d",1,0,1],"","SpaceObject",1,7,[0,0,0],[0,0,150],1,1000,5,0,[8,8,.1],[[0,0,0,1],[0,0,0,1],[0.5,0.5,0.5,1]],[0.125],1,0,"","", _alias_volcano]
		};
_bolovani setDropInterval 0.05;
sleep 0.5;
_earth_tremor = selectrandom [["earthquake_03",10],["earthquake_02",25]];
playsound (_earth_tremor#0);
enableCamShake true; addCamShake [0.5,(_earth_tremor#1)*2,25];
sleep 1;
deletevehicle _bolovani;
sleep 1;
deletevehicle _blow_up;
if ((position player distance _alias_volcano) < 3000) then {playsound erupt_eko};