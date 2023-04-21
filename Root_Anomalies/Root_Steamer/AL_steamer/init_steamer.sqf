// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 
/*
[marker_namer, territory, damage_inflicted, recharge_delay] execVM "\Root_Anomalies\Root_Steamer\AL_steamer\steamer_main.sqf";


marker_namer		- string,  name of the marker where you want the anomaly to spawn
territory			- number,  radius in meters of Streamer's territory
damage_inflicted	- number,  amount of damage inflicted by Streamer's burst
recharge_delay		- number,  delay in seconds between Streamer's attacks
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

if (isNil "STEAMER_markerIndex") then { STEAMER_markerIndex = 0 };

_steamerMarkerName = format ["STEAMER_%1",  STEAMER_markerIndex];
STEAMER_markerIndex = STEAMER_markerIndex + 1;
_steamermarker = createMarker [_steamerMarkerName,  _logic];
deleteVehicle _logic;

["Steamer Anomaly Settings", [
	["TOOLBOX:YESNO", ["Override Minimum Territory", "If true, the minimum territory radius of the Steamer will be overriden from 75m."], false],
	["SLIDER:RADIUS", ["Steamer Territory", "Radius in meters of the Steamer's territory."], [10, 1000, 75, 0, _radiuspos, [7, 120, 32, 1]]],
	["SLIDER:PERCENT", ["Steamer Damage", "Percentage amount of damage the Steamer does to his target."], [0.01, 1, 0.2, 2]],
	["SLIDER", ["Steamer Recharge Delay", "Delay in seconds between Steamer's attacks."], [5, 60, 10, 0]],
	["SLIDER:PERCENT", ["Steamer Damage on Death", "Percentage amount of damage the Steamer does upon death."], [0.01, 1, 0.6, 2]],
	["TOOLBOX:YESNO", ["Enable Travel Path", "If true, the Steamer's location will be easier to identify/pinpoint as it will generate a line of dug up mud towards its target."], false]
	], {
		params ["_results", "_steamerMarkerName"];
		_results params ["_territory_override", "_steamer_territory", "_steamer_damage", "_steamer_recharge", "_dmg_on_death", "_travelpath"];

		if (_territory_override != true) then {
        	if (_steamer_territory < 75) then {
            	_steamer_territory = 75;
        	};
    	};
		
		["Steamer Anomaly Configured and Created!"] call zen_common_fnc_showMessage;

		[[_steamerMarkerName, _steamer_territory, _steamer_damage, _steamer_recharge, _dmg_on_death, _travelpath], "\Root_Anomalies\Root_Steamer\AL_steamer\steamer_main.sqf"] remoteExec ["BIS_fnc_execVM", 0];
	}, {
		["Aborted"] call zen_common_fnc_showMessage;
		playSound "FD_Start_F";
	},  _steamerMarkerName] call zen_dialog_fnc_create;