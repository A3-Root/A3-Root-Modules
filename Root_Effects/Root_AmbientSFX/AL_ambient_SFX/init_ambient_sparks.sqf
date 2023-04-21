// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

/*
[object_name] execvm "AL_ambient_SFX\sparky.sqf";
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

_sparksloc = getPosATL _logic;
deleteVehicle _logic;

["Ambient Sparks Setting", [
	["EDIT", ["Sparks Object", "Classname of the object used as a source for the SFX."], ["Land_HelipadEmpty_F"]], 
	["SLIDER", ["Sparks Altitude", "Altitude in meters where you want the Sparks Rupture. (Minimum Altitude is 1m)"], [0, 100, 0, 0]],
	["SLIDER",["Sparks Delay","Seconds between each spark."],[1,100,10,0]]
	], {
		params ["_results", "_sparksloc"];
		_results params ["_sparksobj", "_sparksalt", "_sparksdelay"];
		
		_sparks = _sparksobj createVehicle _sparksloc;

		["Sparks Active!"] call zen_common_fnc_showMessage;

		[[_sparks, _sparksalt, _sparksdelay], "\Root_Effects\Root_AmbientSFX\AL_ambient_SFX\sparky.sqf"] remoteExec ["BIS_fnc_execVM", 0];
	}, {
		["Aborted"] call zen_common_fnc_showMessage;
		playSound "FD_Start_F";
	}, _sparksloc] call zen_dialog_fnc_create;


