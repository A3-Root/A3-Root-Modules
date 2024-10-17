// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

if (!hasinterface) exitWith {};

waitUntil {time > 0};

_obj_emit = _this select 0;
_dist_damage = _this select 1;
_isseize = _this select 2;

_sun_ini= "none";

_token = 13;

[_obj_emit,_dist_damage,_isseize] spawn 
{
_electromagnetic_anom 	= _this select 0;
_dist_damage_w			= _this select 1;
_isseize			= _this select 2;

private ["_aberat","_dist_damage_w"];
_play_sunet = true;

while {alive _electromagnetic_anom} do 
{
	waitUntil {player distance _electromagnetic_anom < _dist_damage_w};

	if (typeOf player != "VirtualCurator_F") then {
	
	// _damage_p = damage player;

	[_electromagnetic_anom,_dist_damage_w,_isseize] spawn 
	{
		_electr_viz = _this select 0;
		_dist_dam_w	= _this select 1;
		_isseize	= _this select 2;

		if !(_isseize) then 
		{
			_aberat = ppEffectCreate ["ChromAberration", 250];
			_aberat ppEffectEnable true;
			enableCamShake true;			
			while {player distance _electr_viz < _dist_dam_w} do 
			{
				addCamShake [1,4,33];
				_aberat ppEffectAdjust[1, 0.8, true];
				_aberat ppEffectCommit 3;
				uiSleep 3;
				addCamShake [1,4,33];
				_aberat ppEffectAdjust[0, 0, true];
				_aberat ppEffectCommit 3;
				uiSleep 3;
			};
			_aberat ppEffectEnable false;
			ppEffectDestroy _aberat;
			enableCamShake false;
		};
	};
	
	if (_play_sunet) then 
	{
		_play_sunet = false;
		playsound "sound_twin";
		_bodyPart = ["Head", "RightLeg", "LeftArm", "Body", "LeftLeg", "RightArm"] selectRandomWeighted [0.3,0.8,0.65,0.5,0.8,0.65];
		_dmgType = selectRandom ["backblast", "bullet", "explosive", "grenade"];
		if (!(isNil "ace_medical_fnc_addDamageToUnit")) then 
		{
			[player, random(0.33), _bodyPart, _dmgType] remoteExec ["ace_medical_fnc_addDamageToUnit", player];	
		} else 
		{ 
			player setdamage ((damage player) + random(0.33));
		};
		uiSleep 5;
		_play_sunet = true;
	};
	};
};
};
_viz_fct=0;
while {alive _obj_emit} do 
{
	waitUntil {(player distance _obj_emit) < 1500};
	if (typeOf player != "VirtualCurator_F") then {
	_dir_rel = [player, _obj_emit] call BIS_fnc_dirTo;
	_cam_dir = [0,0,0] getdir getCameraViewDirection player;

	if ((abs(_dir_rel - _cam_dir) <= 46) or (abs(_dir_rel - _cam_dir) >= 314)) then 
	{
		if (_viz_fct<1) then {_viz_fct = _viz_fct +1;_total_viz = _obj_emit getVariable "vizibil";_total_viz=_total_viz+1;_obj_emit setVariable ["vizibil", _total_viz, true];};
	} else 
		{
			_main_obj_sun = ["metalic1","metalic2","metalic3","metalic4","metalic5"] call BIS_fnc_selectRandom;
			if ((_sun_ini!=_main_obj_sun) and (_token>12)) then {_obj_emit say3D [_main_obj_sun, 1500];_token=0};
			_token= _token+0.2;
			_sun_ini = _main_obj_sun;
			if (_viz_fct>0) then {_viz_fct = _viz_fct-1;_total_viz = _obj_emit getVariable "vizibil";_total_viz=_total_viz-1;_obj_emit setVariable ["vizibil", _total_viz, true];};
		};
		//hint str looking_units; hint str (_obj_emit getVariable "vizibil");
	uiSleep 0.2; };
};