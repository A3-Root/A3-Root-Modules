// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT
fnc_teleportSFX_AI = {
    private ["_unit", "_ind"];
    _unit = _this select 0;
    _ind = 3;
    while {_ind>0} do {
        _unit hideObjectglobal true;
        uiSleep 0.2; _unit hideObjectglobal false;uiSleep 0.2;_ind = _ind-1
    };
};

private ["_noseize"];

if (!isServer) exitwith {};
_obj_teleporter  = _this select 0;
_obj_core		 = _this select 1;
_dmg_on_teleport = _this select 2;
_noseize       = _this select 3;


_list_teleport=[];
_list_vek_teleport=[];

while {alive _obj_teleporter} do {
    _list_teleport = (position _obj_teleporter) nearEntities ["CAManBase", 15];
    if (protection_smug !="") then {
        if (count _list_teleport>0) then {
            {
                if ((headgear _x == protection_smug)or(goggles _x==protection_smug)or(uniform _x==protection_smug)or(vest _x==protection_smug)or(backpack _x==protection_smug) or (protection_smug in (assigneditems _x + items _x))) then {} else {
                    _fresh_spawn = _x getVariable "teleported_in";
                    if (isnil "_fresh_spawn") then {
                        [_obj_teleporter, ["tele_message", 100]] remoteExec ["say3D"];
                        [_x] call fnc_teleportSFX_AI;
                        if (isplayer _x) then {
                            [[_x, _obj_teleporter, _noseize, _dmg_on_teleport], "\Root_Anomalies\Root_Smuggler\AL_smuggler\smuggler_teleport_effect.sqf"] remoteExec ["execVM"]
                        } else {
                            _dest_tele = [getPos _obj_teleporter, 300, -1, 5, 0, 0.5, 0] call BIS_fnc_findSafePos;
                            _x setPos _dest_tele;
                            if (_x isKindOf "Man") then {
                                _bodyPart = ["Head", "RightLeg", "LeftArm", "Body", "LeftLeg", "RightArm"] selectRandomWeighted [0.3, 0.8, 0.65, 0.5, 0.8, 0.65];
                                _dmgType = selectRandom ["backblast", "bullet", "explosive", "grenade"];
                                if (!(isNil "ace_medical_fnc_addDamageToUnit")) then 
                                {
	                                [_x, _dmg_on_teleport, _bodyPart, _dmgType] remoteExec ["ace_medical_fnc_addDamageToUnit", _x];	
                                } else 
                                { 
	                                _x setdamage ((damage _x) + _dmg_on_teleport);
                                };
                            } else {
								_x setDamage (damage _x + _dmg_on_teleport);
                            };
                        };
                    };
                };
            } forEach _list_teleport;
        };
    } else {
        {
            _fresh_spawn = _x getVariable "teleported_in";
            if (isnil "_fresh_spawn") then {
                [_obj_teleporter, ["tele_message", 100]] remoteExec ["say3D"];
                [_x] call fnc_teleportSFX_AI;
                if (isplayer _x) then {
                    [[_x, _obj_teleporter, _noseize, _dmg_on_teleport], "\Root_Anomalies\Root_Smuggler\AL_smuggler\smuggler_teleport_effect.sqf"] remoteExec ["execVM"]
                } else {
                    _dest_tele = [getPos _obj_teleporter, 300, -1, 5, 0, 0.5, 0] call BIS_fnc_findSafePos;
                    _x setPos _dest_tele;
                    if (_x isKindOf "Man") then {
                        _bodyPart = ["Head", "RightLeg", "LeftArm", "Body", "LeftLeg", "RightArm"] selectRandomWeighted [0.3, 0.8, 0.65, 0.5, 0.8, 0.65];
                        _dmgType = selectRandom ["backblast", "bullet", "explosive", "grenade"];
                        if (!(isNil "ace_medical_fnc_addDamageToUnit")) then 
                        {
	                        [_x, _dmg_on_teleport, _bodyPart, _dmgType] remoteExec ["ace_medical_fnc_addDamageToUnit", _x];	
                        } else 
                        { 
	                        _x setdamage ((damage _x) + _dmg_on_teleport);
                        };

                    } else {
                        _x setDamage ((damage _x) + _dmg_on_teleport);
                    };
                };
            };
        } forEach _list_teleport;
    };
    
    _list_vek_teleport = (position _obj_teleporter) nearEntities ["landvehicle", 15];
    if (count _list_vek_teleport>0) then {
        {
            _fresh_spawn = _x getVariable "teleported_in";
            if (isnil "_fresh_spawn") then {
                [_obj_teleporter, ["tele_message", 100]] remoteExec ["say3D"];
                [_x] call fnc_teleportSFX_AI;
                _dest_tele = [getPos _obj_teleporter, 300, -1, 5, 0, 0.5, 0] call BIS_fnc_findSafePos;
                _x setPos _dest_tele;
                _x setDamage ((damage _x) + _dmg_on_teleport);
            };
        } forEach _list_vek_teleport;
        _list_vek_teleport = [];
        _list_teleport=[];
    };
    uiSleep 2;
};