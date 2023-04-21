// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 
fnc_find_target = {
	private ["_neartargets","_teritoriu"];
	_strigoi = _this # 0;
	_teritoriu = _this # 1;
	_neartargets = (ASLToAGL getPosASL _strigoi) nearEntities ["CAManBase",_teritoriu];
	_neartargets - [_strigoi];
};

fnc_strig_drain ={
	private ["_list_unit_range_casp"];
	_list_unit_range_casp = _this # 0;
	{_x setFatigue ((getfatigue _x) + 0.1)} forEach _list_unit_range_casp;
};

fnc_avoid_casp ={
	_strig = _this # 0;
	_chased = _this # 1;
	if (isPlayer _chased) exitWith {};
	_relPos = _chased getPos [10, (_strig getDir _chased) + (random 33)*(selectRandom [1,-1])];
	_chased doMove _relPos;
	_chased setSkill ["commanding", 1];
};

fnc_attk_strigoi = {
	private ["_strigoi","_tgt_casp","_damage_strig", "_noseize"];
	_strigoi		= _this # 0;
	_tgt_casp		= _this # 1;
	_damage_strig	= _this # 2;
	_noseize	    = _this # 3;
	[[_strigoi,_tgt_casp,_noseize],"\Root_Anomalies\Root_Strigoi\AL_strigoi\strigoi_atk_viz.sqf"] remoteExec ["execVM"];
	if ((isPlayer _tgt_casp) && (typeOf _tgt_casp != "VirtualCurator_F")) then {
		[[_damage_strig, _noseize],"\Root_Anomalies\Root_Strigoi\AL_strigoi\strigoi_tgt_attk.sqf"] remoteExec ["execVM",_tgt_casp]
	} else {
		if (_tgt_casp isKindOf "Man") then {
			_bodyPart = ["Head", "RightLeg", "LeftArm", "Body", "LeftLeg", "RightArm"] selectRandomWeighted [0.3,0.8,0.65,0.5,0.8,0.65];
			_dmgType = selectRandom ["backblast", "bullet", "explosive", "grenade"];
			if (typeOf _tgt_casp != "VirtualCurator_F") then { 
				if (!(isNil "ace_medical_fnc_addDamageToUnit")) then 
				{
					[_tgt_casp, _damage_strig, _bodyPart, _dmgType] remoteExec ["ace_medical_fnc_addDamageToUnit", _tgt_casp];	
				} else 
				{ 
					_x setdamage ((damage _tgt_casp) + _damage_strig);
				};
			};
		} else {
			_tgt_casp setDamage ((damage _tgt_casp) + _damage_strig);
		};
		
	};
	sleep 1;
};

fnc_hide_strig = {
	_this setVariable ["vizibil",false,true];
	[_this getVariable "_cap_casper",["03_tip_casp",1000]] remoteExec ["say3d"];
	_this enableSimulationGlobal false; _this hideObjectGlobal true;
};

fnc_show_strig = {
	private ["_strigoi","_poz_orig_sc","_pos_strig","_teritoriu"];
	_strigoi= _this # 0;
	_poz_orig_sc= _this # 1;
	_teritoriu= _this # 2;
	_pos_strig = [_poz_orig_sc,1,_teritoriu/10, 3, 0, 20, 0] call BIS_fnc_findSafePos;
	_strigoi setPos _pos_strig;
	_strigoi setVariable ["vizibil",true,true];
	[[_strigoi],"\Root_Anomalies\Root_Strigoi\AL_strigoi\strigoi_sfx.sqf"] remoteExec ["execVM",0];
	_strigoi enableSimulationGlobal true; _strigoi hideObjectGlobal false; {_strigoi reveal _x} forEach (_strigoi nearEntities [["CAManBase"],100]);
	[_strigoi getVariable "_cap_casper",["03_tip_casp",1000]] remoteExec ["say3d"];
};

fnc_salt_strig_1 = {
	params ["_strigoi","_poz_tgt","_umbla_casper","_obj_de_agatat","_cap_casper","_pot_poz"];
	private "_unghi_fugarit";
	_umbla_casper setPos (_obj_de_agatat getPos [2,_obj_de_agatat getRelDir _poz_tgt]);
	_salt_sunet=["01_salt","02_salt","03_salt"] call BIS_fnc_selectRandom; 
	[_cap_casper,[_salt_sunet,200]] remoteExec ["say3d"];
	_strigoi setVelocityTransformation [getPosASL _strigoi,getposasl _umbla_casper, velocity _strigoi,velocity _umbla_casper,[0,0,0],[0,0,0],[0,0,1],[0,0,2],0.3];
	_strigoi attachto [_umbla_casper,[0,0,(getPos _obj_de_agatat select 2) + _pot_poz/4]];
	_strigoi setdir (_strigoi getRelDir _poz_tgt);
	_tipat_casp= selectRandom ["01_tip_casp","NoSound","02_tip_casp","03_tip_casp","NoSound","04_tip_casp","05_tip_casp","06_tip_casp","07_tip_casp","NoSound"];
	[_cap_casper,[_tipat_casp,500]] remoteExec ["say3d"];
};

fnc_salt_strig_2 ={
	params ["_strigoi","_tgt_casp","_umbla_casper","_obj_de_agatat","_cap_casper"];
	private ["_jump_dir"];
	_jump_dir = (getposasl _strigoi vectorFromTo getposasl _tgt_casp) vectorMultiply 10;
	_salt_sunet= selectRandom ["01_salt","02_salt","03_salt"]; 
	_strigoi attachto [_umbla_casper,[0,0,((boundingCenter _obj_de_agatat) select 2)*2]];
	[_cap_casper,[_salt_sunet,200]] remoteExec ["say3d"];
	detach _strigoi;
	_strigoi setvelocity [_jump_dir # 0,_jump_dir # 1,3];
};

fnc_jump_ground ={
	params ["_strigoi","_tgt_casp","_cap_casper"];
	private ["_jump_dir"];
	_jump_dir = (getposasl _strigoi vectorFromTo getposasl _tgt_casp) vectorMultiply 15;
	_salt_sunet= selectRandom ["01_salt","02_salt","03_salt"]; 
	[_cap_casper,[_salt_sunet,200]] remoteExec ["say3d"];
	_strigoi setvelocity [_jump_dir # 0,_jump_dir # 1,round (5+random 15)];
};