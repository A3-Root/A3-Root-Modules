// ORIGINALL CREATED BY ALIAS
// MODIFIED BY ROOT
// Tutorial: https://www.youtube.com/user/aliascartoons

/*
Falling stars	
	[_cometFrequency] execvm "\Root_Effects\Root_Fallstar\ALfallstar\alias_fallingstar_ini.sqf"; - at every X seconds a falling star will be generated
	
Meteors
	[_meterFrequency] execvm "\Root_Effects\Root_Fallstar\ALfallstar\alias_meteor_ini.sqf"; - at every X seconds a meteor will be generated
*/

// Only run on player machines
if (!hasinterface) exitwith {};

// If ZEN is not loaded, do not start script
if !(isClass (configFile >> "CfgPatches" >> "zen_custom_modules")) exitwith
{
    diag_log "******CBA and/or ZEN not detected. They are required for this mod.";
};

params ["_logic"];

private _radiuspos = getPosATL _logic;

deleteVehicle _logic;

["Meteors and Comet Settings",[
	["TOOLBOX:YESNO",["Spawn Meteor","If true, a meteor will spawn and crash around the area near a random player."],false],
	["TOOLBOX:YESNO",["Spawn Comet","If true, a comet can be seen in the sky going in some random direction."],false],
	["SLIDER",["Meteor Frequency","Frequency in seconds of how often the phenomena takes place."],[10,600,30,0]],
	["SLIDER",["Comet Frequency","Frequency in seconds of how often the phenomena takes place."],[10,600,30,0]]
	],{
		params ["_results"];
		_results params ["_isMeteor", "_isComet", "_meteorFrequency", "_cometFrequency"];

		if (_isMeteor == true) then { [[_meteorFrequency],"\Root_Effects\Root_Fallstar\ALfallstar\fallstar_meteor_ini.sqf"] remoteExec ["BIS_fnc_execVM", 0]; };
		if (_isComet == true) then { [[_cometFrequency],"\Root_Effects\Root_Fallstar\ALfallstar\fallstar_fallingstar_ini.sqf"] remoteExec ["BIS_fnc_execVM", 0]; };

		["Meteors and Comets Configured and Created!"] call zen_common_fnc_showMessage;	

	},{
		["Aborted"] call zen_common_fnc_showMessage;
		playSound "FD_Start_F";
	}] call zen_dialog_fnc_create;
