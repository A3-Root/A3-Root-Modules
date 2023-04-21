// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

// Only run on player machines
if (!hasinterface) exitwith {};

// If ZEN is not loaded, do not start script
if !(isClass (configFile >> "CfgPatches" >> "zen_custom_modules")) exitwith
{
    diag_log "******CBA and/or ZEN not detected. They are required for this mod.";
};

params ["_logic"];

_tracers_loc = getPosATL _logic;
_radiuspos = getPosATL _logic;
deleteVehicle _logic;

["Tracer Settings",[
	["EDIT",["Tracer Object","Classname of the object used as the weapon generator for Tracers."],["Land_HelipadEmpty_F"]],
	["SLIDER:RADIUS",["Activation Distance","Radius is meters for players to be away to generate tracers."],[1,1000,150,0,_radiuspos,[7,120,32,1]]],
	["COLOR",["Tracer Color","Color of the Tracers."],[1,1,1]]
	
	],{
		params ["_results", "_tracers_loc"];
		_results params ["_tracers_object", "_activation_distance", "_tracer_color"];
		
		_tracers_start = _tracers_object createVehicle _tracers_loc;
		_colorred = _tracer_color select 0;
		_colorgreen = _tracer_color select 1;
		_colorblue = _tracer_color select 2;



		["Tracers Initiated!"] call zen_common_fnc_showMessage;

		[[_tracers_start, _colorred, _colorgreen, _colorblue, _activation_distance],"\Root_Effects\Root_Battlescripts\ALambientbattle\battle_tracers.sqf"] remoteExec ["BIS_fnc_execVM", 0];
	},{
		["Aborted"] call zen_common_fnc_showMessage;
		playSound "FD_Start_F";
	}, _tracers_loc] call zen_dialog_fnc_create;


