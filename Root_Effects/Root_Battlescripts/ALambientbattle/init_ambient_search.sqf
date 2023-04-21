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

_search_loc = getPosATL _logic;
deleteVehicle _logic;

["Search Light Settings",[
	["EDIT",["Search Light Object","Classname of the object used as the launch generator for Missile launches."],["Land_HelipadEmpty_F"]],
	["TOOLBOX:YESNO",["Enable Alarm [READ TOOLTIP]","If true, an alarm will trigger. HIGHLY RECOMMENDED TO USE ONLY ONCE."],false]
	],{
		params ["_results", "_search_loc"];
		_results params ["_search_object", "_search_sound"];
		
		_search_start = _search_object createVehicle _search_loc;

		["Search Light Initiated!"] call zen_common_fnc_showMessage;

		[[_search_start, _search_sound],"\Root_Effects\Root_Battlescripts\ALambientbattle\battle_search_light.sqf"] remoteExec ["BIS_fnc_execVM", 0];
	},{
		["Aborted"] call zen_common_fnc_showMessage;
		playSound "FD_Start_F";
	}, _search_loc] call zen_dialog_fnc_create;


