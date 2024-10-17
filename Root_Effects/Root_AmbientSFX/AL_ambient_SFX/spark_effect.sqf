// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

private ["_lamp","_altitude"];

if (!hasInterface) exitWith {};

_lamp = _this select 0;
_paz_emit = _this select 1;
_altitude = _this select 2;

_lamp setPosATL [getPosATL _lamp select 0, getPosATL _lamp select 1, _altitude];

if (player distance _lamp < 200) then {
_bbr = boundingBoxReal vehicle _lamp;
_p1 = _bbr select 0;
_p2 = _bbr select 1;
_maxHeight = abs ((_p2 select 2) - (_p1 select 2));

_spark_poz_rel = (_maxHeight/2)-0.45;

_sparky_sun = ["spark1","spark3","spark11","spark2","spark22","spark5","spark4"] call BIS_fnc_selectRandom;
_spark_type = ["white","orange"] call BIS_fnc_selectRandom;

_drop = 0.001+(random 0.05);

_scantei_spark = "#particlesource" createVehicleLocal (getPosATL _lamp);

if (_spark_type=="orange") then 
{
	_scantei_spark setParticleCircle [0, [0, 0, 0]];
	_scantei_spark setParticleRandom [1, [0.1, 0.1, 0.1], [0, 0, 0], 0, 0.25, [0, 0, 0, 0], 0, 0];
	_scantei_spark setParticleParams [["\A3\data_f\proxies\muzzle_flash\muzzle_flash_silencer.p3d", 1, 0, 1], "", "SpaceObject", 1, 1+(random 2), [0, 0,_spark_poz_rel], [0, 0, 0], 0, 15, 7.9, 0, [0.3,0.3,0.05], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0]], [0.08], 1, 0, "", "", _lamp,0,true,0.3,[[0,0,0,0]]];
	_scantei_spark setDropInterval _drop;

	_lamp say3D [_sparky_sun, 350];
	uiSleep _paz_emit;
	deleteVehicle _scantei_spark;
} else
	{
		_scantei_spark setParticleCircle [0, [0, 0, 0]];
		_scantei_spark setParticleRandom [1, [0.05, 0.05, 0.1], [5, 5, 3], 0, 0.0025, [0, 0, 0, 0], 0, 0];
		_scantei_spark setParticleParams [["\A3\data_f\proxies\muzzle_flash\muzzle_flash_silencer.p3d", 1, 0, 1], "", "SpaceObject", 1, 1+(random 2), [0, 0,_spark_poz_rel], [0, 0, 0], 0, 20, 7.9, 0, [0.3,0.3,0.05], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0]], [0.08], 1, 0, "", "", _lamp,0,true,0.3,[[0,0,0,0]]];
		_scantei_spark setDropInterval 0.001;	
		_lamp say3D [_sparky_sun, 350];
		uiSleep 0.1 +(random 0.4);
		deleteVehicle _scantei_spark;
	};
};