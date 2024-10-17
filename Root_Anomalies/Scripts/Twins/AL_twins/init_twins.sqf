// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

/*
null=[object_anomaly,tracking_distance,electric_sparks,damage_range,effect_on_AI,EMP_enabled] execvm "AL_twins\twins.sqf"

object_anomaly 		- string, object name you want to work as anomaly, use this as value if you run the script from the init field of the object
tracking_distance	- number, maximum distance between within which a player must be in order to be chased by anomaly
electric_sparks		- boolean, true if you want to enable the sparks, false if otherwise
damage_range		- number, minimum distance from anomaly a player must be to take damage
effect_on_AI		- boolean, true if you want AI to take damage when is in proximity of the anomaly
EMP_enabled			- boolean, if is true an EMP will be emitted when Twins is killed

*/

// Only run on player machines
if (!hasinterface) exitwith {};

// If ZEN is not loaded, do not start script
if !(isClass (configFile >> "CfgPatches" >> "zen_custom_modules")) exitwith
{
    diag_log "******CBA and/or ZEN not detected. They are required for this mod.";
};

params ["_logic"];

private _trackpos = getPosATL _logic;
private _killpos = getPosATL _logic;
private _objpos = getPosATL _logic;
deleteVehicle _logic;

["Twins Anomaly Settings", [
	["EDIT", ["Twins Object", "Classname of the object used as the Twins."], ["Land_HighVoltageTower_large_F"]],
	["EDIT", ["Twins Heart", "Classname of the object used as the 'Heart' of the Twins Anomaly to kill it."], ["B_UAV_06_F"]],
	["SLIDER:RADIUS", ["Tracking Distance", "Radius in meters of the Twin's territory to track and chase entites."], [15, 1200, 100, 0, _trackpos, [7, 120, 32, 1]]],
	["TOOLBOX:YESNO", ["Enable Electric Sparks", "If true, the Twins will emit electric sparks randomly."], true],
	["SLIDER:RADIUS", ["Damage Range", "Radius in meters of the Twin's territory for it to damage and disorient entities."], [10, 1000, 75, 0, _killpos, [7, 120, 32, 1]]],
	["TOOLBOX:YESNO", ["Enable Effects on AI", "If true, all properties will be applicable to AI entities too."], true],
	["TOOLBOX:YESNO", ["Enable EMP", "If true, the Twins will emit an 'EMP' when killed."], true],
	["TOOLBOX:YESNO", ["Disable Sensitive Lights", "If true, Strigoi's 'seizure' like ability will be disabled preventing bright lights from flashing. Highly recommended for people with sensitivity to lights."], false]
	], {
		params ["_results", "_objpos"];
		_results params ["_anomaly_obj", "_heart_obj", "_tracking_dist", "_issparks", "_damage_range", "_isai", "_isemp", "_isseizure"];
		private ["_heart_obj", "_twins_obj"];

		if !(getNumber (configFile >> "CfgVehicles" >> _heart_obj >> "scope") > 0) then 
		{
			_heart_obj = "B_UAV_06_F";
		};

		if !(getNumber (configFile >> "CfgVehicles" >> _twins_obj >> "scope") > 0) then 
		{
			_twins_obj = "Land_HighVoltageTower_large_F";
		};

		if (_tracking_dist < _damage_range) then
		{
			_tracking_dist = _damage_range + 20;
		};

		["Twins Anomaly Configured and Created!"] call zen_common_fnc_showMessage;
		
		_twins_obj = _anomaly_obj createVehicle _objpos;

		[[_twins_obj, _tracking_dist, _issparks, _damage_range, _isai, _isemp, _heart_obj, _isseizure], "\Root_Anomalies\Root_Twins\AL_twins\twins_main.sqf"] remoteExec ["BIS_fnc_execVM", 0];
	}, {
		["Aborted"] call zen_common_fnc_showMessage;
		playSound "FD_Start_F";
	}, _objpos] call zen_dialog_fnc_create;