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

_ground_loc = getPosATL _logic;
deleteVehicle _logic;

["Ground Barrage Settings",[
	["SLIDER:RADIUS",["Artillery Radius","Radius in meters for the Ground Barrage Area of Effect."],[100,5000,500,0,_ground_loc,[7,120,32,1]]],
	["TOOLBOX:YESNO",["Sound Only","If true, only explosion sounds would be generated."],false],
	// ["TOOLBOX:YESNO",["Non-Lethal Artillery","If true, the barrage will be non-lethal and cause no damage to units within its range."],false],
	["LIST", ["Explosion Type", "Choose the type of explosion created."], [["G_40mm_HE", "M_Mo_82mm_AT_LG", "Sh_120mm_APFSDS", "Sh_120mm_HE", "Sh_155mm_AMOS", "HelicopterExploSmall", "HelicopterExploBig", "Bo_GBU12_LGB", "Bo_GBU12_LGB_MI10"], ["40mm High Explosive", "82mm High Explosive", "120mm Armor Piercing Fin Stabilized Discarding Sabot Tank Shell", "120mm High Explosive Shell", "155mm High Explosive Shell", "Small Helicopter Explosion", "Large Helicopter Explosion", "500lb GBU-12 (Type I)", "500lb GBU-12 (Type II)"], 0, 10]],
	["SLIDER:PERCENT", ["Barrage Damage", "Percentage amount of damage the barrage deals."], [0.01, 1, 0.2, 2]],
	["SLIDER",["Fire Delay","Seconds delay at which the barrage fires. Multiplied twice (1 seconds delay = 2 seconds in game). Lower values results in faster rate of fire."],[1,20,1,1]]
	],{
		params ["_results", "_ground_loc"];
		_results params ["_ground_radius", "_sound_only", "_ground_type", "_ground_damage", "_ground_speed"];
		
		_ground_start = "Land_HelipadEmpty_F" createVehicle _ground_loc;

		["Artillery Barrage Initiated!"] call zen_common_fnc_showMessage;

		[[_ground_start, _ground_radius, _ground_damage, _ground_speed, _ground_type, _sound_only],"\Root_Effects\Root_Battlescripts\ALambientbattle\battle_artillery.sqf"] remoteExec ["BIS_fnc_execVM", 0];
	},{
		["Aborted"] call zen_common_fnc_showMessage;
		playSound "FD_Start_F";
	}, _ground_loc] call zen_dialog_fnc_create;


