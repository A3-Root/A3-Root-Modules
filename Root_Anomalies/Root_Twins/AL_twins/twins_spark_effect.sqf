// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

if (!hasInterface) exitWith {};

_obj_emit = _this select 0;
_paz_emit = _this select 1;
//_repeat	  = _this select 2;

_sparky_sun = ["spark1","spark11","spark2","spark22","spark5","spark4"] call BIS_fnc_selectRandom;
//[_obj_emit,[_sparky_sun,300]] remoteExec ["say3d"];

_spark_type = ["white","orange"] call BIS_fnc_selectRandom;
//if (_repeat=="spark3") then {_spark_type=="white"};

_drop = 0.001+(random 0.05);
_scantei_spark = "#particlesource" createVehicleLocal (getPosATL _obj_emit);

if (_spark_type=="orange") then 
{
	_scantei_spark setParticleCircle [0, [0, 0, 0]];
	_scantei_spark setParticleRandom [2, [0.1, 0.1, 0.1], [0, 0, 0], 0, 0.25, [0, 0, 0, 0], 0, 0];
	_scantei_spark setParticleParams [["\A3\data_f\proxies\muzzle_flash\muzzle_flash_silencer.p3d", 1, 0, 1], "", "SpaceObject", 1, 1.5, [0, 0, 0], [0, 0, 0], 0, 15, 7.9, 0, [2, 2, 1], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0.5]], [0.08], 1, 0, "", "", _obj_emit];
	_scantei_spark setDropInterval _drop;

	_obj_emit say3D [_sparky_sun, 350];
	sleep _paz_emit;
	deleteVehicle _scantei_spark;
} else
	{
		//hint "alb";
		_scantei_spark setParticleCircle [0, [0, 0, 0]];
		_scantei_spark setParticleRandom [1, [0.05, 0.05, 0.1], [5, 5, 3], 0, 0.0025, [0, 0, 0, 0], 0, 0];
		_scantei_spark setParticleParams [["\A3\data_f\proxies\muzzle_flash\muzzle_flash_silencer.p3d", 1, 0, 1], "", "SpaceObject", 1, 1.5, [0, 0, 0], [0, 0, 0], 0, 20, 7.9, 0, [1, 1, 0.5], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0.5]], [0.08], 1, 0, "", "", _obj_emit];
		_scantei_spark setDropInterval 0.001;	
		
		_obj_emit say3D [_sparky_sun, 350];
		sleep 0.1 +(random 0.4);
		deleteVehicle _scantei_spark;
	};