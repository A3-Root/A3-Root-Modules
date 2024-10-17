// RAGDOLL inspired by Killzone_Kid *****************************
// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

params ["_blowpoz","_unit"];
private ["_tip","_al_pressure"];

_al_pressure = 5 + round (random 5);
_tip = selectrandom ["tip_01","tip_02","tip_03","tip_04","tip_05","tip_05"];
_dir_blo = (_blowpoz vectorFromTo (_unit getRelPos [30,0])) vectorMultiply _al_pressure;
_rag = "Land_PenBlack_F" createVehicle [0,0,0];
_rag attachTo [_unit,[0,0,0],"Spine3"];
_unit setVelocityModelSpace [_dir_blo # 0,_dir_blo # 1,_al_pressure];
sleep 0.1;
_unit allowDamage false;
_rag setMass 1e10;
_rag setVelocityModelSpace [_dir_blo # 0,_dir_blo # 1,_al_pressure];
sleep 0.01;
detach _rag;
0 = [_rag,_unit] spawn {
	params ['_rag','_tgt'];
	sleep 0.5;
	deleteVehicle _rag;
	waitUntil {vectorMagnitude velocity _tgt < 0.1};
	_tgt allowDamage true;
};
sleep 0.2;
[_unit,[_tip,300]] remoteExec ["say3d"];