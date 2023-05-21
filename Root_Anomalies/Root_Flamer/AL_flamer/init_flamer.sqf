// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 
/*
[marker, territory_radius, damage_inflicted, health_points] execvm "\Root_Anomalies\Root_Flamer\AL_flamer\flamer_main.sqf";

marker				- string, name of the marker where you want to place the anomaly
territory_radius	- number, radius in meters of FLAMERs territory
damage_inflicted	- number, damage inflicted by FLAMERs main attack
health_points		- number, amount of health/hit points FLAMER has
*/

// Only run on player machines
if (!hasinterface) exitwith {};

// If ZEN is not loaded, do not start script
if !(isClass (configFile >> "CfgPatches" >> "zen_custom_modules")) exitwith
{
    diag_log "******CBA and/or ZEN not detected. They are required for this mod.";
};

params ["_logic"];

private _pos = getPosATL _logic;

if (isNil "FLAMER_markerindex") then {
    FLAMER_markerindex = 0
};

_flamerMarkerName = format ["FLAMER_%1", FLAMER_markerindex];
FLAMER_markerindex = FLAMER_markerindex + 1;

_flamerMarker = createMarker [_flamerMarkerName, _pos];

deleteVehicle _logic;

// Ask if burn 
["Flamer Anomaly Settings", [
	["SLIDER", ["Flamer Health", "Amount of damage the Flamer takes before being killed."], [10, 5000, 400, 0]], 
	["TOOLBOX:YESNO", ["Override Minimum Territory", "If true, the minimum territory radius of the Flamer will be overriden from 75m."], false],
	["SLIDER:RADIUS", ["Flamer Territory", "Radius in meters of the Flamer's territory."], [1, 1000, 75, 0, _pos, [7, 120, 32, 1]]], 
	["SLIDER:PERCENT", ["Flamer Damage", "Percentage amount of damage the Flamer does to its target. Recommended to start from low and gradually increase to your preferred range."], [0.01, 1, 0.4, 2]], 
	["TOOLBOX:YESNO", ["AI Burn", "If true, the AI will forcefully run away from Flamer during its attack."], false],
	["SLIDER", ["Flamer Recharge Delay", "Delay in seconds between Flamer's attacks. Recommended to keep lower values."], [1, 60, 1, 0]], 
	["SLIDER:PERCENT", ["Flamer Damage on Death", "Percentage amount of damage the Flamer does to the surrounding when it dies."], [0.01, 1, 1, 2]]
	], {
		params ["_results", "_flamerMarkerName"];
		_results params ["_flamer_hp", "_territory_override", "_flamer_territory", "_flamer_damage", "_isaipanic", "_flamer_recharge", "_damage_on_death"];

		if (_territory_override != true) then {
        	if (_flamer_territory < 75) then {
            	_flamer_territory = 75;
        	};
    	};
		
		["Flamer Anomaly Configured and Created!"] call zen_common_fnc_showMessage;
		
		[[_flamerMarkerName, _flamer_territory, _flamer_damage, _flamer_recharge, round _flamer_hp, _damage_on_death, _isaipanic], "\Root_Anomalies\Root_Flamer\AL_flamer\flamer_main.sqf"] remoteExec ["BIS_fnc_execVM", 0];
	}, {
		["Aborted"] call zen_common_fnc_showMessage;
		playSound "FD_Start_F";
	}, _flamerMarkerName] call zen_dialog_fnc_create;

