// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

// #include "\Root_Effects\Root_Battlescripts\ALambientbattle\battle_functions.hpp"

if (!hasInterface) exitWith {};

params ["_art_object_name", "_range_art", "_ground_damage", "_ground_speed", "_ground_type", "_sound_only"];

_art_object  = "land_helipadempty_f" createVehiclelocal getpos _art_object_name;
_li_art = "#lightpoint" createVehicleLocal getpos _art_object;

while {(al_art) and (!isNull _art_object_name)} do 
{
	sleep _ground_speed;
	
	_rel_Pos= [getPos _art_object_name,random _range_art, random 360] call BIS_fnc_relPos;

	if (_sound_only) then 
	{
		_art_object setPos _rel_Pos;
		_ground_sound = ["explosion_1","explosion_2","explosion_3","explosion_4"] call BIS_fnc_selectRandom;
		_art_object say3D [_ground_sound,2000];
	} else 
	{
		_bomb = _ground_type createVehicle _rel_Pos;
		[_bomb, -90, 0] call BIS_fnc_setPitchBank;
		_bomb setVelocity [0,0,-100];
	};
};

/*
_art_object setPos _rel_Pos;
		_fum = "#particlesource" createVehicleLocal getpos _art_object;
		_fum setParticleCircle [0, [0, 0, 0]];
		_fum setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
		_fum setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 7, [0, 0, 0], [0, 0, 1], 30, 0.01, 0.007, 0, [10,30,40], [[1, 1, 1, 1], [0, 0, 0, 0.5], [.5, .5, .5, 0]], [0.08], 1, 0, "", "", _art_object];
		_fum setDropInterval 0.05;
		_intens_li = 500+random 500;
		_li_art setpos getpos _art_object;
		_li_art setLightAttenuation [_range_art,50+random 100,50,0,random 5,_range_art];  
		_li_art setLightIntensity _intens_li;
		_li_art setLightDayLight true;	
		_li_art setLightUseFlare true;
		_li_art setLightFlareSize 30;
		_li_art setLightFlareMaxDistance 2000;
		_li_art setLightAmbient[1, 0.5, 0];
		_li_art setLightColor[1, 0.5, 0];
		while {_intens_li>0} do {
			_li_art setLightIntensity _intens_li;
			_intens_li = _intens_li-10;
			sleep 0.001;
		};
		deleteVehicle _fum;
		_li_art setLightIntensity 0;
*/

/*
			{
				[_x, _x, {_this allowDamage false}] remoteExec ["SYNC_FNC_EXEC_AND_LOCK", _x];
			} forEach _nearbyunits;
			waitUntil {sleep 0.1; [_nearbyunits] call SYNC_FNC_ALL_LOCKED};
			{
				[_x] call SYNC_FNC_UNLOCK;
			} forEach _nearbyunits;
*/


/*
_nearbyunits = (_rel_Pos nearEntities [["CAManBase", "LandVehicle"], (_range_art + 5)]) inAreaArray [_rel_Pos, _range_art, _range_art, 0, false, 10];
			diag_log format ["Nearby Units: %1", _nearbyunits];
			{_x allowDamage false;} forEach _nearbyunits;
			_bomb = _ground_type createVehicle _rel_Pos;
			[_bomb, -90, 0] call BIS_fnc_setPitchBank;
			_bomb setVelocity [0,0,-100];
			{_x allowDamage true;} forEach _nearbyunits;
*/

/*
if (_islethal == false) then 
		{
			_bomb = _ground_type createVehicle _rel_Pos;
			[_bomb, -90, 0] call BIS_fnc_setPitchBank;
			_bomb setVelocity [0,0,-100];
		} else 
		{
			_nearbyunits = (_rel_Pos nearEntities [["CAManBase", "LandVehicle"], (_range_art + 5)]) inAreaArray [_rel_Pos, _range_art, _range_art, 0, false, 10];
			{_x allowDamage false;} forEach _nearbyunits;
			_bomb = _ground_type createVehicle _rel_Pos;
			[_bomb, -90, 0] call BIS_fnc_setPitchBank;
			_bomb setVelocity [0,0,-100];
			{_x allowDamage true;} forEach _nearbyunits;
		};
		*/