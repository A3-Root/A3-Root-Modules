// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 


/*
[object_name] execvm "AL_ambient_SFX\rupture.sqf";
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

_ruptureloc = getPosATL _logic;
deleteVehicle _logic;

["Ambient Rupture Setting", [
	["EDIT", ["Rupture Object", "Classname of the object used as a source for the SFX."], ["Land_HelipadEmpty_F"]], 
	["SLIDER", ["Rupture Altitude", "Altitude in meters where you want the Spacetime Rupture."], [1, 4000, 500, 0]],
	["SLIDER", ["Rupture Spawn Speed", "Time taken between each 'light' for the rupture to spawn in."], [0.1, 20, 0.1, 1]]
	], {
		params ["_results", "_ruptureloc"];
		_results params ["_ruptureobj", "_rupturealt", "_rupturespeed"];

		_rupture = _ruptureobj createVehicle _ruptureloc;

		["Rupture Active!"] call zen_common_fnc_showMessage;

		[[_rupture, _rupturealt, _rupturespeed], "\Root_Effects\Root_AmbientSFX\AL_ambient_SFX\rupture.sqf"] remoteExec ["BIS_fnc_execVM", 0];
	}, {
		["Aborted"] call zen_common_fnc_showMessage;
		playSound "FD_Start_F";
	}, _ruptureloc] call zen_dialog_fnc_create;


