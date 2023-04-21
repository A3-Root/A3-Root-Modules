// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

#include "\Root_Anomalies\Root_Strigoi\AL_strigoi\strigoi_functions.hpp"
if (!isServer) exitWith {};
params ["_poz_orig_sc", "_teritoriu", "_vizible_day", "_damage_strig", "_hp_strigoi", "_noseize", "_isaipanic"];
private ["_hp_incr","_hp_curr_strig","_pos_strig","_anomalie_dedus","_gasit","_obj_de_agatat","_pot_poz","_press_implicit_x","_press_implicit_y","_fct_mult","_vert_vit","_inaltime_salt","_distanta_salt","_dur_zbor","_umbla_casper","_strigoi","_tgt_casp", "_isaipanic"];

[] spawn {
	if (isNil "allPlayers_on") then 
	{
		chk_players = true;
		while {chk_players} do 
		{
			allPlayers_on = call BIS_fnc_listPlayers;
			publicVariable "allPlayers_on";
			sleep 60;
		};
	}
};

sleep 2;

_ck_pl = false;
while {!_ck_pl} do {{if (_x distance getMarkerPos _poz_orig_sc < _teritoriu) then {_ck_pl = true}} foreach allPlayers;sleep 10};

_strigoi = createAgent ["C_Soldier_VR_F",getMarkerPos _poz_orig_sc, [],0, "NONE"];
_strigoi setVariable ["BIS_fnc_animalBehaviour_disable", true];
_strigoi setSpeaker "NoVoice"; _strigoi disableConversation true;
_strigoi addRating -10000; _strigoi setBehaviour "CARELESS";
_strigoi enableFatigue false; _strigoi setSkill ["courage", 1];
_strigoi setUnitPos "UP"; _strigoi disableAI "ALL"; _strigoi setMass 7000;
{_strigoi enableAI _x} forEach ["MOVE","ANIM","TEAMSWITCH","PATH"];



/*
_hp_curr_strig = 1/_hp_strigoi;
_strigoi setVariable ["al_dam_total",_hp_curr_strig,true];
_strigoi setVariable ["al_dam_incr",_hp_curr_strig,true];

_strigoi removeAllEventHandlers "hit";
_strigoi addEventHandler ["Hit", {[[_this select 0],"\Root_Anomalies\Root_Strigoi\AL_strigoi\strigoi_splash_hit.sqf"] remoteExec ["execvm"]}];
_strigoi addEventHandler ["Killed", {(_this select 0) hideObjectGlobal true; (_this select 1) addRating 2000}];
_strigoi removeAllEventHandlers "HandleDamage";
_strigoi addEventhandler ["HandleDamage",{params ["_unit","_damage","_bullet"];	_unit = _this select 0;	_bullet =_this select 4; _curr_dam = (_unit getVariable "al_dam_total") + (_unit getVariable "al_dam_incr");	_unit setVariable ["al_dam_total",_curr_dam,true];
if ((_bullet=="") or ((_unit getVariable "al_dam_total")<1)) then {0}else{1}}];
*/


_hp_curr_strig = 1/_hp_strigoi;
_strigoi setVariable ["al_dam_total", 0];
_strigoi setVariable ["al_dam_incr", _hp_curr_strig];
_strigoi removeAllEventHandlers "hit";

_strigoi addEventHandler ["Hit", {
    _unit=_this#0;
    _curr_dam = (_unit getVariable "al_dam_total")+(_unit getVariable "al_dam_incr"); _unit setVariable ["al_dam_total", _curr_dam];if ((_unit getVariable "al_dam_total")>1) then {
        _unit setDamage 1
    };
    [[_unit], "\Root_Anomalies\Root_Strigoi\AL_strigoi\strigoi_splash_hit.sqf"] remoteExec ["execVM"]
}];

_strigoi removeAllEventHandlers "Handledamage";

_strigoi addEventHandler ["Handledamage", {
    0
}];

_strigoi addEventHandler ["Killed", {
    (_this select 0) hideObjectglobal true;
    (_this select 1) addrating 2000
}];





_strigoi setAnimSpeedCoef 1.1;

_umbla_casper = "Land_HelipadEmpty_F" createVehicle [getPosATL _strigoi select 0,getPosATL _strigoi select 1, 20];
_cap_casper = "Land_HelipadEmpty_F" createVehicle [0,0,0];
_cap_casper attachto [_strigoi, [0,0,0.2],"neck"];
_strigoi setVariable ["_cap_casper", _cap_casper, true];
for "_i" from 0 to 5 do {_strigoi setObjectMaterialGlobal [_i,"A3\Structures_F\Data\Windows\window_set.rvmat"]};
for "_i" from 0 to 5 do {_strigoi setObjectTextureGlobal [_i,"#(ai,512,512,1)perlinNoise(256,256,0,0.3)"]};
_strigoi call fnc_hide_strig;
[[_strigoi],"\Root_Anomalies\Root_Strigoi\AL_strigoi\strigoi_fatigue_p.sqf"] remoteExec ["execVM",0,true];

_list_unit_range_casp = [];

while {alive _strigoi} do 
{
	while {count _list_unit_range_casp isEqualTo 0} do {_list_unit_range_casp = [_strigoi,_teritoriu] call fnc_find_target; sleep 10};
	_tgt_casp = selectRandom ( _list_unit_range_casp select { (typeOf _x != "VirtualCurator_F") && (lifeState _x != "INCAPACITATED") } );
	[_strigoi,getMarkerPos _poz_orig_sc,_teritoriu] call fnc_show_strig;
	while {(!isNil "_tgt_casp") && {(alive _strigoi) && ((_strigoi distance getMarkerPos _poz_orig_sc) < _teritoriu)}} do 
	{
		[_list_unit_range_casp] call fnc_strig_drain;
		_strigoi moveTo AGLToASL (_tgt_casp getRelPos[10,180]);
		if (_isaipanic) then { [_strigoi,_tgt_casp] call fnc_avoid_casp; };
		sleep 1;
		if (_strigoi distance _tgt_casp <40) then 
		{
			_atk_sun = selectRandom ["01_atk_bg","02_atk","03_atk","04_atk"];
			[_strigoi,[_atk_sun,400]] remoteExec ["say3d"];
			[_strigoi,_tgt_casp,_damage_strig,_noseize] call fnc_attk_strigoi;
			sleep 1;
		};
		if (selectRandom [true,false]) then 
		{
			if (selectRandom [true,false]) then 
			{
				_copaci = nearestTerrainObjects [_tgt_casp,["TREE"],20];
				if !(count _copaci isEqualTo 0) then 
				{
					sleep 1;
					_obj_de_agatat = "";
					{
						_unghi_fugarit = _strigoi getRelDir _tgt_casp;
						_unghi_ancora = _strigoi getRelDir _x;
						_toleranta = abs(_unghi_fugarit-_unghi_ancora);
						_pot_poz = (boundingCenter _x) select 2;
						if ((_pot_poz>2)and {(_toleranta<60)and(_strigoi distance _x < 20)}) exitWith 
						{
							_obj_de_agatat=_x;
							[_strigoi,_tgt_casp,_umbla_casper,_obj_de_agatat,_cap_casper,_pot_poz] call fnc_salt_strig_1;
							sleep 1;
							[_strigoi,_tgt_casp,_umbla_casper,_obj_de_agatat,_cap_casper] call fnc_salt_strig_2;
						};
					} foreach _copaci;
				}
			} else {[_strigoi,_tgt_casp,_cap_casper] call fnc_jump_ground};
		};
		
		if ((!alive _tgt_casp)or(_tgt_casp distance getMarkerPos _poz_orig_sc > _teritoriu)) then 
		{
			_list_unit_range_casp = [_strigoi,_teritoriu] call fnc_find_target;
			if !(count _list_unit_range_casp isEqualTo 0) then {_tgt_casp = selectRandom ( _list_unit_range_casp select { (typeOf _x != "VirtualCurator_F") && (lifeState _x != "INCAPACITATED") })} else {_tgt_casp = nil};
		};
		sleep 1;
	};
	_strigoi call fnc_hide_strig;
	_tgt_casp = nil;
	_list_unit_range_casp = [];
	sleep 5;
};
deleteVehicle _umbla_casper;detach _cap_casper;deleteVehicle _cap_casper;sleep 5;deleteVehicle _strigoi;