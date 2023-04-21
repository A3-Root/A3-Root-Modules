// CREATED BY ROOT
// HEAVILY RELIES ON CODE BY JOHNB43 => https://steamcommunity.com/id/johnb43


// Only run on player machines
if (!hasinterface) exitwith {};

// If ZEN is not loaded, do not start script
if !(isClass (configFile >> "CfgPatches" >> "zen_custom_modules")) exitwith
{
    diag_log "******CBA and/or ZEN not detected. They are required for this mod.";
};

params ["_logic"];

private _logicpos = getPosATL _logic;

deleteVehicle _logic;

["Freeze Settings (Read tooltips!)", [
	["TOOLBOX:YESNO",["Toggle Freeze","If true, selected units will be frozen. If false, they will be unfrozen if previously frozen."],false],
	["TOOLBOX:YESNO",["Toggle Animation","If true, selected units will be frozen by playing the animation below. Required to be set to 'False' to 'Unfreeze' frozen units with animation."],false],
	["EDIT", ["Freeze Animation", "Stringname of the looping animation to play."], ["HubSpectator_stand"]],
	["OWNERS", ["Select Units", "Select the Side(s) / Group(s) / Unit(s) you want frozen."], [[], [], [], 0], true]
	], {
		params ["_results"];
		_results params ["_isfreeze", "_useanim", "_animtype", "_selected"];
		_selected params ["_sides", "_groups", "_players"];
		private _tempvar = false;
		private _unitList = [];

		if (!_tempvar && {_sides isEqualTo []} && {_groups isEqualTo []} && {_players isEqualTo []}) exitWith {
            ["ERROR - Select a side/group/unit"] call zen_common_fnc_showMessage;
        };

		{
            if (typeOf _x != "VirtualCurator_F") then {
				_unitList pushBack _x;
            };
        } forEach ((call CBA_fnc_players) select {(side _x) in _sides || {(group _x) in _groups} || {_x in _players}});

		[[_unitList, _isfreeze, _useanim, _animtype], "\Root_Effects\Root_Freeze\RT_freeze\freeze_main.sqf"] remoteExec ["BIS_fnc_execVM", 0];
	}, {
		["Aborted"] call zen_common_fnc_showMessage;
		playSound "FD_Start_F";
	}] call zen_dialog_fnc_create;