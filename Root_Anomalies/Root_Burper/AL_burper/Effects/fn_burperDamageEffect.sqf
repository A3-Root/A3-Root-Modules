// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 
	
if (!hasInterface) exitWith {};

params ["_splash_point"];

_blood_splash = "#particlesource" createVehicleLocal (getPosATL _splash_point);
_blood_splash setParticleCircle [0, [0, 0, 0]];
_blood_splash setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_blood_splash setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 13, 1], "", "Billboard", 1, 0.5, [0, 0, 0], [0, 0, 0.5], 2, 10, 7.9, 0.075, [1, 3, 7], [[1, 0, 0.1, 1], [1, 0, 0.1, 1],[1, 1, 0.1, 0]], [0.08], 1, 0, "", "",_splash_point];
_blood_splash setDropInterval 60;

sleep 0.1;

_meat_pieces = "#particlesource" createVehicleLocal (getPosATL _splash_point);
_meat_pieces setParticleCircle [0, [0, 0, 0]];
_meat_pieces setParticleRandom [0, [0.25, 0.25, 0.25], [9, 9, 10], 0, 1.5, [0, 0, 0, 0.1], 0, 0];
_meat_pieces setParticleParams [["\A3\data_f\ParticleEffects\Universal\Meat_ca.p3d", 1, 0, 1], "", "SpaceObject", 1, 10, [0, 0, 0], [0, 0, 0.75], 0, 19, 7.9, 0.1, [2, 2, 2], [[1, 0.1, 0.1, 1], [1, 0.25, 0.25, 0.5], [1, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _splash_point,/*bounce*/0,true,0.25,[[0,0,0,0]]];
_meat_pieces setDropInterval 0.005;

sleep 0.2;
deleteVehicle _meat_pieces;
sleep 1;
deleteVehicle _blood_splash;