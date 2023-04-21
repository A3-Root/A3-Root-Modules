// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 
/*
[object_name, territory_radius, throwable_class_name, damage_inflicted] execvm "\Root_Anomalies\Root_Swarmer\AL_swarmer\swarmer_main.sqf";

object_name			 - string, the name of the object you use as start location for SWARMER
territory_radius	 - number, radius of territory in meters
throwable_class_name - string, class name of the throwable item you want to use as pesticide
damage_inflicted	 - number, the amount of damage SWARMER inflicts with his attacks
*/

// Only run on player machines
if (!hasinterface) exitwith {};

// If ZEN is not loaded, do not start script
if !(isClass (configFile >> "CfgPatches" >> "zen_custom_modules")) exitwith
{
    diag_log "******CBA and/or ZEN not detected. They are required for this mod.";
};

params ["_logic"];

private _swarmerloc = getPosATL _logic;
deleteVehicle _logic;

["Swarmer Anomaly Settings", [
	["EDIT", ["Swarmer Hive Object", "Classname of the object used to spawn the Swarmer."], ["Land_GarbageBags_F"]], 
	["TOOLBOX:YESNO", ["Override Minimum Territory", "If true, the minimum territory radius of the Swarmer will be overriden from 75m."], false],
	["SLIDER:RADIUS", ["Swarmer Territory", "Radius in meters of the Swarmer's territory."], [1, 1000, 75, 0, _swarmerloc, [7, 120, 32, 1]]], 
	["TOOLBOX:YESNO", ["Disable Pesticide", "If true, Pesticide will be disabled and the Swarmer cannot be killed conventionally."], false],
	["EDIT", ["Pesticide", "Classname of the THROWABLE OBJECT (Grenades, Smokes, etc.) used to kill the Swarmer."], ["SmokeShellGreen"]], 
	["SLIDER:PERCENT", ["Swarmer Damage", "Percentage amount of damage the Swarmer does to his target."], [0.01, 1, 0.6, 2]]
	], {
		params ["_results", "_swarmerloc"];
		_results params ["_swarmerobject", "_territory_override", "_swarmer_territory", "_needpesticide", "_pesticideobject", "_swarmerdamage"];
		private _swarmerhive = "Land_GarbageBags_F";

		if (getNumber (configFile >> "CfgVehicles" >> _swarmerobject >> "scope") > 0) then 
		{
			_swarmerhive = _swarmerobject createVehicle _swarmerloc;
		} else 
		{
			_swarmerhive = "Land_GarbageBags_F" createVehicle _swarmerloc;
		};

		if (getNumber (configFile >> "CfgVehicles" >> _pesticideobject >> "scope") > 0) then 
		{
			_pesticideobject = _pesticideobject;
		} else 
		{
			if !(_nopesticide) then { _pesticideobject = "SmokeShellGreen"; };
		};

		if (_territory_override != true) then {
        	if (_swarmer_territory < 75) then {
            	_swarmer_territory = 75;
        	};
    	};

		["Swarmer Anomaly configured and active!"] call zen_common_fnc_showMessage;

		[[_swarmerhive, _swarmer_territory, _pesticideobject, _swarmerdamage], "\Root_Anomalies\Root_Swarmer\AL_swarmer\swarmer_main.sqf"] remoteExec ["BIS_fnc_execVM", 0];
	}, {
		["Aborted"] call zen_common_fnc_showMessage;
		playSound "FD_Start_F";
	}, _swarmerloc] call zen_dialog_fnc_create;

