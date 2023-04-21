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

_aaa_loc = getPosATL _logic;
deleteVehicle _logic;

["AAA Barrage Settings",[
	["EDIT",["AAA Barrage Object","Classname of the object used as the flaks for AAA Barrage."],["Land_HelipadEmpty_F"]],
	["SLIDER:RADIUS",["AAA Barrage Radius","Radius in meters for the AAA Barrage Area of Effect."],[100,5000,500,0,_aaa_loc,[7,120,32,1]]],
	["SLIDER",["AAA Barrage Altitude","Altitude in meters above terrain for the AAA effect."],[5,1000,150,0]],
	["TOOLBOX:YESNO",["Make Barrage Lethal","If true, the barrage will be lethal and cause damage to entities near it."],true],
	["SLIDER:PERCENT", ["Damage to Aircrafts", "Percentage amount of damage the AAA deals to aircrafts."], [0.01, 1, 0.05, 2]],
	["SLIDER:PERCENT", ["Damage to Infantry", "Percentage amount of damage the AAA deals to infantry passing through or paradropping."], [0.01, 1, 0.2, 2]],
	["SLIDER",["Fire Spread","Speed and Spread at which the barrage fires. Lower values results in faster rate of fire at shorter spread per burst."],[0.5,10,1,1]]
	],{
		params ["_results", "_aaa_loc"];
		_results params ["_aaa_object", "_aaa_radius", "_aaa_height", "_islethal", "_aaa_dmg_vic", "_aaa_dmg_inf", "_aaa_speed"];

		_aaa_start = _aaa_object createVehicle _aaa_loc;

		["AAA Barrage Initiated!"] call zen_common_fnc_showMessage;

		[[_aaa_start, _aaa_radius, _aaa_height, _aaa_dmg_vic, _islethal, _aaa_speed, _aaa_dmg_inf], "\Root_Effects\Root_Battlescripts\ALambientbattle\battle_flaks.sqf"] remoteExec ["BIS_fnc_execVM", 0];
	},{
		["Aborted"] call zen_common_fnc_showMessage;
		playSound "FD_Start_F";
	}, _aaa_loc] call zen_dialog_fnc_create;


