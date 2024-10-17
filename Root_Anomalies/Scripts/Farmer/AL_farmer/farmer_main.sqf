// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 
#include "\Root_Anomalies\Root_Farmer\AL_farmer\farmer_functions.hpp"
private ["_marker_farmer", "_territory", "_damage_inflicted", "_recharge_delay", "_health_points", "_pozitie_noua", "_tgt_farmer", "_list_unit_range_farm", "_isaipanic"];

if (!isServer) exitwith {};

params ["_marker_farmer", "_territory", "_damage_inflicted", "_recharge_delay", "_health_points", "_isaipanic"];
_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimstring;
explozie = "\Root_Anomalies\Root_Farmer\sound\punch_7.ogg";
pietre = "\Root_Anomalies\Root_Farmer\sound\pietre.ogg";
travel_ground = "\Root_Anomalies\Root_Farmer\sound\travel_ground.ogg";
eko = "\Root_Anomalies\Root_Farmer\sound\eko.ogg";
publicVariable "explozie";
publicVariable "pietre";
publicVariable "travel_ground";
publicVariable "eko";
_ck_pl = false;

while {!_ck_pl} do {
    {
        if (_x distance getmarkerPos _marker_farmer < _territory) then {
            _ck_pl = true
        }
    } forEach allplayers;
    sleep 5; // sleep 10;
};

_farmer = createAgent ["C_Soldier_VR_F", getmarkerPos _marker_farmer, [], 0, "NONE"];
_farmer setVariable ["BIS_fnc_animalbehaviour_disable", true];
_farmer setspeaker "NoVoice";
_farmer disableConversation true;_farmer addrating -10000; _farmer setBehaviour "CARELESS";
_farmer enableFatigue false;
_farmer setskill ["courage", 1];_farmer setunitPos "UP"; _farmer disableAI "ALL"; _farmer setMass 7000;

{
    _farmer enableAI _x
} forEach ["move", "ANIM", "teamSwitch", "PATH"];

_hp_curr_farmer = 1/_health_points;
_farmer setVariable ["al_dam_total", 0];
_farmer setVariable ["al_dam_incr", _hp_curr_farmer];
_farmer removeAllEventHandlers "hit";

_farmer addEventHandler ["Hit", {
    _unit=_this#0;
    _curr_dam = (_unit getVariable "al_dam_total")+(_unit getVariable "al_dam_incr"); _unit setVariable ["al_dam_total", _curr_dam];if ((_unit getVariable "al_dam_total")>1) then {
        _unit setDamage 1
    };
    [[_unit], "\Root_Anomalies\Root_Farmer\AL_farmer\farmer_splash_hit.sqf"] remoteExec ["execVM"]
}];

_farmer removeAllEventHandlers "Handledamage";

_farmer addEventHandler ["Handledamage", {
    0
}];

_farmer addEventHandler ["Killed", {
    (_this select 0) hideObjectglobal true;
    (_this select 1) addrating 2000
}];

for "_i" from 0 to 5 do {
    _farmer setobjectMaterialGlobal [_i, "\a3\data_f\default.rvmat"]
};

for "_i" from 0 to 5 do {
    _farmer setobjecttextureGlobal [_i, "#(argb, 8, 8, 3)color(0, 0.5, 0, 0.5)"]
};

for "_i" from 0 to 5 do {
    _farmer setobjecttextureGlobal [_i, "a3\structures_f_mark\training\data\shootingmat_01_opfor_co.paa"]
};

_farmer call fnc_hide_farmer;
_farmer enableSimulationGlobal false;

while {alive _farmer} do {
    _ck_pl = false;
    _farmer setunitPos "UP";
    while {!_ck_pl} do {
        {
            if (_x distance getmarkerPos _marker_farmer < _territory) then {
                _ck_pl = true
            }
        } forEach allplayers;
        sleep 5; // sleep 30
    };
    _list_unit_range_farm = [_farmer, _territory] call fnc_find_target_farm;
    _tgt_farmer = selectRandom (_list_unit_range_farm select {
        (typeOf _x != "VirtualCurator_F") && (lifeState _x != "INCAPACITATED")
    });
    _farmer setunitPos "UP";
    _farmer enableSimulationGlobal true;
    _farmer setunitPos "UP";
    [_farmer, getmarkerPos _marker_farmer] call fnc_show_farmer;
    while {
        (!isnil "_tgt_farmer")&&{
            (alive _farmer)&&((_farmer distance getmarkerPos _marker_farmer) < _territory)
        }
    } do
    {
        _farmer setDir (_farmer getRelDir _tgt_farmer);
        if ((_farmer distance _tgt_farmer)>20) then {
            _farmer call fnc_hide_farmer;
            [_farmer, _tgt_farmer] call fnc_travel_farmer;
            _pozitie_noua = _farmer getVariable "pozitie_noua";
            [_farmer, _pozitie_noua] call fnc_show_farmer;
            if (_isaipanic) then 
            {
                {
                    [_farmer, _x] spawn fnc_avoid_farmer
                } forEach _list_unit_range_farm;
            };
            sleep 1;
        };
        _farmer setunitPos "UP";
        if ((_farmer distance _tgt_farmer)<20) then {
            sleep 1;
            [_farmer, _damage_inflicted] call fnc_attk_farmer;
            if (_isaipanic) then 
            {
                {
                    [_farmer, _x] spawn fnc_avoid_farmer
                } forEach _list_unit_range_farm;
            };
            sleep _recharge_delay;
        } else {
            sleep 1+random 2;
            _farmer call fnc_hide_farmer
        };
        _farmer setunitPos "UP";
        if ((!alive _tgt_farmer)or(_tgt_farmer distance getmarkerPos _marker_farmer > _territory)) then {
            _list_unit_range_farm = [_farmer, _territory] call fnc_find_target_farm;
            if !(count _list_unit_range_farm isEqualto 0) then {
                _tgt_farmer = selectRandom (_list_unit_range_farm select { (typeOf _x != "VirtualCurator_F") && (lifeState _x != "INCAPACITATED") });
            } else {
                _tgt_farmer = nil
            };
        };
    };
    _farmer setunitPos "UP";
    sleep 1;
    _farmer call fnc_hide_farmer;
    	_farmer enableSimulationGlobal false;
    _list_unit_range_farm =[];
    _farmer setunitPos "UP";
};

playSound3D ["\Root_Anomalies\Root_Farmer\sound\eko.ogg", "", false, [getPos _farmer select 0, getPos _farmer select 1, 100], 20, 5, 0];

deletevehicle _farmer;