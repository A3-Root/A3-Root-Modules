// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 
// The WORM DEMO
// Tutorial: https://www.youtube.com/user/aliascartoons

/*

================================================================================================================================
WORM Parameters =======================
================================================================================================================================
null = [marker_name]execvm "AL_worm\worm.sqf"

marker_name	- string, name of the marker where you want to place the anomaly

*/
	

// Only run on player machines
if (!hasinterface) exitwith {};

// If ZEN is not loaded, do not start script
if !(isClass (configFile >> "CfgPatches" >> "zen_custom_modules")) exitwith
{
    diag_log "******CBA and/or ZEN not detected. They are required for this mod.";
};

params ["_logic"];

if (isNil "WORM_markerIndex") then { WORM_markerIndex = 0 };
_wormmarkerName = format ["WORM_%1", WORM_markerIndex];
WORM_markerIndex = WORM_markerIndex + 1;
_wormmarker = createMarker [_wormmarkerName, _logic];

private _radiuspos = getPosATL _logic;

deleteVehicle _logic;


["Worm Anomaly Settings", [
	["TOOLBOX:YESNO", ["Override Minimum Territory", "If true, the minimum territory radius of the Worm will be overriden from 200m."], false],
	["SLIDER:RADIUS", ["Worm Territory", "Radius in meters of the Worm's territory."], [50, 1000, 200, 0, _radiuspos, [7, 120, 32, 1]]], 
	["TOOLBOX:YESNO", ["AI Panic", "If true, the AI will run away from the Worm and its territory during its attack."], false],
	["EDIT", ["Worm Diffuser", "Classname of the object used to kill the Worm."], ["SmokeShellGreen"]], 
	["SLIDER:PERCENT", ["Worm Damage", "Percentage amount of damage the Worm does to its target."], [0.01, 1, 0.6, 2]]
	], {
		params ["_results", "_wormmarkerName"];
		_results params ["_override_territory", "_worm_territory", "_isaipanic", "_wormdiffuser", "_worm_damage"];

		if ((_override_territory != true) && (_worm_territory < 200)) then {
			_worm_territory = 200;
		};

		if (getNumber (configFile >> "CfgVehicles" >> _wormdiffuser >> "scope") > 0) then 
		{
			_wormdiffuser = _wormdiffuser;
		} else 
		{
			_wormdiffuser = "SmokeShellGreen";
		};

        ["Worm Anomaly configured and active!"] call zen_common_fnc_showMessage;

		[[_wormmarkerName, _worm_damage, _worm_territory, _isaipanic, _wormdiffuser], "\Root_Anomalies\Root_Worm\AL_worm\worm_main.sqf"] remoteExec ["BIS_fnc_execVM", 0];
	}, {
		["Aborted"] call zen_common_fnc_showMessage;
		playSound "FD_Start_F";
	}, _wormmarkerName] call zen_dialog_fnc_create;
