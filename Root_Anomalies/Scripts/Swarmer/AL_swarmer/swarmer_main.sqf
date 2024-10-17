// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 
fnc_avoid_hive = {params ["_hiver","_chased"]; if (isPlayer _chased) exitWith {}; _relPos = _chased getPos [50, (_hiver getDir _chased) + (random 33)*(selectRandom [1,-1])]; _chased doMove _relPos; _chased setSkill ["commanding", 1]; };
fnc_find_target_hiv = {params ["_hiver","_teritoriu"]; private ["_neartargets","_teritoriu"]; _neartargets = (ASLToAGL getPosASL _hiver) nearEntities ["CAManBase", _teritoriu]; _neartargets - [_hiver]; };
fnc_move_swarm = {params ["_mobile_s","_tgt_hiv"]; private ["_mobile_s","_tgt_hiv"]; _mobile_s setdir ([_mobile_s,_tgt_hiv] call BIS_fnc_dirTo); _mobile_s moveTo AGLToASL (_tgt_hiv modelToWorld [0,7,0]); };
fnc_ajust_poz = {params ["_mobile_s","_tgt_hiv"]; private ["_mobile_s","_tgt_hiv"]; _mobile_s setdir ([_mobile_s,_tgt_hiv] call BIS_fnc_dirTo); _mobile_s moveTo AGLToASL (_tgt_hiv modelToWorld [0,0,0]); };

private ["_tgt_hiv", "_dmg_un"];

if (!isServer) exitWith {};

_st_srv	= _this select 0;
_radius	= _this select 1;
_hiv_ki	= _this select 2;
_dmg_un	= _this select 3;

sleep 2;

insecticid = _hiv_ki; publicVariable "insecticid";

if (!isNil {_st_srv getVariable "activate"}) exitWith {};
_st_srv setVariable ["activate",true,true];

_mobile_s = createAgent ["C_Soldier_VR_F", position _st_srv, [], 0, "NONE"]; _mobile_s hideObjectGlobal true;
_mobile_s setVariable ["BIS_fnc_animalBehaviour_disable", true]; _mobile_s setSpeaker "NoVoice"; _mobile_s disableConversation true;
_mobile_s setBehaviour "CARELESS"; _mobile_s allowDamage false; _mobile_s enableFatigue false; _mobile_s setSkill ["courage", 1];
_mobile_s setUnitPos "UP"; _mobile_s disableAI "ALL"; {_mobile_s enableAI _x} forEach ["MOVE","ANIM","TEAMSWITCH","PATH"];_mobile_s setAnimSpeedCoef 1.1;
_mobile_s setVariable ["isHive",false,true];
[[_mobile_s],"\Root_Anomalies\Root_Swarmer\AL_swarmer\swarmer_voice.sqf"] remoteExec ["execVM"];
[[_mobile_s],"\Root_Anomalies\Root_Swarmer\AL_swarmer\swarmer_SFX.sqf"] remoteExec ["execVM"];
// [_mobile_s] execVM "\Root_Anomalies\Root_Swarmer\AL_swarmer\swarmer_smoke_detect.sqf";
swarmer_public = _mobile_s; publicVariable "swarmer_public";
atak_swarmer = false; publicVariable "atak_swarmer";

while {alive _mobile_s} do 
{
	while {!(_mobile_s getVariable "isHive")} do {{if (_x distance getPos _mobile_s < 1000) then {_mobile_s setVariable ["isHive",true,true]}} foreach allPlayers; uisleep 10};
	_mobile_s setVariable ["tgt",nil,true];
	_list_unit_range_hiv = [_mobile_s,_radius] call fnc_find_target_hiv; 
	_list_unit_range_hiv = _list_unit_range_hiv select { typeOf _x != "VirtualCurator_F" };
	if (count _list_unit_range_hiv >0) then 
	{
		_tgt_hiv = selectRandom _list_unit_range_hiv;
		_mobile_s setVariable ["tgt",_tgt_hiv,true];
		{[_mobile_s,_x] spawn fnc_avoid_hive} foreach _list_unit_range_hiv;
		_mobile_s disableCollisionWith _tgt_hiv;
		while {(alive _tgt_hiv)and(_tgt_hiv distance _mobile_s < _radius)} do
		{
			if (_tgt_hiv distance _mobile_s > 10) then {_mobile_s moveTo AGLToASL (_tgt_hiv modelToWorld [0,7,0])};
			uisleep 4;
			if ((_tgt_hiv distance _mobile_s <= 10) and (alive _mobile_s)) then 
			{	
				atak_swarmer = true; publicVariable "atak_swarmer";
				_mobile_s moveTo AGLToASL (_tgt_hiv modelToWorld [0,0,0]);
				_mobile_s moveTo AGLToASL (_tgt_hiv modelToWorld [0,0,0]);
				if (alive _mobile_s) then {
				[[_tgt_hiv,_mobile_s],"\Root_Anomalies\Root_Swarmer\AL_swarmer\swarmer_eating_SFX.sqf"] remoteExec ["execVM"];
				_amountOfDamage = _dmg_un;
				_type_of_damage = selectRandom ["bite", "bullet", "explosive", "falling", "grenade", "punch", "ropeburn", "shell", "stab", "unknown"];
				_bodyPart = selectRandom ["head","body","hand_l","hand_r","leg_l","leg_r"];
				if (!(isNil "ace_medical_fnc_addDamageToUnit")) then 
				{
					[_tgt_hiv, _amountOfDamage, _bodyPart, _type_of_damage] remoteExec ["ace_medical_fnc_addDamageToUnit", _tgt_hiv];	
				} else 
				{ 
					_tgt_hiv setdamage ((damage _tgt_hiv) + _amountOfDamage);
				};
				};
				{[_mobile_s,_x] spawn fnc_avoid_hive} foreach _list_unit_range_hiv;
				uisleep 3;
				atak_swarmer = false; publicVariable "atak_swarmer";
				_balta_sange = createVehicle [selectrandom["BloodPool_01_Large_New_F","BloodSplatter_01_Large_New_F"],[0,0,0],[],0,"CAN_COLLIDE"]; _balta_sange setDir (round (random 360)); _balta_sange setposATL [getPosATL _tgt_hiv # 0,getPosATL _tgt_hiv # 1,0]; _balta_sange setVectorUp surfaceNormal getPosASL _balta_sange;
				_mobile_s setpos (position _balta_sange);
				_mobile_s stop true;
				[_balta_sange,["roi_atk_01",300]] remoteExec ["say3d"];
				uisleep 5;
				_mobile_s stop false;
				{[_mobile_s,_x] spawn fnc_avoid_hive} foreach _list_unit_range_hiv;
			};
		};
		if (!alive _tgt_hiv) then 
		{
			[_mobile_s,_tgt_hiv] spawn fnc_ajust_poz;
			uisleep 2;
			_mobile_s stop true;
			[[_tgt_hiv,_mobile_s],"\Root_Anomalies\Root_Swarmer\AL_swarmer\swarmer_eating_SFX.sqf"] remoteExec ["execVM"];
			_tgt_hiv hideObjectGlobal true;
			_oase = createVehicle ["Land_HumanSkeleton_F",getposATL _tgt_hiv,[],0,"CAN_COLLIDE"]; _oase setDir (round (random 360));
			_mobile_s setVariable ["tgt",nil,true];
			atak_swarmer = false; publicVariable "atak_swarmer";
			uisleep 12;
			_mobile_s stop false;
		};
	} else {_mobile_s setVariable ["isHive",false,true]; atak_swarmer = false; publicVariable "atak_swarmer"; uisleep 5};
}:
uisleep 30; deleteVehicle _mobile_s;