// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 
fnc_find_target_farm = {
	private ["_neartargets","_teritoriu"];
	params ["_farmer","_teritoriu"];
	_neartargets = (ASLToAGL getPosASL _farmer) nearEntities [["CAManBase", "LandVehicle"],_teritoriu];
	_neartargets - [_farmer];
};

fnc_hide_farmer = {
	_this setAnimSpeedCoef 0.8;
	_this switchmove "AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon";
	_this setVariable ["vizibil",false,true];
	[_this,["pietre",1000]] remoteExec ["say3d"];
	[[_this],"\Root_Anomalies\scripts\Farmer\farmer_teleport.sqf"] remoteExec ["execVM",0];
	_this hideObjectGlobal true;
};

fnc_show_farmer = {
	private ["_farmer","_poz_orig_sc","_pos_farmer","_teritoriu","_blow_poz"];
	params ["_farmer","_poz_orig_sc"];
	_pos_farmer = [_poz_orig_sc,0,10,3,0,20,0,[],_poz_orig_sc] call BIS_fnc_findSafePos;
	_farmer setPos _poz_orig_sc; _farmer setVariable ["vizibil",true,true];
	[_farmer,["punch_7",1000]] remoteExec ["say3d"];
	_farmer hideObjectGlobal false;
	[[_farmer],"\Root_Anomalies\scripts\Farmer\farmer_teleport.sqf"] remoteExec ["execVM",0];
	_farmer setAnimSpeedCoef 0.8; 
	_farmer switchmove "AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon";
	_farmer setunitPos "UP";
	sleep 1;
	playSound3D ["\Root_Anomalies\sounds\eko.ogg", "", false, [getpos _farmer select 0,getpos _farmer select 1,1000], 20, 5, 0];
};

fnc_avoid_farmer = {
	private ["_strig","_chased"];
	params ["_strig","_chased"];
	if (isPlayer _chased) exitWith {};
	_relPos = _chased getPos [25, round ((_strig getDir _chased) + (random 33)*(selectRandom [1,-1]))];
	_chased doMove _relPos;	_chased setSkill ["commanding", 1];
};

fnc_attk_farmer = {
	private ["_farmer","_damage_farmer", "_vehicle", "_damage", "_vichitpoints"];
	params ["_farmer","_damage_farmer"];
	_farmer setunitPos "UP";
	[[_farmer,_damage_farmer],"\Root_Anomalies\scripts\Farmer\farmer_shock_SFX.sqf"] remoteExec ["execVM"];

	sleep 1.2;
	{	
		if !(isPlayer _x) then 
		{
			_jump_dir = (getposasl _farmer vectorFromTo getposasl _x) vectorMultiply 3;
			_bodyPart = ["Head", "RightLeg", "LeftArm", "Body", "LeftLeg", "RightArm"] selectRandomWeighted [0.3,0.8,0.65,0.5,0.8,0.65];
			_dmgType = selectRandom ["backblast", "bullet", "explosive", "grenade"];
			if ((typeOf _x != "VirtualCurator_F") && (_x isKindOf "CAManBase")) then 
			{
				_x setvelocity [_jump_dir # 0,_jump_dir # 1,9]; 
				if (!(isNil "ace_medical_fnc_addDamageToUnit")) then 
				{
					[_x, _damage_farmer, _bodyPart, "falling"] remoteExec ["ace_medical_fnc_addDamageToUnit", _x];	
				} else 
				{ 
					_x setdamage ((damage _x) + _damage_farmer);
				}; 
			};
			if (_x isKindOf "LandVehicle") then 
			{
				_x setvelocity [_jump_dir # 0,_jump_dir # 1,3]; 
				_vehicle = _x;
				_damage = random[0, _damage_farmer, 1];
				_vichitpoints = getAllHitPointsDamage _vehicle; _vichitpoints = _vichitpoints select 0;
				{
					_damage = random[0, _damage_farmer, 1];
					_vehicle setHitPointDamage [_x, (_vehicle getHitPointDamage _x) + _damage];
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
		}
	} forEach (_farmer nearEntities [["CAManBase", "LandVehicle"],25]);
};

fnc_recharge_farmer = {
	_root_test_variable = true;
};

fnc_travel_farmer = {
	private ["_farmer","_tgt_farmer"];
	params ["_farmer","_tgt_farmer"];
	_farmer setunitPos "DOWN";
	_rag = "Land_PenBlack_F" createVehicle [getPosASL _farmer # 0,getPosASL _farmer # 1,3000];
	_jump_dir = (getposasl _farmer vectorFromTo getposasl _tgt_farmer) vectorMultiply 20;
	_rag setvelocity [_jump_dir # 0,_jump_dir # 1,5];
	[[_rag],"\Root_Anomalies\scripts\Farmer\farmer_travel_SFX.sqf"] remoteExec ["execVM"];
	sleep round (2+random 2);
	_farmer setvariable ["pozitie_noua",getpos _rag];
	deletevehicle _rag;
};
