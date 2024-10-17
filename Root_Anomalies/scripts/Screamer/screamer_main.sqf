// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT

fnc_avoid_screamer ={
	private ["_danger_close","_op_dir","_chased_units","_fct","_reldir","_avoid_poz", "_territory","_targets"];
	_danger_close = _this select 0;
	_territory = _this select 1;
	_targets = _this select 2;
	_chased_units = _danger_close nearEntities [_targets, _territory];
	{
		if ((_x isKindOf "LandVehicle") or (_x isKindOf "Air") or (_x isKindOf "CAManBase")) then {
		if (_x != _danger_close) then 
		{
		_reldir = [_x, getPos _danger_close] call BIS_fnc_dirTo;
		_fct = [30,-30] call BIS_fnc_selectRandom;
		if (_reldir<180) then {_op_dir=_reldir+180 +_fct} else {_op_dir=_reldir-180+_fct};
		_avoid_poz = [getposATL _x,30+random 10, _op_dir] call BIS_fnc_relPos;
		_x doMove _avoid_poz;
		_x setSkill ["commanding", 1];
		};
		};
	} foreach _chased_units;
};

fnc_hitpoint_damage = {
	private ["_vehicle", "_damage", "_vichitpoints"];
	_vehicle = _this select 0;
	_damage = _this select 1;
	if (_vehicle isKindOf "Air") then {
		_vehicle addTorque (_vehicle vectorModelToWorld [10,10,10]);
		_vehicle setVelocity [25,-10,-10];
		_vichitpoints = getAllHitPointsDamage _vehicle; _vichitpoints = _vichitpoints select 0;
		{
			_vehicle setHitPointDamage [_x, (_vehicle getHitPointDamage _x) + _damage];
			_damage = random(_damage);
		} foreach _vichitpoints;
		_vehicle setHitPointDamage ["HitLight",1]; 
		_vehicle setHitPointDamage ["#light_l",1];
		_vehicle setHitPointDamage ["#light_r",1];
		_vehicle setHitPointDamage ["#light_l_flare",1];
		_vehicle setHitPointDamage ["#light_r_flare",1];
		_vehicle setHitPointDamage ["#light_1_hitpoint",1];
		_vehicle setHitPointDamage ["light_1_hitpoint",1];
		_vehicle setHitPointDamage ["#light_2_hitpoint",1];
		_vehicle setHitPointDamage ["light_2_hitpoint",1];
		_vehicle setHitPointDamage ["light_l",1]; 
		_vehicle setHitPointDamage ["light_r",1]; 
		_vehicle setHitPointDamage ["light_l2",1]; 
		_vehicle setHitPointDamage ["HitBatteries",1]; 
		_vehicle setHitPointDamage ["light_r2",1];
	} else {
		_vichitpoints = getAllHitPointsDamage _vehicle; _vichitpoints = _vichitpoints select 0;
		{
			_vehicle setHitPointDamage [_x, (_vehicle getHitPointDamage _x) + _damage];
			_damage = random(_damage);
		} foreach _vichitpoints;
		_vehicle setHitPointDamage ["HitLight",1]; 
		_vehicle setHitPointDamage ["#light_l",1];
		_vehicle setHitPointDamage ["#light_r",1];
		_vehicle setHitPointDamage ["#light_l_flare",1];
		_vehicle setHitPointDamage ["#light_r_flare",1];
		_vehicle setHitPointDamage ["#light_1_hitpoint",1];
		_vehicle setHitPointDamage ["light_1_hitpoint",1];
		_vehicle setHitPointDamage ["#light_2_hitpoint",1];
		_vehicle setHitPointDamage ["light_2_hitpoint",1];
		_vehicle setHitPointDamage ["light_l",1]; 
		_vehicle setHitPointDamage ["light_r",1]; 
		_vehicle setHitPointDamage ["light_l2",1]; 
		_vehicle setHitPointDamage ["HitBatteries",1]; 
		_vehicle setHitPointDamage ["light_r2",1];
	};
};

private ["_entitate", "_poz_orig_sc", "_anomaly_vic", "_damage_screamer_close", "_damage_screamer_medium", "_damage_screamer_far", "_screamer_territory", "_screamer_hostiles", "_screamer_radius", "_isvicdmg", "_isaidmg", "_isaipanic", "_grp"];
private ["_screamer_spawn", "_vichitpoints", "_random_close", "_random_medium", "_random_far", "_screamer_targets", "_screamer_dmgs", "_screamer_anomally", "_temp_mass", "_isalivevic", "_valid_statue", "_screamer_health", "_scr_obj"];

if (!isServer) exitWith {};


_poz_orig_sc = _this select 0;
_anomaly_vic = _this select 1;
_damage_screamer_close = _this select 2;
_damage_screamer_medium = _this select 3;
_damage_screamer_far = _this select 4;
_screamer_territory = _this select 5;
_screamer_hostiles = _this select 6;
_screamer_radius = _this select 7;
_isvicdmg = _this select 8;
_isaidmg = _this select 9;
_isaipanic = _this select 10;
_screamer_spawn = _this select 11;
_screamer_health = _this select 12;

_time = 3 + diag_tickTime;

_vichitpoints = [];

waitUntil { diag_tickTime > _time };

_isalivevic = false;
_valid_statue = false;
_scr_obj = "None";

/*
//_entitate disableAI "FSM";
//_entitate allowDamage false;
// damage
//_entitate addEventHandler ["HandleDamage",{_damage = (_this select 2)/6; _damage}];
//_entitate addEventHandler ["HandleDamage",{_damage = 0; _damage}];
*/


if !(isClass (configFile >> "CfgPatches" >> "ace_medical_engine")) then {
    diag_log "******ACE Medical Engine not detected. Using vanilla medical system.";
	_isacemedical = false;
} else {
	_isacemedical = true;
};

_screamer_targets = ["CAManBase", "LandVehicle"];
_screamer_dmgs = ["Man"];

if (_isvicdmg == true) then
{
	_screamer_targets = ["CAManBase", "LandVehicle"];
	_screamer_dmgs = ["Man", "LandVehicle", "Air"];
};


if (getNumber (configFile >> "CfgVehicles" >> _anomaly_vic >> "scope") > 0) then 
{
	if (_anomaly_vic isKindOf "Man") then 
	{ 
		_isalivevic = true; 
	} else 
	{ 
		_isalivevic = false; 
		_valid_statue = true;
	};
} else 
{
	_isalivevic = false;
	_valid_statue = false;
};


if (_isaidmg == true) then 
{
	_grp = createGroup _screamer_spawn;
	if (_isalivevic) then 
	{
		_entitate = _grp createUnit [_anomaly_vic, getmarkerpos _poz_orig_sc, [], 0,"NONE"];
		[_entitate] joinSilent _grp;
	} else 
	{
		_entitate = _grp createUnit ["O_Soldier_VR_F",getmarkerpos _poz_orig_sc, [], 0,"NONE"];
		[_entitate] joinSilent _grp;
		removeUniform _entitate;
		Removevest _entitate;
		removeHeadgear _entitate;
	};
	_entitate setcaptive false; 
} else
{
	_grp = createGroup CIVILIAN;
	if (_isalivevic) then 
	{
		_entitate = _grp createUnit [_anomaly_vic, getmarkerpos _poz_orig_sc, [], 0,"NONE"];
		[_entitate] joinSilent _grp;
	} else 
	{
		_entitate = _grp createUnit ["O_Soldier_VR_F",getmarkerpos _poz_orig_sc, [], 0,"NONE"];
		[_entitate] joinSilent _grp;
		removeUniform _entitate;
		Removevest _entitate;
		removeHeadgear _entitate;
	};
	_entitate setcaptive true; 
	[_entitate, true] remoteExec ["hideObjectGlobal",0,true];
};

_entitate setSpeaker "NoVoice";
_entitate disableConversation true;
_entitate addRating -10000;

RemoveAllItems _entitate;
removeAllWeapons _entitate;
_entitate unassignItem "NVGoggles";
_entitate removeItem "NVGoggles";
_entitate setBehaviour "CARELESS";
_entitate enableFatigue false;
_entitate setSkill ["courage", 1];
_entitate setUnitPos "UP";

_bob1 = createVehicle ["Sign_Sphere25cm_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_bob2 = createVehicle ["Sign_Sphere25cm_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_bob3 = createVehicle ["Sign_Sphere25cm_F", [0,0,0], [], 0, "CAN_COLLIDE"];

[_bob1, true] remoteExec ["hideObjectGlobal",0,true];
[_bob2, true] remoteExec ["hideObjectGlobal",0,true];
[_bob3, true] remoteExec ["hideObjectGlobal",0,true];


if (!_isalivevic) then 
{
	if (_valid_statue) then 
	{
		_screamer_anomally = createVehicle [_anomaly_vic, [0,0,0], [], 0, "CAN_COLLIDE"];
	} else 
	{
		_screamer_anomally = createVehicle ["Land_AncientStatue_01_F", [0,0,0], [], 0, "CAN_COLLIDE"];
	};
	_screamer_anomally attachTo [_entitate, [0, 0.5, 0.5],"spine3"];
	_screamer_anomally setVectorDirAndUp [[0,-1,0],[0,0,1]];
	_screamer_anomally setMass 1;
	_bob1 attachTo [_screamer_anomally, [0, -6, 0.5]];
	_bob2 attachTo [_screamer_anomally, [0, -19, 0.5]];
	_bob3 attachTo [_screamer_anomally, [0, -42, 0.5]];
} else 
{
	_bob1 attachTo [_entitate, [0, -6, 0.5]];
	_bob2 attachTo [_entitate, [0, -19, 0.5]];
	_bob3 attachTo [_entitate, [0, -42, 0.5]];
};

if (_isalivevic) then 
{
	_current_screamer_hp = 1/_screamer_health;
	_entitate setVariable ["al_dam_total", 0];
	_entitate setVariable ["al_dam_incr", _current_screamer_hp];
	_entitate removeAllEventHandlers "hit";

	_entitate addEventHandler ["Hit", {
		_unit=_this#0;
		_curr_dam = (_unit getVariable "al_dam_total")+(_unit getVariable "al_dam_incr"); _unit setVariable ["al_dam_total", _curr_dam];if ((_unit getVariable "al_dam_total")>1) then {
			_unit setDamage 1
		};
		[[_unit], "\Root_Anomalies\Root_Screamer\AL_screamer\screamer_splash_hit.sqf"] remoteExec ["execVM"]
	}];

	_entitate removeAllEventHandlers "Handledamage";

	_entitate addEventHandler ["Handledamage", {
		0
	}];

	_entitate addEventHandler ["Killed", {
		(_this select 0) hideObjectglobal true;
		(_this select 1) addrating 2000
	}];
} else 
{
	_current_screamer_hp = 1/_screamer_health;
	_screamer_anomally setVariable ["al_dam_total", 0];
	_screamer_anomally setVariable ["al_dam_incr", _current_screamer_hp];
	_screamer_anomally removeAllEventHandlers "hit";

	_screamer_anomally addEventHandler ["Hit", {
		_unit=_this#0;
		_curr_dam = (_unit getVariable "al_dam_total")+(_unit getVariable "al_dam_incr"); _unit setVariable ["al_dam_total", _curr_dam];if ((_unit getVariable "al_dam_total")>1) then {
			_unit setDamage 1
		};
		[[_unit], "\Root_Anomalies\Root_Screamer\AL_screamer\screamer_splash_hit.sqf"] remoteExec ["execVM"]
	}];

	_screamer_anomally removeAllEventHandlers "Handledamage";

	_screamer_anomally addEventHandler ["Handledamage", {
		0
	}];

	_screamer_anomally addEventHandler ["Killed", {
		(_this select 0) hideObjectglobal true;
		(_this select 1) addrating 2000
	}];
};

uiSleep 1;

while {alive _entitate} do
{
	_entitate setUnitPos "UP";
	if  (count (_entitate nearEntities [_screamer_targets, _screamer_territory])>1) then {
	_teleport = false;
	
	while {!_teleport and (alive _entitate)} do
	{
		_entitate setUnitPos "UP";
		private ["_press_implicit_y","_press_implicit_x", "_wave_obj", "_anomally_pos", "_bob_pos_1", "_bob_pos_2", "_bob_pos_3", "_pot_tgt", "_poz"];
		if (count (_entitate nearEntities [_screamer_targets, _screamer_territory])<2) then {_teleport=true;};

		_pot_tgt = ((_entitate nearEntities [_screamer_targets, _screamer_territory]) select { ((side _x) in _screamer_hostiles) && (typeOf _x != "VirtualCurator_F") && {alive _x} && {(lifeState _x) != "INCAPACITATED"}}) param [0, objNull];
		_poz = getPosATL _pot_tgt;

		if (_isalivevic) then 
		{ 
			_wave_obj = createVehicle ["Land_Battery_F", position _entitate, [], 0, "CAN_COLLIDE"]; 
			_wave_obj setMass 10;
			_entitate doMove _poz;
			[_entitate,["miscare_screamer",300]] remoteExec ["say3d"];
		} else 
		{
			_wave_obj = createVehicle ["Land_Battery_F", position _screamer_anomally, [], 0, "CAN_COLLIDE"]; 
			_wave_obj setMass 10;
			_entitate doMove _poz;
			[_screamer_anomally,["miscare_screamer",300]] remoteExec ["say3d"];
		};
		uiSleep 5;

		_entitate lookAt _poz;
		dostop _entitate;
		uiSleep 1;

		if (_isalivevic) then 
		{
			_anomally_pos = (position _entitate);
		} else 
		{
			_anomally_pos = (position _screamer_anomally);
		};

		_bob_pos_1 = (position _bob1);
		_bob_pos_2 = (position _bob2);
		_bob_pos_3 = (position _bob3);
		_overallunits = nearestObjects [_anomally_pos,_screamer_dmgs,_screamer_radius];
		_units_range_1 = [];
		_units_range_2 = [];
		_units_range_3 = [];
		{
   		_unit = _x;
   		if(_bob_pos_3 distance _unit > (_screamer_radius/2)) then {
			_units_range_3 = _units_range_3 + [_unit]; } else { 
				if(_bob_pos_1 distance _unit < (_screamer_radius/5)) then { 
					_units_range_1 = _units_range_1 + [_unit]; } else { 
						if((_bob_pos_2 distance _unit > (_screamer_radius/5)) && (_bob_pos_2 distance _unit < (_screamer_radius/2))) then {
							_units_range_2 = _units_range_2 + [_unit]; }; };
						};
		} foreach _overallunits;
		if !((_units_range_1 find _entitate) == -1) then {_units_range_1 = _units_range_1 - [_entitate]};
		if !((_units_range_2 find _entitate) == -1) then {_units_range_2 = _units_range_2 - [_entitate]};
		if !((_units_range_3 find _entitate) == -1) then {_units_range_3 = _units_range_3 - [_entitate]};
		if (!_isalivevic) then 
		{
		if !((_units_range_1 find _screamer_anomally) == -1) then {_units_range_1 = _units_range_1 - [_screamer_anomally]};
		if !((_units_range_2 find _screamer_anomally) == -1) then {_units_range_2 = _units_range_2 - [_screamer_anomally]};
		if !((_units_range_3 find _screamer_anomally) == -1) then {_units_range_3 = _units_range_3 - [_screamer_anomally]};
		};
				
		uiSleep 1;

		_wave_obj attachTo [_entitate, [0,-1,1.5]];
		detach _wave_obj;

		//effect
		if (_isalivevic) then 
		{
			if (alive _entitate) then {[[_wave_obj,_entitate],"\Root_Anomalies\Root_Screamer\AL_screamer\screamer_effect.sqf"] remoteExec ["execvm"]};
		} else 
		{
			if (alive _entitate) then {[[_wave_obj,_screamer_anomally],"\Root_Anomalies\Root_Screamer\AL_screamer\screamer_effect.sqf"] remoteExec ["execvm"]};
		};
		
		_dir_blast = getdir _entitate;

		_al_pressure = 90;

		if (_dir_blast<=90) then {
			_press_implicit_x = linearConversion [0, 90,_dir_blast, 0, 1, true];
			_press_implicit_y = 1-_press_implicit_x;
		};

		if ((_dir_blast>90)and(_dir_blast<180)) then {
			_dir_blast = _dir_blast-90;
			_press_implicit_x = linearConversion [0, 90,_dir_blast, 1, 0, true];
			_press_implicit_y = _press_implicit_x-1;
		};

		if ((_dir_blast>180)and(_dir_blast<270)) then {
			_dir_blast = _dir_blast-180;
			_press_implicit_x = linearConversion [0, 90,_dir_blast, 0, -1, true];
			_press_implicit_y = (-1*_press_implicit_x)-1;
		};

		if ((_dir_blast>270)and(_dir_blast<360)) then {
			_dir_blast = _dir_blast-270;
			_press_implicit_x = linearConversion [0, 90,_dir_blast, -1, 0, true];
			_press_implicit_y = 1+_press_implicit_x;
		};
		if (_isaipanic == true) then { [_entitate, _screamer_territory, _screamer_targets] call fnc_avoid_screamer; };
		scream_on=true;


		{
			_vel = velocity _x;
			_speed = 10;
			_temp_mass = getMass _x;
			_x setMass 3;
			_x setvelocity [(_press_implicit_x * _al_pressure) / 2, (_press_implicit_y * _al_pressure) / 2, (_vel select 2) + (random [3, 5, 8])];
			// [_x, random[0,5,10],random[0,1,2]] remoteExec ["BIS_fnc_setObjectRotation", _x];
			_x addTorque (_x vectorModelToWorld [2, 2, 2]);
			_random_close = random[0, _damage_screamer_close, 1];
			_bodyPart = ["Head", "RightLeg", "LeftArm", "Body", "LeftLeg", "RightArm"] selectRandomWeighted [0.3,0.8,0.65,0.5,0.8,0.65];
			if ((_x isKindOf "CAManBase") && (typeOf _x != "VirtualCurator_F")) then { 
				if(!isNil "ace_arsenal_fnc_openBox") then 
				{
					[_x, _damage_screamer_close, _bodyPart, "backblast"] remoteExec ["ace_medical_fnc_addDamageToUnit", _x];
				} else 
				{ 
					_x setdamage ((damage _x) + _damage_screamer_close);
				}; 
			};
			if (typeOf _x == "VirtualCurator_F") then { _x setDamage 0; };
			if (_isvicdmg == true) then 
			{
				if ((_x isKindOf "LandVehicle") or (_x isKindOf "Air")) then
				{
					[_x, _random_close] call fnc_hitpoint_damage;
					playSound3D [format ["A3\Sounds_F\vehicles2\soft\shared\collisions\Vehicle_Soft_Collision_Medium_0%1.wss", (floor random 8) + 1], _x, false, getPosASL _x, 3, 1, 150];
				};
			};
			_x setMass _temp_mass;
		} foreach _units_range_1;
		uiSleep 0.1;
		{
			_vel = velocity _x;
			_speed = 5;
			_temp_mass = getMass _x;
			_x setMass 2;
			_x setvelocity [(_press_implicit_x * _al_pressure) / 4, (_press_implicit_y * _al_pressure) / 4, (_vel select 2) + (random [3, 5, 8])];
			// [_x, random[0,5,10],random[0,1,2]] remoteExec ["BIS_fnc_setObjectRotation", _x];
			_x addTorque (_x vectorModelToWorld [1, 1, 1]);
			_random_medium = random[0, (_damage_screamer_medium/2), _damage_screamer_medium];
			_bodyPart = ["Head", "RightLeg", "LeftArm", "Body", "LeftLeg", "RightArm"] selectRandomWeighted [0.2,0.7,0.55,0.4,0.7,0.55];
			if ((_x isKindOf "CAManBase") && (typeOf _x != "VirtualCurator_F")) then { 
				if(!isNil "ace_arsenal_fnc_openBox") then 
				{
					[_x, _damage_screamer_medium, _bodyPart, "backblast"] remoteExec ["ace_medical_fnc_addDamageToUnit", _x];	
				} else 
				{ 
					_x setdamage ((damage _x) + _damage_screamer_medium);
				};
			};
			if (typeOf _x == "VirtualCurator_F") then { _x setDamage 0; };
			if (_isvicdmg == true) then 
			{
				if ((_x isKindOf "LandVehicle") or (_x isKindOf "Air")) then
				{
					[_x, _random_medium] call fnc_hitpoint_damage;
					playSound3D [format ["A3\Sounds_F\vehicles2\soft\shared\collisions\Vehicle_Soft_Collision_Medium_0%1.wss", (floor random 8) + 1], _x, false, getPosASL _x, 3, 1, 150];
				};
			};
			_x setMass _temp_mass;
		} foreach _units_range_2;
		uiSleep 0.2;
		{
			_vel = velocity _x;
			_speed = 2;
			_temp_mass = getMass _x;
			_x setMass 1;
			_x setvelocity [(_press_implicit_x * _al_pressure) / 6, (_press_implicit_y * _al_pressure) / 6, (_vel select 2) + (random [3, 5, 8])];
			// [_x, random[0,5,10],random[0,1,2]] remoteExec ["BIS_fnc_setObjectRotation", _x];
			_x addTorque (_x vectorModelToWorld [0.5, 0.5, 0.5]);
			_bodyPart = ["Head", "RightLeg", "LeftArm", "Body", "LeftLeg", "RightArm"] selectRandomWeighted [0.1,0.6,0.45,0.3,0.6,0.45];
			_random_far = random[0, (_damage_screamer_far/3), _damage_screamer_far];
			if ((_x isKindOf "CAManBase") && (typeOf _x != "VirtualCurator_F")) then { 
				if(!isNil "ace_arsenal_fnc_openBox") then 
				{
					[_x, _damage_screamer_far, "Body", "backblast"] remoteExec ["ace_medical_fnc_addDamageToUnit", _x];	
				} else 
				{ 
					_x setdamage ((damage _x) + _damage_screamer_far);
				};
			};
			if (typeOf _x == "VirtualCurator_F") then { _x setDamage 0; };
			if (_isvicdmg == true) then 
			{
				if ((_x isKindOf "LandVehicle") or (_x isKindOf "Air")) then
				{
					[_x, _random_far] call fnc_hitpoint_damage;
					playSound3D [format ["A3\Sounds_F\vehicles2\soft\shared\collisions\Vehicle_Soft_Collision_Medium_0%1.wss", (floor random 8) + 1], _x, false, getPosASL _x, 3, 1, 150];
				};
			};
			_x setMass _temp_mass;
		} foreach _units_range_3;
		_wave_obj setVelocity [_press_implicit_x*_al_pressure,_press_implicit_y*_al_pressure,0];
		
		uiSleep 1;
		deleteVehicle _wave_obj;
		uiSleep 1;

		scream_on=false;
		_units_range = [];
	};
};
uiSleep 5;
};

if (_isalivevic) then 
{
	[[_entitate],"\Root_Anomalies\Root_Screamer\AL_screamer\screamer_teleport.sqf"] remoteExec ["execvm"];
	uiSleep 4;
	deleteVehicle _entitate;
} else
{
	deleteVehicle _entitate;
	[[_screamer_anomally],"\Root_Anomalies\Root_Screamer\AL_screamer\screamer_teleport.sqf"] remoteExec ["execvm"];
	uiSleep 4;
	deleteVehicle _screamer_anomally;
};
