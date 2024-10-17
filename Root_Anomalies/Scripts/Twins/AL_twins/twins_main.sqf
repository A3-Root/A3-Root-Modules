// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

//null=[object_anomaly,tracking_distance,electric_sparks,damage_range,effect_on_AI] execvm "AL_twins\sparky.sqf"

if (!isServer) exitWith {};

params ["_spark_obj", "_track_dist", "_spark_effect", "_damage_range", "_effect_on_AI", "_EMP_enabled", "_twin_heart", "_isseige"];

private ["_track_dist","_poz_spark", "_isseige"];

_heart_twin = _twin_heart createVehicle [0,0,0];
_heart_twin attachTo [_spark_obj,[-0.5,0,1.5]];

[[_heart_twin],"\Root_Anomalies\Root_Twins\AL_twins\twins_inima.sqf"] remoteExec ["execvm",0];

if (_spark_effect) then {_poz_spark = createVehicle ["Sign_Sphere10cm_F", [0,0,0], [], 0, "CAN_COLLIDE"];[_poz_spark, true] remoteExec ["hideObjectGlobal",0,true]};
if (_effect_on_AI) then {[[_spark_obj,_damage_range],"\Root_Anomalies\Root_Twins\AL_twins\twins_damage_AI.sqf"] remoteExec ["execvm",0];};
_pauza = 5;
[[_spark_obj,_damage_range,_isseige],"\Root_Anomalies\Root_Twins\AL_twins\twins_spark_viz.sqf"] remoteExec ["execvm",0,true];

_spark_obj setVariable ["vizibil", 0, true];

[_spark_obj,_track_dist,_damage_range,_heart_twin,_EMP_enabled,_isseige] spawn 
{
	//waitUntil{!isNil "vizibil"};
	_spark_move = _this select 0;
	_tracking_p	= _this select 1;
	_dam_range	= _this select 2;
	_heart_twin	= _this select 3;
	_EMP_enabled	= _this select 4;
	_isseige	= _this select 5;
	
	_allow_move = 15;
	_closest_units = [];
	_incr = 0;

	_vizibil=true;
	
	while {alive _heart_twin} do 
	{
		//_closest_units = (position _spark_move) nearEntities ["Man", _tracking_p];
		_closest_units = (position _spark_move) nearEntities [["CAManBase", "LandVehicle"], _tracking_p];
		
		
		if (_spark_move getVariable "vizibil"<1) then 
		{
			if ((count _closest_units >0)and(_allow_move>10)) then 
			{
				_closer_un = _closest_units select 0;
				if ((_closer_un distance _spark_move) > _dam_range) then 
				{
				_dir_depl = [_closer_un, _spark_move] call BIS_fnc_dirTo;
				_pos_umbla = [getPosATL _spark_move,_incr,_dir_depl] call BIS_fnc_relPos;
				//hint str _dir_depl;
				_spark_move setPosATL _pos_umbla;
				_spark_move setDir _dir_depl;
				_incr=_incr-(15 + floor(random 11));
				_allow_move = 0;
				};
			};
			_allow_move = _allow_move+3;
			//hint str _allow_move;
		} else {_allow_move =0};
	//hint str (_spark_move getVariable "vizibil");
	sleep 2;
	};
	// EMP effect
	if (_EMP_enabled) then 
	{
		[_spark_move, _isseige, _tracking_p] execvm "\Root_Anomalies\Root_Twins\AL_twins\twins_emp_starter.sqf";
		sleep 2;
	};
	deleteVehicle _spark_move;
	deleteVehicle _heart_twin;
};

if (_spark_effect) then 
{
	while {alive _spark_obj} do 
	{
		_spark_poz_rel =["st","dr","ct"] call BIS_fnc_selectRandom;
		if (_spark_poz_rel=="st") then {_poz_spark attachTo [_spark_obj,[-12,0,12.35]]};
		if (_spark_poz_rel=="dr") then {_poz_spark attachTo [_spark_obj,[11.5,0,12.35]]};
		if (_spark_poz_rel=="ct") then {_poz_spark attachTo [_spark_obj,[-0.3,0,12.2]]};
			
		_spark_obj setDamage 0;
		_sclipiri = 1+ floor (random 5);
		//hint str _sclipiri;
		sleep _pauza;
		_nr = 0;
		while {_nr<_sclipiri} do 
		{
			//_spark_obj setDamage 0.9;		sleep 0.1;		_spark_obj setDamage 0;
			_pauza_intre_sclipiri = 0.1+ (random 2);
			[[_poz_spark,_pauza_intre_sclipiri],"\Root_Anomalies\Root_Twins\AL_twins\twins_spark_effect.sqf"] remoteExec ["execvm"];
			sleep _pauza_intre_sclipiri;
			//_spark_obj setDamage 0.9;
			_nr=_nr+1;
		};
	};
deleteVehicle _poz_spark;
};

