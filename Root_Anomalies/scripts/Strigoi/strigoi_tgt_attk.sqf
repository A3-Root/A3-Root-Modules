// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

if (!hasInterface) exitWith {};

private ["_noseize"];

_damage_strig = _this select 0;
_noseize = _this select 1;

_bodyPart = ["Head", "RightLeg", "LeftArm", "Body", "LeftLeg", "RightArm"] selectRandomWeighted [0.3,0.8,0.65,0.5,0.8,0.65];
_dmgType = selectRandom ["backblast", "bullet", "explosive", "grenade"];
if (typeOf player != "VirtualCurator_F") then { 
	if (!(isNil "ace_medical_fnc_addDamageToUnit")) then 
	{
		[player, _damage_strig, _bodyPart, _dmgType] remoteExec ["ace_medical_fnc_addDamageToUnit", player];	
	} else 
	{ 
		player setdamage ((damage player) + _damage_strig);
	};
	};

playsound "puls";

if (_noseize == true) exitWith {};

0 = ["DynamicBlur", 400, [10]] spawn 
{
	params ["_name", "_priority", "_effect", "_handle"];
	while {
	_handle = ppEffectCreate [_name, _priority];
	_handle < 0
	} do {
	_priority = _priority + 1;
	uiSleep 0.01;
	};
	_handle ppEffectEnable true;
	_handle ppEffectAdjust _effect;
	_handle ppEffectCommit 0.5;
	waitUntil {ppEffectCommitted _handle};
	uiSleep 0.5; 
	_handle ppEffectAdjust [0];
	_handle ppEffectCommit 0.5;
	uiSleep 1.5; 
	_handle ppEffectEnable false;
	ppEffectDestroy _handle;
};
				
0 = ["ColorInversion", 2500, [0.53, 0.66, 0.94]] spawn 
{
	params ["_name", "_priority", "_effect", "_handle"];
	while {
		_handle = ppEffectCreate [_name, _priority];
		_handle < 0
	} do {
		_priority = _priority + 1;
	};
	_handle ppEffectEnable true;
	_handle ppEffectAdjust _effect;
	_handle ppEffectCommit 0.5;
	uiSleep 0.5; 
	_handle ppEffectEnable false;
	ppEffectDestroy _handle;
};

uiSleep 4;

playsound "tiuit";