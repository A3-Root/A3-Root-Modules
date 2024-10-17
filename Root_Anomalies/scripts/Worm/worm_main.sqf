// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT

fnc_avoid_worm ={
    private ["_danger_close", "_op_dir", "_chased_units", "_fct", "_reldir", "_avoid_poz"];
    _danger_close = _this select 0;
    _chased_units = _this select 1;
    {
        _reldir = [_x, getPos _danger_close] call BIS_fnc_dirto;
        _fct = [30, -30] call BIS_fnc_selectRandom;
        if (_reldir<180) then {
            _op_dir=_reldir+180 +_fct
        } else {
            _op_dir=_reldir-180+_fct
        };
        _avoid_poz = [getPosATL _x, 20+random 50, _op_dir] call BIS_fnc_relPos;
        _x domove _avoid_poz;
        _x setskill ["commanding", 1];
    } forEach _chased_units;
};

fnc_vic_dmg = {
    params ["_unit", "_worm_dmg"];
    private ["_vehicle", "_damage", "_vichitpoints", "_worm_dmg"];
    _vehicle = _unit;
	_damage = random(_worm_dmg);
	_vichitpoints = getAllHitPointsDamage _vehicle; _vichitpoints = _vichitpoints select 0;
	{
		_damage = random(_worm_dmg);
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

if (!isServer) exitwith {};

params ["_poz_worm", "_damage_worm", "_territory", "_isaipanic", "_wormdiffuser"];
private ["_press_implicit_x", "_press_implicit_y", "_isacemedical"];

_isacemedical = false;

if !(isClass (configFile >> "CfgPatches" >> "ace_medical_engine")) then {
    diag_log "******ACE Medical Engine not detected. Using vanilla medical system.";
	_isacemedical = false;
} else {
	_isacemedical = true;
};

uiSleep 2;

_cap	= createvehicle ["land_CanOpener_F", getmarkerPos _poz_worm, [], 0, "CAN_COLLIDE"];
_coada	= createvehicle ["land_CanOpener_F", getmarkerPos _poz_worm, [], 0, "CAN_COLLIDE"];
_coada_01= createvehicle ["land_CanOpener_F", getmarkerPos _poz_worm, [], 0, "CAN_COLLIDE"];

_cap setVariable ["isWorm",true,true];

wormkiller = _wormdiffuser; publicVariable "wormkiller";

_coada attachto [_cap, [0, -1, 1]];
_coada_01 attachto [_coada, [0, -1, 1]];
[_coada, true] remoteExec ["hideObjectglobal", 0, true];
[_coada_01, true] remoteExec ["hideObjectglobal", 0, true];

_hide_me = true;
while {_hide_me} do {
    uiSleep 2;
    _list_ai_in_range_worm = (position _cap) nearEntities [["CAManBase", "LandVehicle"], _territory];
    if (count _list_ai_in_range_worm > 0) then {
        _hide_me = false;
        _tgt_worm = _list_ai_in_range_worm call BIS_fnc_selectRandom;
        _dir_move = [getPos _cap, _tgt_worm] call BIS_fnc_dirto;
        _dir_move = _dir_move+45;
        if (_dir_move<=90) then {
            _press_implicit_x = linearConversion [0, 90, _dir_move, 0, 1, true];
            _press_implicit_y = 1-_press_implicit_x;
        };
        
        if ((_dir_move>90)and(_dir_move<180)) then {
            _dir_move = _dir_move-90;
            _press_implicit_x = linearConversion [0, 90, _dir_move, 1, 0, true];
            _press_implicit_y = _press_implicit_x-1;
        };
        
        if ((_dir_move>180)and(_dir_move<270)) then {
            _dir_move = _dir_move-180;
            _press_implicit_x = linearConversion [0, 90, _dir_move, 0, -1, true];
            _press_implicit_y = (-1*_press_implicit_x)-1;
        };
        
        if ((_dir_move>270)and(_dir_move<360)) then {
            _dir_move = _dir_move-270;
            _press_implicit_x = linearConversion [0, 90, _dir_move, -1, 0, true];
            _press_implicit_y = 1+_press_implicit_x;
        };
        [[_cap, _coada, _coada_01], "\Root_Anomalies\Root_Worm\AL_worm\worm_effect.sqf"] remoteExec ["execVM", 0, true];
        [[_cap, _coada], "\Root_Anomalies\Root_Worm\AL_worm\worm_attack.sqf"] remoteExec ["execVM", 0];
        _cap setPosATL [getPosATL _cap select 0, getPosATL _cap select 1, 2];
        _cap setvelocity [_press_implicit_x * 5, _press_implicit_y * 5, 20 + random 10];
        uiSleep 1;
        [_coada, ["strigat", 1000]] remoteExec ["say3D"];
    };
};
uiSleep 1;
enableCamShake false;
waitUntil {
    (getPosATL _cap select 2) < 1
};
[_cap, ["bump", 500]] remoteExec ["say3D"];
addCamShake [1, 4, 23];
[[_cap, _coada], "\Root_Anomalies\Root_Worm\AL_worm\worm_attack.sqf"] remoteExec ["execVM", 0];
[[_cap], "\Root_Anomalies\Root_Worm\AL_worm\worm_bump.sqf"] remoteExec ["execVM", 0];
uiSleep 1;

while {!isNull _cap} do {
    _tgt_worm = [];
    _list_ai_in_range_worm = (position _cap) nearEntities [["CAManBase", "LandVehicle"], _territory];
    _list_ai_in_range_worm select { (typeOf _x != "VirtualCurator_F") }; 
    _tgt_worm = selectRandom _list_ai_in_range_worm;
    if (count _list_ai_in_range_worm > 0) then {
        if ((_tgt_worm distance _cap < 15)&&!(surfaceIsWater getPos _tgt_worm)) then {
            if (_isaipanic) then { [_cap, _list_ai_in_range_worm] call fnc_avoid_worm; };
            _dir_move = [getPos _cap, _tgt_worm] call BIS_fnc_dirto;
            if (_dir_move<=90) then {
                _press_implicit_x = linearConversion [0, 90, _dir_move, 0, 1, true];
                _press_implicit_y = 1-_press_implicit_x;
            };
            
            if ((_dir_move>90)and(_dir_move<180)) then {
                _dir_move = _dir_move-90;
                _press_implicit_x = linearConversion [0, 90, _dir_move, 1, 0, true];
                _press_implicit_y = _press_implicit_x-1;
            };
            
            if ((_dir_move>180)and(_dir_move<270)) then {
                _dir_move = _dir_move-180;
                _press_implicit_x = linearConversion [0, 90, _dir_move, 0, -1, true];
                _press_implicit_y = (-1*_press_implicit_x)-1;
            };
            
            if ((_dir_move>270)and(_dir_move<360)) then {
                _dir_move = _dir_move-270;
                _press_implicit_x = linearConversion [0, 90, _dir_move, -1, 0, true];
                _press_implicit_y = 1+_press_implicit_x;
            };
            _worm_salt = ["salt_08", "salt_05"] call BIS_fnc_selectRandom;
            _cap setvelocity [_press_implicit_x*5, _press_implicit_y*5, 15+random 10];
            [_coada, [_worm_salt, 500]] remoteExec ["say3D"];
            uiSleep 0.5;
            waitUntil {
                (getPosATL _cap select 2) < 1
            };
            [[_cap, _coada], "\Root_Anomalies\Root_Worm\AL_worm\worm_attack.sqf"] remoteExec ["execVM", 0];
            _nearobj_wrom = nearestobjects [getPosATL _cap, [], 15];
            {
                if ((_x!=_cap)&&(_x!=_coada)&&(_x!=_coada_01)&&!(surfaceIsWater getPos _x)) then {
                    if (_x isKindOf "LandVehicle") then {
                        _x setvelocity [_press_implicit_x*5, _press_implicit_y*5, 15+random 10];
                        [_x, _damage_worm] call fnc_vic_dmg;
                    } else {
                        _x setvelocity [_press_implicit_x*5, _press_implicit_y*5, 15+random 10];
                        _bodyPart = ["Head", "RightLeg", "LeftArm", "Body", "LeftLeg", "RightArm"] selectRandomWeighted [0.3, 0.8, 0.65, 0.5, 0.8, 0.65];
                        _dmgType = selectRandom ["backblast", "bullet", "explosive", "grenade", "falling"];
                        if ((typeOf _x != "VirtualCurator_F") && (_x isKindOf "CAManBase")) then 
                        {
                            if(_isacemedical) then 
                            { 
                                [_x, _damage_worm, _bodyPart, _dmgtype] remoteExec ["ace_medical_fnc_addDamageToUnit", _x]; 
                            } else 
                            {
                                _x setdamage ((damage _x) + _damage_worm);
                            }
                        };
                    };
                };
            } forEach _nearobj_wrom;
            uiSleep 1;
            if (_isaipanic) then { [_cap, _list_ai_in_range_worm] call fnc_avoid_worm; };
            if (((getPosATL _cap select 2) <0)or((getPosATL _cap select 2) >2)) then {
                _cap setPos ([getPos _cap, 0.5, 50, 10, 0, 1, 0] call BIS_fnc_findSafePos)
            };
            uiSleep 8;
            _cap setPosATL [getPosATL _cap select 0, getPosATL _cap select 1, 2];
        };
        
        if ((!isNull _tgt_worm)&&(_tgt_worm distance _cap > 15)&&!(surfaceIsWater getPos _tgt_worm)) then {
            _sunet_deplas=["move_01", "move_02", "move_03", "move_04", "move_05", "move_06", "move_07", "move_08", "move_09", "move_10", "move_11", "move_12", "move_13", "move_14", "move_15"] call BIS_fnc_selectRandom;
            if (_isaipanic) then { [_cap, _list_ai_in_range_worm] call fnc_avoid_worm; };
            _fct_move = 8+random 8;
            _fct = [+10+random -35, 10+random 45] call BIS_fnc_selectRandom;
            _dir_move = [getPos _cap, _tgt_worm] call BIS_fnc_dirto;
            _dir_move = _dir_move+_fct;
            if (_dir_move<=90) then {
                _press_implicit_x = linearConversion [0, 90, _dir_move, 0, 1, true];
                _press_implicit_y = 1-_press_implicit_x;
            };
            
            if ((_dir_move>90)and(_dir_move<180)) then {
                _dir_move = _dir_move-90;
                _press_implicit_x = linearConversion [0, 90, _dir_move, 1, 0, true];
                _press_implicit_y = _press_implicit_x-1;
            };
            
            if ((_dir_move>180)and(_dir_move<270)) then {
                _dir_move = _dir_move-180;
                _press_implicit_x = linearConversion [0, 90, _dir_move, 0, -1, true];
                _press_implicit_y = (-1*_press_implicit_x)-1;
            };
            
            if ((_dir_move>270)and(_dir_move<360)) then {
                _dir_move = _dir_move-270;
                _press_implicit_x = linearConversion [0, 90, _dir_move, -1, 0, true];
                _press_implicit_y = 1+_press_implicit_x;
            };
            [_coada, [_sunet_deplas, 500]] remoteExec ["say3D"];
            _cap setvelocity [_press_implicit_x*_fct_move, _press_implicit_y*_fct_move, 5+random 5];
            uiSleep 2;
            _cap setPosATL [getPosATL _cap select 0, getPosATL _cap select 1, 2];
        };
    } else {
        uiSleep 10
    };
};