// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 
// Tutorial: https://www.youtube.com/user/aliascartoons

/*

================================================================================================================================
STRIGOI Parameters =======================
================================================================================================================================
[_marker_name, _territory, _day_activ, _inflicted_damage, _hp_strigoi] execvm "\Root_Anomalies\Root_Strigoi\AL_strigoi\strigoi_main.sqf"

_marker_name		- string, name of the marker where you want to place the anomaly
_territory			- number, meters, strigoi will move and be active only within boundaries of his territory
_day_activ			- boolean, if false strigoi will be active only at night, if tru he will be active both night and day
_inflicted_damage	- number, the amount of damage strigoi will inflict to his target during attack
_hp_strigoi			- number, strigois health points, as higher it is as resilient will be

*/

// Only run on player machines
if (!hasinterface) exitwith {};

// If ZEN is not loaded, do not start script
if !(isClass (configFile >> "CfgPatches" >> "zen_custom_modules")) exitwith
{
    diag_log "******CBA and/or ZEN not detected. They are required for this mod.";
};

params ["_logic"];

private _radiuspos = getPosATL _logic;

if (isNil "STRIGOI_markerIndex") then { STRIGOI_markerIndex = 0 };

_strigoiMarkerName = format ["STRIGOI_%1", STRIGOI_markerIndex];
STRIGOI_markerIndex = STRIGOI_markerIndex + 1;
_strigoimarker = createMarker [_strigoiMarkerName, _logic];
deleteVehicle _logic;


["Strigoi Anomaly Settings", [
	["SLIDER", ["Strigoi Health", "Amount of damage the Strigoi takes before being killed."], [10, 5000, 400, 0]],
	["TOOLBOX:YESNO", ["Override Minimum Territory", "If true, the minimum territory radius of the Strigoi will be overriden from 75m."], false],
	["SLIDER:RADIUS", ["Strigoi Territory", "Radius in meters of the Strigoi's territory."], [10, 1000, 75, 0, _radiuspos, [7, 120, 32, 1]]],
	["SLIDER:PERCENT", ["Strigoi Damage", "Percentage amount of damage the Strigoi does to his target."], [0.01, 1, 0.6, 2]],
	["TOOLBOX:YESNO", ["AI Panic", "If true, the AI will forcefully run away from Flamer during its attack."], false],
	["TOOLBOX:YESNO", ["Night Mode Only", "If true, Strigoi will only be active/spawned during night time."], false],
	["TOOLBOX:YESNO", ["Disable Sensitive Lights", "If true, Strigoi's 'seizure' like ability will be disabled preventing bright lights from flashing. Highly recommended for people with sensitivity to lights."], false]
	], {
		params ["_results", "_strigoiMarkerName"];
		_results params ["_strigoi_hp", "_territory_override", "_strigoi_territory", "_strigoi_damage", "_isaipanic", "_isnightonly", "_noseizure"];

		if (_territory_override != true) then {
        	if (_strigoi_territory < 75) then {
            	_strigoi_territory = 75;
        	};
    	};

		["Strigoi Anomaly Configured and Created!"] call zen_common_fnc_showMessage;

		[[_strigoiMarkerName, _strigoi_territory, _isnightonly, _strigoi_damage, round _strigoi_hp, _noseizure, _isaipanic], "\Root_Anomalies\Root_Strigoi\AL_strigoi\strigoi_main.sqf"] remoteExec ["BIS_fnc_execVM", 0];

	}, {
		["Aborted"] call zen_common_fnc_showMessage;
		playSound "FD_Start_F";
	}, _strigoiMarkerName] call zen_dialog_fnc_create;

