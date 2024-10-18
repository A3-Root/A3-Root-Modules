// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

private [
"_object_name","_slide_vel","_slide_dist","_bounce_speed","_bounce_altitude","_rot_vel","_rot_dir","_al_rock",
"_roll_vel","_orbit_radius","_obrit_speed","_orbit_clock_wise","_dist_dependent","_poz_obj","_alt_obj"
];

if (!hasInterface) exitWith {};

_object_name	=_this select 0;
_al_rock = _this select 0;

_slide_move		=_this select 1;
_slide_vel		=_slide_move select 0;
_slide_dist		=_slide_move select 1;

_bounce_move	=_this select 2;
_bounce_speed	=_bounce_move select 0;
_bounce_altitude=_bounce_move select 1;

_rot_move		=_this select 3;
_rot_vel		=_rot_move select 0;
_rot_dir		=_rot_move select 1;

_roll_vel		=_this select 4;

_orbit_move		=_this select 5;
_orbit_radius	=_orbit_move select 0;
_obrit_speed	=_orbit_move select 1;
_orbit_clock_wise=_orbit_move select 2;

_dist_dependent	=_this select 6;
_poz_obj		=_this select 7;
_alt_obj		=_this select 8;

_allow_damage = _this select 9;
_allow_simulation = _this select 10;

// _al_rock = _object_name createVehicleLocal _poz_obj;
// _al_rock = _object_name createVehicle _poz_obj;
// { _x addCuratorEditableObjects [[_al_rock], true];/ } foreach allCurators;

_poz_obj = [getposATL _al_rock select 0,getposATL _al_rock select 1,_alt_obj];
_al_rock setPosATL _poz_obj;

_al_rock allowDamage _allow_damage;
_al_rock enableSimulationGlobal _allow_simulation;

if (_slide_vel>0) then 
{
	[_al_rock,_slide_vel,_slide_dist,_dist_dependent,_poz_obj] spawn 
	{
		_al_slide		=_this select 0;
		_al_slide_vel	=_this select 1;
		_al_slide_dist	=_this select 2;
		_al_dependent	=_this select 3;
		_al_poz_ini		=_this select 4;
		
		_uiSleep_slide = 0.01;
		_dir_slide	= getDir _al_slide;
		
		while {true} do 
		{
			while {(player distance _al_slide) < _al_dependent} do
			{
				_incr=0;
				while {_incr<_al_slide_dist} do 
				{
					_incr=_incr+_al_slide_vel;
					_new_poz=[_al_poz_ini, _incr, _dir_slide] call BIS_fnc_relPos;
					_al_slide setposATL _new_poz;
					uiSleep _uiSleep_slide;
				};
				
				while {_incr>0} do 
				{
					_incr=_incr-_al_slide_vel;
					_new_poz=[_al_poz_ini, _incr, _dir_slide] call BIS_fnc_relPos;
					_al_slide setposATL _new_poz;			
					uiSleep _uiSleep_slide;
				};
			};	
			waitUntil {(player distance _al_slide) < _al_dependent};
		};
	};
};

if (_bounce_speed>0) then 
{
	[_al_rock,_bounce_speed,_bounce_altitude,_dist_dependent,_poz_obj,_alt_obj] spawn 
	{
		_al_rock_loc		 =_this select 0;
		_al_rock_bounce_speed=_this select 1;
		_al_bounce_distance	 =_this select 2;
		_al_dist_dependent	 =_this select 3;
		_al_poz_ini			 =_this select 4;
		_al_alt_obj			 =_this select 5;
		
		_uiSleep_bounce = 0.01;
		_alt_max = ceil (_al_alt_obj + _al_bounce_distance);
		_alt_min = ceil (_al_alt_obj - _al_bounce_distance);

		while {true} do
		{
			while {(player distance _al_rock_loc) < _al_dist_dependent} do 
			{
				_fct_float =(getposATL _al_rock_loc select 2);
				while {_fct_float<_alt_max} do 
				{
				 _fct_float =_fct_float + _al_rock_bounce_speed;
				 _al_rock_loc setPosATL [_al_poz_ini select 0, _al_poz_ini select 1, _fct_float];
				 uiSleep _uiSleep_bounce;
				};
				
				while {_fct_float>_alt_min} do
				{
				 _fct_float =_fct_float - _al_rock_bounce_speed;
				 _al_rock_loc setPosATL [_al_poz_ini select 0, _al_poz_ini select 1, _fct_float];
				 uiSleep _uiSleep_bounce;
				};		
			};
			waitUntil {(player distance _al_rock_loc) < _al_dist_dependent};
		};
	};
};

if (_rot_vel>0) then 
{
	[_al_rock,_rot_vel,_rot_dir,_dist_dependent] spawn 
	{
		_al_rot				=_this select 0;
		_vit_rot			=_this select 1;
		_dir_rot			=_this select 2;
		_al_dist_dependent	=_this select 3;	
		_ii=0;		
		if (!_dir_rot) then {_vit_rot=(-1)*_vit_rot};

		while {true} do 
		{
			while {(player distance _al_rot) < _al_dist_dependent} do 
			{
				_al_rot setDir _ii;
				uiSleep 0.01;
				_ii=_ii+_vit_rot;
				if (_ii==360) then {_ii=0};
				if (_ii==0) then {_ii=360};
			};
			waitUntil {(player distance _al_rot) < _al_dist_dependent};
		};	
	};
};

if (_roll_vel>0) then 
{
	[_al_rock,_roll_vel,_dist_dependent] spawn 
	{
		_al_rost			= _this select 0;
		_al_rost_vit		= _this select 1;
		_al_dist_dependent	= _this select 2;
		
		_xx = 0;
		
		while {true} do 
		{
			while {(player distance _al_rost) < _al_dist_dependent} do 
			{
				while {_xx <= 86.01} do 
				{
					[_al_rost,_xx, 0] call BIS_fnc_setPitchBank;
					_xx = _xx+0.1;
					uiSleep _al_rost_vit;
				};
				uiSleep random 0.2;
				while {_xx > 0.1} do 
				{
					[_al_rost,_xx, 0] call BIS_fnc_setPitchBank;
					_xx = _xx-0.1;
					uiSleep _al_rost_vit;
				};
				uiSleep 0.01;
			};
			waitUntil {(player distance _al_rost) < _al_dist_dependent};
		};
	};
};

if (_orbit_radius>0) then 
{
	[_al_rock,_orbit_radius,_obrit_speed,_orbit_clock_wise,_dist_dependent] spawn
	{
		_al_orbit			=_this select 0;
		_al_orbit_radius	=_this select 1;
		_al_obrit_speed		=_this select 2;
		_al_clock_wise		=_this select 3;
		_al_dist_dependent	=_this select 4;
		
		_center = [getposAtL _al_orbit select 0,getposAtL _al_orbit select 1];
		_al_alt_obj = getPosASL _al_orbit;
		
		private ["_rr","_fct"];
		if (_al_clock_wise) then {_rr=0; _fct = 1} else {_rr=360;_fct = -1};

		if (_al_clock_wise) then {
		while {true} do 
		{
			while {(player distance _al_orbit) < _al_dist_dependent} do
			{
				_pos_umbla = [_center,_al_orbit_radius,_rr] call BIS_fnc_relPos;
				_al_orbit setPosAsL [_pos_umbla select 0,_pos_umbla select 1,_al_alt_obj select 2];
				_rr =_rr + _fct*_al_obrit_speed;
				uiSleep 0.01;
				if (_rr==360) then {_rr=0};
			};
			waitUntil {(player distance _al_orbit) < _al_dist_dependent};
		};
		} else
		{
		while {true} do 
		{
			while {(player distance _al_orbit) < _al_dist_dependent} do 
			{
				_pos_umbla = [_center,_al_orbit_radius,_rr] call BIS_fnc_relPos;
				_al_orbit setPosASL [_pos_umbla select 0,_pos_umbla select 1,_al_alt_obj select 2];
				
				_rr =_rr + _fct*_al_obrit_speed;
				if (_rr==0) then {_rr=360};	
				uiSleep 0.01;
			};
			waitUntil {(player distance _al_orbit) < _al_dist_dependent};
		}
		};
	};
};