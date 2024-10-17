// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 
if (!isServer) exitWith {};

#include "\Root_Anomalies\Root_Flamer\AL_flamer\flamer_functions.hpp"

params ["_poz_orig_sc","_teritoriu","_damage_flamer", "_recharge_delay", "_hp_flamer", "_damage_on_death", "_isaipanic"];
private ["_poz_orig_sc","_teritoriu","_damage_flamer", "_recharge_delay", "_hp_flamer", "_damage_on_death", "_isaipanic", "_isacefire", "_isacemedical", "_dmg_fire", "_vehicle", "_vichitpoints", "_damage", "_time"];

sleep 2;

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


_isacefire = false;
_isacemedical = false;
_dmg_fire = _damage_flamer;

_ck_pl = false;
while {!_ck_pl} do {{if (_x distance getMarkerPos _poz_orig_sc < _teritoriu) then {_ck_pl = true}} foreach allPlayers;sleep 5; /* sleep 10; */};
_flamer = createAgent ["O_Soldier_VR_F",getMarkerPos _poz_orig_sc, [],0, "NONE"]; _flamer setVariable ["BIS_fnc_animalBehaviour_disable", true]; _flamer setSpeaker "NoVoice"; _flamer disableConversation true; _flamer addRating -10000; _flamer setBehaviour "CARELESS"; _flamer enableFatigue false; _flamer setSkill ["courage", 1]; _flamer setUnitPos "UP"; _flamer disableAI "ALL"; _flamer setMass 7000; {_flamer enableAI _x} forEach ["MOVE","ANIM","TEAMSWITCH","PATH"];

_hp_curr_flamer = 1/_hp_flamer;
_flamer setVariable ["flamer_dmg_total", 0];
_flamer setVariable ["flamer_dmg_increase", _hp_curr_flamer];
_flamer removeAllEventHandlers "hit";

_flamer addEventHandler ["Hit", {
    _unit=_this#0;
    _flamer_curr_dmg = (_unit getVariable "flamer_dmg_total") + (_unit getVariable "flamer_dmg_increase");
	_unit setVariable ["flamer_dmg_total", _flamer_curr_dmg];
	if ((_unit getVariable "flamer_dmg_total") > 1) then 
	{
        _unit setDamage 1
    };
    [[_unit], "\Root_Anomalies\Root_Flamer\AL_flamer\flamer_splash_hit.sqf"] remoteExec ["execVM"]
}];

_flamer removeAllEventHandlers "Handledamage";

_flamer addEventHandler ["Handledamage", {0}];

_flamer addEventHandler ["Killed", {
    (_this select 0) hideObjectglobal true;
    (_this select 1) addrating 2000
}];

_flamer setAnimSpeedCoef 1.2;
_cap_flamer = "Land_HelipadEmpty_F" createVehicle [0,0,0]; _cap_flamer attachto [_flamer, [0,0,0.2],"neck"]; _flamer setVariable ["_cap_flamer", _cap_flamer, true];

for "_i" from 0 to 5 do {
    _flamer setobjectMaterialGlobal [_i, "\a3\data_f\default.rvmat"];
};
for "_i" from 0 to 5 do {
    _flamer setobjecttextureGlobal [_i, "\Root_Anomalies\Root_Flamer\AL_flamer\03_flesh.jpg"];
};
_flamer setVariable ["atk",false];
_flamer call fnc_hide_flamer;
_list_unit_range_flamer = [];
[_flamer, _damage_on_death] execvm "\Root_Anomalies\Root_Flamer\AL_flamer\flamer_end.sqf";









while {alive _flamer} do 
{
	while {count _list_unit_range_flamer isEqualTo 0} do {_list_unit_range_flamer = [_flamer,_teritoriu] call fnc_find_target_flamer; sleep 5; /* sleep 10; */};
	_tgt_flamer = selectRandom (_list_unit_range_flamer select { typeOf _x != "VirtualCurator_F" });
	[_flamer,getMarkerPos _poz_orig_sc,_teritoriu,_damage_flamer] call fnc_show_flamer;
	while {(!isNil "_tgt_flamer") && {(alive _flamer) && ((_flamer distance getMarkerPos _poz_orig_sc) < _teritoriu)}} do 
	{
		sleep _recharge_delay;
		_nearflamer = (ASLToAGL getPosASL _flamer) nearEntities [["CAManBase","LandVehicle"],5]; 
		{
			
			_bodyPart = ["Head", "RightLeg", "LeftArm", "Body", "LeftLeg", "RightArm"] selectRandomWeighted [0.47,0.69,0.59,0.55,0.61,0.58];
			_dmgType = selectRandom ["backblast", "bullet", "explosive", "grenade"];
			if ((typeOf _x != "VirtualCurator_F") && (_x isKindOf "Man") && (_x != _flamer)) then 
			{
				if (_isacefire) then 
				{
					[_x, _dmg_fire] remoteExec ["ace_fire_fnc_burn", _x];
					[_x, 0.03, _bodyPart, "burning"] remoteExec ["ace_medical_fnc_addDamageToUnit", _x];
				} else 
				{
					if (_isacemedical) then 
					{
						[_x, 0.03, _bodyPart, "burning"] remoteExec ["ace_medical_fnc_addDamageToUnit", _x];
					} else 
					{
						_x setdamage ((damage _x) + 0.03);
					};
				};
				_tip = selectrandom ["04","burned","02","03"];
				[_x,[_tip,200]] remoteExec ["say3d"];
			} else
			{
				if ((_x isKindOf "LandVehicle") or (_x isKindOf "Air")) then {
					_vehicle = _x;
					_damage = random(0.3);
					_vichitpoints = getAllHitPointsDamage _vehicle; _vichitpoints select 0;
					{
						_damage = random(0.3);
						_vehicle setHitPointDamage [_x, (_vehicle getHitPointDamage _x) + _damage];
					} foreach _vichitpoints;
				};
			};
		} forEach (_nearflamer-[_flamer]); 
		if (selectRandom [true,false,true,true,false]) then 
		{ 
			_flamer moveTo AGLToASL (_tgt_flamer getRelPos[10,180]);
			if (_isaipanic) then { [_flamer,_tgt_flamer] call fnc_avoid_flamer; };
		}
		else 
		{
			_nearflamer = (ASLToAGL getPosASL _flamer) nearEntities [["CAManBase","LandVehicle"],5]; 
			{
				_bodyPart = ["Head", "RightLeg", "LeftArm", "Body", "LeftLeg", "RightArm"] selectRandomWeighted [0.47,0.69,0.59,0.55,0.61,0.58];
				_dmgType = selectRandom ["backblast", "bullet", "explosive", "grenade"];
				if ((typeOf _x != "VirtualCurator_F") && (_x isKindOf "Man") && (_x != _flamer)) then 
				{
					if (_isacefire) then 
					{
						[_x, _dmg_fire] remoteExec ["ace_fire_fnc_burn", _x];
						[_x, 0.03, _bodyPart, "burning"] remoteExec ["ace_medical_fnc_addDamageToUnit", _x];
					} else 
					{
						if (_isacemedical) then 
						{
							[_x, 0.03, _bodyPart, "burning"] remoteExec ["ace_medical_fnc_addDamageToUnit", _x];
						} else 
						{
							_x setdamage ((damage _x) + 0.03);
						};
					};
					_tip = selectrandom ["04","burned","02","03"];
					[_x,[_tip,200]] remoteExec ["say3d"];
				} else
				{
					if ((_x isKindOf "LandVehicle") or (_x isKindOf "Air")) then {
						_vehicle = _x;
						_damage = random(0.3);
						_vichitpoints = getAllHitPointsDamage _vehicle; _vichitpoints select 0;
						{
							_damage = random(0.3);
							_vehicle setHitPointDamage [_x, (_vehicle getHitPointDamage _x) + _damage];
						} foreach _vichitpoints;
					};
				};
			} forEach (_nearflamer-[_flamer]); [[_flamer],"\Root_Anomalies\Root_Flamer\AL_flamer\flamer_jump_SFX.sqf"] remoteExec ["execvm"]; [_flamer,_tgt_flamer,_cap_flamer,_damage_flamer] spawn fnc_jump_flamer};
		sleep _recharge_delay;
		_nearflamer = (ASLToAGL getPosASL _flamer) nearEntities [["CAManBase","LandVehicle"],5];
		{
			_bodyPart = ["Head", "RightLeg", "LeftArm", "Body", "LeftLeg", "RightArm"] selectRandomWeighted [0.47,0.69,0.59,0.55,0.61,0.58];
			_dmgType = selectRandom ["backblast", "bullet", "explosive", "grenade"];
			if ((typeOf _x != "VirtualCurator_F") && (_x isKindOf "Man") && (_x != _flamer)) then 
			{
				if (_isacefire) then 
				{
					[_x, _dmg_fire] remoteExec ["ace_fire_fnc_burn", _x];
					[_x, 0.03, _bodyPart, "burning"] remoteExec ["ace_medical_fnc_addDamageToUnit", _x];
				} else 
				{
					if (_isacemedical) then 
					{
						[_x, 0.03, _bodyPart, "burning"] remoteExec ["ace_medical_fnc_addDamageToUnit", _x];
					} else 
					{
						_x setdamage ((damage _x) + 0.03);
					};
				};
				_tip = selectrandom ["04","burned","02","03"];
				[_x,[_tip,200]] remoteExec ["say3d"];
			} else
			{
				if ((_x isKindOf "LandVehicle") or (_x isKindOf "Air")) then {
					_vehicle = _x;
					_damage = random(0.3);
					_vichitpoints = getAllHitPointsDamage _vehicle; _vichitpoints select 0;
					{
						_damage = random(0.3);
						_vehicle setHitPointDamage [_x, (_vehicle getHitPointDamage _x) + _damage];
					} foreach _vichitpoints;
				};
			};
		} forEach (_nearflamer-[_flamer]); 
		if ((_flamer distance _tgt_flamer <15)&&!(_flamer getVariable "atk")) then 
		{_flamer setVariable ["atk",true]; [_flamer,_tgt_flamer,_damage_flamer] spawn fnc_attk_flamer; sleep 0.5; [[_tgt_flamer],"\Root_Anomalies\Root_Flamer\AL_flamer\flamer_atk_SFX.sqf"] remoteExec ["execvm"]};
		sleep _recharge_delay;
		_nearflamer = (ASLToAGL getPosASL _flamer) nearEntities [["CAManBase","LandVehicle"],5];
		{
			_bodyPart = ["Head", "RightLeg", "LeftArm", "Body", "LeftLeg", "RightArm"] selectRandomWeighted [0.47,0.69,0.59,0.55,0.61,0.58];
			_dmgType = selectRandom ["backblast", "bullet", "explosive", "grenade"];
			if ((typeOf _x != "VirtualCurator_F") && (_x isKindOf "Man") && (_x != _flamer)) then 
			{
				if (_isacefire) then 
				{
					[_x, _dmg_fire] remoteExec ["ace_fire_fnc_burn", _x];
					[_x, 0.03, _bodyPart, "burning"] remoteExec ["ace_medical_fnc_addDamageToUnit", _x];
				} else 
				{
					if (_isacemedical) then 
					{
						[_x, 0.03, _bodyPart, "burning"] remoteExec ["ace_medical_fnc_addDamageToUnit", _x];
					} else 
					{
						_x setdamage ((damage _x) + 0.03);
					};
				};
				_tip = selectrandom ["04","burned","02","03"];
				[_x,[_tip,200]] remoteExec ["say3d"];
			} else
			{
				if ((_x isKindOf "LandVehicle") or (_x isKindOf "Air")) then {
					_vehicle = _x;
					_damage = random(0.3);
					_vichitpoints = getAllHitPointsDamage _vehicle; _vichitpoints select 0;
					{
						_damage = random(0.3);
						_vehicle setHitPointDamage [_x, (_vehicle getHitPointDamage _x) + _damage];
					} foreach _vichitpoints;
				};
			};
		} forEach (_nearflamer-[_flamer]); 
		if ((!alive _tgt_flamer)or(_tgt_flamer distance getMarkerPos _poz_orig_sc > _teritoriu)) then {_list_unit_range_flamer = [_flamer,_teritoriu] call fnc_find_target_flamer; if !(count _list_unit_range_flamer isEqualTo 0) then {_tgt_flamer = selectRandom _list_unit_range_flamer} else {_tgt_flamer = nil}};
		sleep _recharge_delay;
		_nearflamer = (ASLToAGL getPosASL _flamer) nearEntities [["CAManBase","LandVehicle"],5];
		{
			_bodyPart = ["Head", "RightLeg", "LeftArm", "Body", "LeftLeg", "RightArm"] selectRandomWeighted [0.47,0.69,0.59,0.55,0.61,0.58];
			_dmgType = selectRandom ["backblast", "bullet", "explosive", "grenade"];
			if ((typeOf _x != "VirtualCurator_F") && (_x isKindOf "Man") && (_x != _flamer)) then 
			{
				if (_isacefire) then 
				{
					[_x, _dmg_fire] remoteExec ["ace_fire_fnc_burn", _x];
					[_x, 0.03, _bodyPart, "burning"] remoteExec ["ace_medical_fnc_addDamageToUnit", _x];
				} else 
				{
					if (_isacemedical) then 
					{
						[_x, 0.03, _bodyPart, "burning"] remoteExec ["ace_medical_fnc_addDamageToUnit", _x];
					} else 
					{
						_x setdamage ((damage _x) + 0.03);
					};
				};
				_tip = selectrandom ["04","burned","02","03"];
				[_x,[_tip,200]] remoteExec ["say3d"];
			} else
			{
				if ((_x isKindOf "LandVehicle") or (_x isKindOf "Air")) then {
					_vehicle = _x;
					_damage = random(0.3);
					_vichitpoints = getAllHitPointsDamage _vehicle; _vichitpoints select 0;
					{
						_damage = random(0.3);
						_vehicle setHitPointDamage [_x, (_vehicle getHitPointDamage _x) + _damage];
					} foreach _vichitpoints;
				};
			};
		} forEach (_nearflamer-[_flamer]); 
	};
	_flamer call fnc_hide_flamer;
	_tgt_flamer = nil;
	_list_unit_range_flamer = [];
	sleep _recharge_delay + 2;
};
detach _cap_flamer;deleteVehicle _cap_flamer;sleep 5;deleteVehicle _flamer;