// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

fnc_blood ={
	private ["_spot","_blood_splash"]; 
	_spot = _this select 0;
	_blood_splash = "#particlesource" createVehicleLocal (getPosATL _spot);
	_blood_splash setParticleCircle [0,[0,0,0]];
	_blood_splash setParticleRandom [0.1,[0.2,0.2,0.2],[0,0,0.1],0,0.2,[0,0,0,0.1],1,0];
	_blood_splash setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d", 16,13,1],"","Billboard",1,0.15,[0,0,0],[0,0,0],2,10,7.9,0,[0.2,0.8],[[1,0,0.1,1],[1,1,0.1,1]],[1],1,0,"","",_spot];
	_blood_splash setDropInterval 0.2;
	sleep 10;
	deleteVehicle _blood_splash;
};

fnc_meat = {
	params ["_splash_point"]; private ["_splash_point"];
	_meat_pieces = "#particlesource" createVehicleLocal (getPosATL _splash_point);
	_meat_pieces setParticleCircle [1,[0, 0, 0]];
	_meat_pieces setParticleRandom [0.2,[0.5,0.5,0.2],[0,0,0],0,0.5,[0,0,0,0.1],1,0];
	_meat_pieces setParticleParams [["\A3\data_f\ParticleEffects\Universal\Meat_ca.p3d",1,0,1],"","SpaceObject",1,15,[0,0,0.1],[0,0,0],0,19,7.9, 0.1,[4,4],[[1,0.1,0.1,1],[0,0,0,1]],[1],1,0, "", "", _splash_point,0,true,1,[[0,0,0,0]]];
	_meat_pieces setDropInterval 0.03;
	[_meat_pieces] spawn {_meat_pieces = _this select 0; sleep 1; deleteVehicle _meat_pieces};
};

private ["_hives"];

if (!hasInterface) exitWith {};
params ["_splash_point","_hives"];
if (!alive _hives) exitWith {};

_pct_unit=["spine3","leftshoulder","leftforearmroll","leftleg","leftfoot","leftupleg","rightshoulder","rightforearmroll","rightupleg","rightleg","rightfoot","pelvis","neck","leftforearm", "rightforearm"];
_fire_obj_unit = [];{_part_fire = "Land_HelipadEmpty_F" createVehiclelocal [0,0,0]; _part_fire attachTo [_splash_point,[0,0,0],_x];_fire_obj_unit pushBack _part_fire;} forEach _pct_unit;
{[_x] spawn fnc_blood} foreach _fire_obj_unit;
(_fire_obj_unit # 0) say3D ["eating",300]; _splash_point say3d ["strigat_92",300];

if (!alive _splash_point) then {[_splash_point] call fnc_meat};
sleep 13;
{deleteVehicle _x} forEach _fire_obj_unit;