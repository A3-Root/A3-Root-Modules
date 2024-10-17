// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

if (!hasInterface) exitWith {};

private ["_press_implicit_x","_press_implicit_y","_dir_salt","_fct_z","_al_pressure","_noseize"];

_strigoi	= _this select 0;
_tgt_casp	= _this select 1;
_noseize	= _this select 2;

// if (_noseize == true) exitWith {};

_flow = (getposasl _tgt_casp vectorFromTo getposasl _strigoi) vectorMultiply 10;

_en_field = "#particlesource" createVehicleLocal (getPosASL _tgt_casp);
_en_field setParticleCircle [0,[0,0,0]];
_en_field setParticleRandom [0,[0.3,0.3,0.3],[0,0,0.3],0,0,[0,0,0,0],0,0];
_en_field setParticleParams [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,0.3,[0,0,0],[_flow select 0,_flow select 1,_flow select 2],1,10.5,7.9,0.0001,[2,0.5],[[1,1,1,0.3],[1,1,1,0]],[1],0,0,"","",_tgt_casp];
_en_field setDropInterval 0.05;

_en_cloud = "#particlesource" createVehicleLocal (getPosASL _tgt_casp);
_en_cloud setParticleCircle [0,[0,0,0]];
_en_cloud setParticleRandom [0.5,[0.3,0.3,1],[0,0,0.3],0.5,0,[0,0,0,0],0,0];
_en_cloud setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",1,0.5,[0,0,0],[_flow select 0,_flow select 1,_flow select 2],1,10.5,7.9,0.0001,[3,1,0.1],[[1,1,1,1],[1,1,1,1],[1,1,1,0]],[1],0,0,"","",_tgt_casp];
_en_cloud setDropInterval 0.03;

uiSleep 0.5;
deleteVehicle _en_field;
deleteVehicle _en_cloud;