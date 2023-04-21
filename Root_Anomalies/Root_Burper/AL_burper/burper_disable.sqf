// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

if (!hasInterface) exitWith {};

_obj_neutr = _this select 0;

if (player distance _obj_neutr < 300) then {

playsound "device_puls";
addCamShake [1,8,33+(random 33)];

_neutr_eff = "#particlesource" createVehicleLocal (getPosATL _obj_neutr);
_neutr_eff setParticleCircle [0, [0, 0, 0]];
_neutr_eff setParticleRandom [0, [0,0, 0], [0,0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
_neutr_eff setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 1.7, [0, 0, 0], [0, 0, 0], 7, 10, 7.9, 0.007, [2,50,2],[[1,1,1,1],[1,1,1,1],[1,1,1,1]], [0.08], 1, 0, "", "", _obj_neutr];
_neutr_eff setDropInterval 1.5;

sleep 4;
deleteVehicle _neutr_eff;
};