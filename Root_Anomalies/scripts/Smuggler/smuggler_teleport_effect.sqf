// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

fn_teleport = {
	private ["_unit","_pozitie","_noseizee", "_time"];
	_unit		= _this select 0;
	_pozitie	= _this select 1;
	_noseizee  = _this select 2;

	uiSleep 2;
	waitUntil {isNil{player getVariable "tele"}};

	player setVariable ["tele",true];
	if !(_noseizee) then { [] spawn {execVM "\Root_Anomalies\Root_Smuggler\AL_smuggler\smuggler_video_effect.sqf"}; };
	["zoomin"] remoteExec ["playsound",_unit];
	_sound_in = ["halu_1","halu_2","halu_3","halu_4","halu_5","halu_6","halu_7","halu_8","halu_9","halu_91","halu_92","halu_93","halu_94","halu_95","halu_96","halu_97","halu_98","halu_99","halu_991","halu_992","halu_993","halu_994","halu_995","halu_996","halu_997","halu_998","halu_999","halu_9999"] call BIS_fnc_selectRandom;
	[_sound_in] remoteExec ["playsound",_unit];
	uiSleep 0.5;
	_unit setPos [_pozitie select 0,_pozitie select 1,2];
	uiSleep (3 + random 6);
	player setVariable ["tele",nil];
};

fn_final_scream = {
waitUntil {isNil{player getVariable "tele"}};
_tipat=["strigat_1","strigat_2","strigat_3","strigat_4","strigat_5","strigat_6","strigat_7","strigat_8","strigat_9","strigat_91","strigat_92"] call BIS_fnc_selectRandom;
[_this,[_tipat,300]] remoteExec ["say3d"];
};

private ["_noseizeer", "_dmg_on_tele"];
_unit_check	= _this select 0;
_obj_tele	= _this select 1;
_noseizeer = _this select 2;
_dmg_on_tele = _this select 3;

_time = 2 + diag_tickTime;

waitUntil {(diag_tickTime > _time)};

if (_unit_check!=player) exitwith {};
if (typeOf _unit_check == "VirtualCurator_F") exitwith {};

_dice_tele = random 6;
_floor_dice = floor _dice_tele;
_poz_1 = [];
_poz_2 = [];
_poz_3 = [];
_poz_4 = [];
_poz_5 = [];

switch (_floor_dice) do 
{
	case 0: {_poz_1 = [getpos _obj_tele,300,-1,5,0,-1,0] call BIS_fnc_findSafePos;
			[_unit_check,_poz_1,_noseizeer] call fn_teleport;
			uiSleep 0.3;
			_bodyPart = ["Head", "RightLeg", "LeftArm", "Body", "LeftLeg", "RightArm"] selectRandomWeighted [0.3,0.8,0.65,0.5,0.8,0.65];
			_dmgType = selectRandom ["backblast", "bullet", "explosive", "grenade"];
			if (!(isNil "ace_medical_fnc_addDamageToUnit")) then 
			{
				[_unit_check, _dmg_on_tele, _bodyPart, _dmgType] remoteExec ["ace_medical_fnc_addDamageToUnit", _unit_check];	
			} else 
			{ 
				_unit_check setdamage ((damage _unit_check) + _dmg_on_tele);
			};
			_unit_check call fn_final_scream;
			};
	case 1: {_poz_1 = [getpos _obj_tele,300,-1,5,0,-1,0] call BIS_fnc_findSafePos;
			[_unit_check,_poz_1,_noseizeer] call fn_teleport;
			uiSleep 0.3;
			_bodyPart = ["Head", "RightLeg", "LeftArm", "Body", "LeftLeg", "RightArm"] selectRandomWeighted [0.3,0.8,0.65,0.5,0.8,0.65];
			_dmgType = selectRandom ["backblast", "bullet", "explosive", "grenade"];
			if (!(isNil "ace_medical_fnc_addDamageToUnit")) then 
			{
				[_unit_check, _dmg_on_tele, _bodyPart, _dmgType] remoteExec ["ace_medical_fnc_addDamageToUnit", _unit_check];	
			} else 
			{ 
				_unit_check setdamage ((damage _unit_check) + _dmg_on_tele);
			};
			_unit_check call fn_final_scream;
			};
	case 2: {_poz_1 = [getpos _obj_tele,300,-1,5,0,-1,0] call BIS_fnc_findSafePos;_poz_2 = [getpos _obj_tele,300,-1,5,0,-1,0] call BIS_fnc_findSafePos;
			[_unit_check,_poz_1,_noseizeer] call fn_teleport;
			[_unit_check,_poz_2,_noseizeer] call fn_teleport;
			uiSleep 0.3;
			_bodyPart = ["Head", "RightLeg", "LeftArm", "Body", "LeftLeg", "RightArm"] selectRandomWeighted [0.3,0.8,0.65,0.5,0.8,0.65];
			_dmgType = selectRandom ["backblast", "bullet", "explosive", "grenade"];
			if (!(isNil "ace_medical_fnc_addDamageToUnit")) then 
			{
				[_unit_check, _dmg_on_tele, _bodyPart, _dmgType] remoteExec ["ace_medical_fnc_addDamageToUnit", _unit_check];	
			} else 
			{ 
				_unit_check setdamage ((damage _unit_check) + _dmg_on_tele);
			};
			_unit_check call fn_final_scream;
			};
	case 3: {_poz_1 = [getpos _obj_tele,300,-1,5,0,-1,0] call BIS_fnc_findSafePos;_poz_2 = [getpos _obj_tele,300,-1,5,0,-1,0] call BIS_fnc_findSafePos;_poz_3 = [getpos _obj_tele,300,-1,5,0,-1,0] call BIS_fnc_findSafePos;
			[_unit_check,_poz_1,_noseizeer] call fn_teleport;
			[_unit_check,_poz_2,_noseizeer] call fn_teleport;			
			[_unit_check,_poz_3,_noseizeer] call fn_teleport;
			uiSleep 0.3;
			_bodyPart = ["Head", "RightLeg", "LeftArm", "Body", "LeftLeg", "RightArm"] selectRandomWeighted [0.3,0.8,0.65,0.5,0.8,0.65];
			_dmgType = selectRandom ["backblast", "bullet", "explosive", "grenade"];
			if (!(isNil "ace_medical_fnc_addDamageToUnit")) then 
			{
				[_unit_check, _dmg_on_tele, _bodyPart, _dmgType] remoteExec ["ace_medical_fnc_addDamageToUnit", _unit_check];	
			} else 
			{ 
				_unit_check setdamage ((damage _unit_check) + _dmg_on_tele);
			};
			_unit_check call fn_final_scream;
			};
	case 4: {_poz_1 = [getpos _obj_tele,300,-1,5,0,-1,0] call BIS_fnc_findSafePos;_poz_2 = [getpos _obj_tele,300,-1,5,0,-1,0] call BIS_fnc_findSafePos;_poz_3 = [getpos _obj_tele,300,-1,5,0,-1,0] call BIS_fnc_findSafePos;_poz_4 = [getpos _obj_tele,300,-1,5,0,-1,0] call BIS_fnc_findSafePos;
			[_unit_check,_poz_1,_noseizeer] call fn_teleport;
			[_unit_check,_poz_2,_noseizeer] call fn_teleport;			
			[_unit_check,_poz_3,_noseizeer] call fn_teleport;		
			[_unit_check,_poz_4,_noseizeer] call fn_teleport;
			uiSleep 0.3;
			_bodyPart = ["Head", "RightLeg", "LeftArm", "Body", "LeftLeg", "RightArm"] selectRandomWeighted [0.3,0.8,0.65,0.5,0.8,0.65];
			_dmgType = selectRandom ["backblast", "bullet", "explosive", "grenade"];
			if (!(isNil "ace_medical_fnc_addDamageToUnit")) then 
			{
				[_unit_check, _dmg_on_tele, _bodyPart, _dmgType] remoteExec ["ace_medical_fnc_addDamageToUnit", _unit_check];	
			} else 
			{ 
				_unit_check setdamage ((damage _unit_check) + _dmg_on_tele);
			};
			_unit_check call fn_final_scream;
			};
	case 5: {_poz_1 = [getpos _obj_tele,300,-1,5,0,-1,0] call BIS_fnc_findSafePos;_poz_2 = [getpos _obj_tele,300,-1,5,0,-1,0] call BIS_fnc_findSafePos;_poz_3 = [getpos _obj_tele,300,-1,5,0,-1,0] call BIS_fnc_findSafePos;_poz_4 = [getpos _obj_tele,300,-1,5,0,-1,0] call BIS_fnc_findSafePos;_poz_5 = [getpos _obj_tele,300,-1,5,0,-1,0] call BIS_fnc_findSafePos;
			[_unit_check,_poz_1,_noseizeer] call fn_teleport;
			[_unit_check,_poz_2,_noseizeer] call fn_teleport;			
			[_unit_check,_poz_3,_noseizeer] call fn_teleport;		
			[_unit_check,_poz_4,_noseizeer] call fn_teleport;			
			[_unit_check,_poz_5,_noseizeer] call fn_teleport;
			uiSleep 0.3;
			_bodyPart = ["Head", "RightLeg", "LeftArm", "Body", "LeftLeg", "RightArm"] selectRandomWeighted [0.3,0.8,0.65,0.5,0.8,0.65];
			_dmgType = selectRandom ["backblast", "bullet", "explosive", "grenade"];
			if (!(isNil "ace_medical_fnc_addDamageToUnit")) then 
			{
				[_unit_check, _dmg_on_tele, _bodyPart, _dmgType] remoteExec ["ace_medical_fnc_addDamageToUnit", _unit_check];	
			} else 
			{ 
				_unit_check setdamage ((damage _unit_check) + _dmg_on_tele);
			};
			_unit_check call fn_final_scream;
			};
};