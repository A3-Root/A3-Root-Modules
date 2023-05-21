// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 
fnc_find_target_flamer = {
	params ["_flamer","_teritoriu"];
	private ["_neartargets","_teritoriu"];
	_neartargets = (ASLToAGL getPosASL _flamer) nearEntities ["CAManBase",_teritoriu];
	_neartargets - [_flamer]
};

fnc_avoid_flamer = {
	params ["_flamer","_chased"];
	private ["_flamer","_chased"];
	if (isPlayer _chased) exitWith {};
	_relPos = _chased getPos [30, (_flamer getDir _chased) + (random 33)*(selectRandom [1,-1])];
	_chased doMove _relPos;
	_chased setSkill ["commanding", 1];
};

fnc_attk_flamer = {
	params ["_flamer","_tgt_casp","_damage_flamer"];
	private ["_flamer","_tgt_casp","_damage_flamer","_isacefire", "_isacemedical", "_dmg_fire", "_vehicle", "_vichitpoints", "_damage", "_time"];
	_isacefire = false;
	_isacemedical = false;
	_dmg_fire = _damage_flamer * 10;
	if !(isClass (configFile >> "CfgPatches" >> "ace_medical_engine")) then 
	{
		diag_log "******ACE Medical Engine not detected. Using vanilla medical system.";
		_isacemedical = false;
		_isacefire = false;
	} else 
	{
		_isacemedical = true;
		_isacefire = false;
		if (isClass (configFile >> "CfgPatches" >> "ace_fire")) then 
		{
			_isacefire = true;
		};
	};
	_shoot_dir = (getposasl _flamer vectorFromTo getposasl _tgt_casp) vectorMultiply 15;
	[_flamer getVariable "_cap_flamer",["foc_initial",500]] remoteExec ["say3d"];
	[[_flamer,_shoot_dir],"\Root_Anomalies\Root_Flamer\AL_flamer\flamer_plasma_SFX.sqf"] remoteExec ["execVM"];
	sleep 0.5;
	_tip = selectrandom ["04","burned","02","03"];
	_nearflamer = (ASLToAGL getPosASL _flamer) nearEntities ["CAManBase",5];
	{
		_bodyPart = ["Head", "RightLeg", "LeftArm", "Body", "LeftLeg", "RightArm"] selectRandomWeighted [0.47,0.69,0.59,0.55,0.61,0.58];
		_dmgType = selectRandom ["backblast", "bullet", "explosive", "grenade"];
		if ((typeOf _x != "VirtualCurator_F") && (_x isKindOf "Man") && (_x != _flamer)) then 
		{
			if (_isacefire) then 
			{
				// if no weapon dont apply ace_fire_fnc_burn
				[_x, _dmg_fire] remoteExec ["ace_fire_fnc_burn", _x]; // TODO OVERRIDE (copy from ace and fix)
				[_x, (_damage_flamer/4), _bodyPart, "burning"] remoteExec ["ace_medical_fnc_addDamageToUnit", _x];
			} else 
			{
				if (_isacemedical) then 
				{
					[_x, _damage_flamer, _bodyPart, "burning"] remoteExec ["ace_medical_fnc_addDamageToUnit", _x];
				} else 
				{
					_x setdamage ((damage _x) + _damage_flamer);
				};
			};
			_tip = selectrandom ["04","burned","02","03"];
			[_x,[_tip,200]] remoteExec ["say3d"];
		} else
		{
			if ((_x isKindOf "LandVehicle") or (_x isKindOf "Air")) then {
				_vehicle = _x;
				_damage = random(_damage_flamer);
				_vichitpoints = getAllHitPointsDamage _vehicle; _vichitpoints select 0;
				{
					_damage = random(_damage_flamer);
					_vehicle setHitPointDamage [_x, (_vehicle getHitPointDamage _x) + _damage];
				} foreach _vichitpoints;
			};
		};
	} forEach (_nearflamer-[_flamer]);
	_nearvik = nearestObjects [position _flamer,["CAR","TANK","PLANE","HELICOPTER","Motorcycle","Air"],7,false]; {_x setDamage (damage _x + ( _damage_flamer * 5 ))} forEach _nearvik;
	sleep 4;
	_flamer setVariable ["atk",false];
};

fnc_hide_flamer = {
	_this setVariable ["vizibil",false,true];
	[_this getVariable "_cap_flamer",["foc_initial",1000]] remoteExec ["say3d"];
	_this enableSimulationGlobal false; _this hideObjectGlobal true;
};

fnc_show_flamer = {
	params ["_flamer","_poz_orig_sc","_teritoriu","_damage_flamer"];
	private ["_flamer","_poz_orig_sc","_pos_strig","_teritoriu","_damage_flamer"];
	_pos_strig = [_poz_orig_sc,1,_teritoriu/10, 3, 0, 20, 0] call BIS_fnc_findSafePos;
	_flamer setPos _pos_strig;
	_flamer setVariable ["vizibil",true,true];
	// NEW ADDITIONS
	[[_flamer,_damage_flamer,_teritoriu],"\Root_Anomalies\Root_Flamer\AL_flamer\flamer_sfx.sqf"] remoteExec ["execVM",0];
	_flamer enableSimulationGlobal true; _flamer hideObjectGlobal false; {_flamer reveal _x} forEach (_flamer nearEntities [["CAManBase"],100]);
	[_flamer getVariable "_cap_flamer",["foc_initial",1000]] remoteExec ["say3d"];
};

fnc_jump_flamer = {
	params ["_flamer","_tgt_casp","_cap_flamer","_damage_flamer"];
	private ["_jump_dir","_blast_dust","_flama","_li_fire","_bbb","_isacefire", "_isacemedical", "_dmg_fire", "_vehicle", "_vichitpoints", "_damage", "_time"];
	_isacefire = false;
	_isacemedical = false;
	_dmg_fire = _damage_flamer * 5;
	if !(isClass (configFile >> "CfgPatches" >> "ace_medical_engine")) then 
	{
		diag_log "******ACE Medical Engine not detected. Using vanilla medical system.";
		_isacemedical = false;
		_isacefire = false;
	} else 
	{
		_isacemedical = true;
		_isacefire = false;
		if (isClass (configFile >> "CfgPatches" >> "ace_fire")) then 
		{
			_isacefire = true;
		};
	};
	_jump_dir = (getposasl _flamer vectorFromTo getposasl _tgt_casp) vectorMultiply round (10+random 10);
	_salt_sunet= selectRandom ["01_blast","02_blast","03_blast"]; 
	_obj_veg = nearestTerrainObjects [position _flamer,["TREE","SMALL TREE","BUSH","FOREST BORDER","FOREST TRIANGLE","FOREST SQUARE","FOREST"],20,false];
	_nearvik = nearestObjects [position _flamer,["CAR","TANK","PLANE","HELICOPTER","Motorcycle","Air"],20,false];
	[_cap_flamer,[_salt_sunet,200]] remoteExec ["say3d"];
	_nearflamer = (ASLToAGL getPosASL _flamer) nearEntities ["CAManBase",5];
	{
		_bodyPart = ["Head", "RightLeg", "LeftArm", "Body", "LeftLeg", "RightArm"] selectRandomWeighted [0.47,0.69,0.59,0.55,0.61,0.58];
		_dmgType = selectRandom ["backblast", "bullet", "explosive", "grenade"];
		if ((typeOf _x != "VirtualCurator_F") && (_x isKindOf "Man") && (_x != _flamer)) then 
		{
			if (_isacefire) then 
			{
				[_x, _dmg_fire] remoteExec ["ace_fire_fnc_burn", _x];
				[_x, (_damage_flamer/4), _bodyPart, "burning"] remoteExec ["ace_medical_fnc_addDamageToUnit", _x];
			} else 
			{
				if (_isacemedical) then 
				{
					[_x, _damage_flamer, _bodyPart, "burning"] remoteExec ["ace_medical_fnc_addDamageToUnit", _x];
				} else 
				{
					_x setdamage ((damage _x) + _damage_flamer);
				};
			};
			_tip = selectrandom ["04","burned","02","03"];
			[_x,[_tip,200]] remoteExec ["say3d"];
		} else
		{
			if ((_x isKindOf "LandVehicle") or (_x isKindOf "Air")) then {
				_vehicle = _x;
				_damage = random(_damage_flamer);
				_vichitpoints = getAllHitPointsDamage _vehicle; _vichitpoints select 0;
				{
					_damage = random(_damage_flamer);
					_vehicle setHitPointDamage [_x, (_vehicle getHitPointDamage _x) + _damage];
				} foreach _vichitpoints;
			};
		};
	} forEach (_nearflamer-[_flamer]);
	_flamer setvelocity [_jump_dir # 0,_jump_dir # 1,round (10+random 15)];
	{_x setDamage [1,false]; _x hideObjectGlobal true} foreach _obj_veg;
	{_x setDamage (damage _x + 0.10)} forEach _nearvik;
};