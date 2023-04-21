// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 


private ["_volcano_object","_crater_radius","_lethal"];

if (!hasInterface) exitWith {};
params ["_volcano_object","_crater_radius","_alias_delay","_lethal"];

erup = "\Root_Effects\Root_Volcano\Sound\eruptie_1_eko.ogg";

_li_idle = "#lightpoint" createVehicle getPosATL _volcano_object;
_li_idle lightAttachObject [_volcano_object, [0,0,50]];
_li_idle setLightAttenuation [0,0,0,0,40,1000];  
_li_idle setLightIntensity 1500;
_li_idle setLightBrightness 30;
_li_idle setLightDayLight true;	
_li_idle setLightUseFlare true;
_li_idle setLightFlareSize 0;
_li_idle setLightFlareMaxDistance 2000;	
_li_idle setLightAmbient[1,0.2,0.1];
_li_idle setLightColor[1,0.2,0.1];

[_volcano_object] spawn {params ["_volcano_voice"]; while {!isNull _volcano_voice} do {_volcano_voice say3d ["murmur_8",5000]; sleep 60}};

[_li_idle] spawn {_luminafoc = _this select 0; while {!isNull _luminafoc} do {_luminafoc setLightBrightness (59 + random(40)); _luminafoc setLightAttenuation [(1.5 + random(0.5)), (90 + random(10)), (290 + random(10)), 1, (150 + random(100)),1500]; sleep 0.1}; deletevehicle _luminafoc};

_coloana_fum = "#particlesource" createVehicleLocal getPos _volcano_object;
_coloana_fum setParticleCircle [0,[0,0,0]];
_coloana_fum setParticleRandom [7,[30,30,20],[10,10,15],0,0.5,[0,0,0,0.1],1,0];
_coloana_fum setParticleParams [["\a3\Data_f\ParticleEffects\Universal\Universal",16,7,48,1],"","Billboard",1,20,[0,0,30],[0,0,45],0,3,2,0,[50,100,100],[[0,0,0,0.5],[1,1,1,0.5],[0.5,0.5,0.5,0]],[0.5],0.5,0,"","\Root_Effects\Root_Volcano\AL_volcano\volcano_smoke_column.sqf",_volcano_object];
_coloana_fum setDropInterval 0.05;