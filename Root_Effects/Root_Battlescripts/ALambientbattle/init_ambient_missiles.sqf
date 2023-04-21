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

_missile_loc = getPosATL _logic;
deleteVehicle _logic;

["Missile Launcher Settings",[
	["EDIT",["Missile Launcher Object","Classname of the object used as the launch generator for Missile launches."],["Land_HelipadEmpty_F"]],
	["SLIDER:RADIUS",["Minimum Safe Distance","Radius is meters for players to be AWAY to lauch Missiles."],[1,1000,25,0,_radiuspos,[7,120,32,1]]],
	["SLIDER",["Launch Delay","Seconds between each Launch."],[1,100,10,0]]
	],{
		params ["_results", "_missile_loc"];
		_results params ["_missile_object", "_missle_distance", "_launch_delay"];
		
		_missile_start = _missile_object createVehicle _missile_loc;

		["Missile Launcher Initiated!"] call zen_common_fnc_showMessage;

		[[_missile_start, _missle_distance, _launch_delay],"\Root_Effects\Root_Battlescripts\ALambientbattle\battle_missiles.sqf"] remoteExec ["BIS_fnc_execVM", 0];
	},{
		["Aborted"] call zen_common_fnc_showMessage;
		playSound "FD_Start_F";
	}, _missile_loc] call zen_dialog_fnc_create;


