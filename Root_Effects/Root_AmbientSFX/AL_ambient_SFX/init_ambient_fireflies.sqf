// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 


/*
[object_name] execvm "\Root_Effects\Root_AmbientSFX\AL_ambient_SFX\firefly.sqf";
object_name - string, the name of the object you use as a source for the SFX
*/

// Only run on player machines
if (!hasinterface) exitwith {};

// If ZEN is not loaded, do not start script
if !(isClass (configFile >> "CfgPatches" >> "zen_custom_modules")) exitwith
{
    diag_log "******CBA and/or ZEN not detected. They are required for this mod.";
};

params ["_logic"];

_firefliesloc = getPosATL _logic;
deleteVehicle _logic;

["Ambient Firefly Setting", [
	["EDIT", ["Firefly Object", "Classname of the object used as a source for the SFX."], ["Land_HelipadEmpty_F"]], 
	["SLIDER", ["Fireflies Altitude", "Altitude in meters where you want the Fireflies."], [1, 100, 1, 0]],
	["SLIDER", ["Fireflies Distance", "Distance in meters players have to be to view/trigger the Fireflies."], [10, 500, 10, 0]]
	], {
		params ["_results", "_firefliesloc"];
		_results params ["_firefliesobj", "_firefliesalt", "_fireflydist"];
		
		_fireflies = _firefliesobj createVehicle _firefliesloc;

		["Fireflies Active!"] call zen_common_fnc_showMessage;

		[[_fireflies, _firefliesalt, _fireflydist], "\Root_Effects\Root_AmbientSFX\AL_ambient_SFX\firefly.sqf"] remoteExec ["BIS_fnc_execVM", 0];
	}, {
		["Aborted"] call zen_common_fnc_showMessage;
		playSound "FD_Start_F";
	}, _firefliesloc] call zen_dialog_fnc_create;


