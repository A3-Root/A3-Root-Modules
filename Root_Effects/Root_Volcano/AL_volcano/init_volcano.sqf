// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT


/*
nul = [object_name, crater_radius, delay_eruptions,enable_crater_lava,enable_lightning,enable_lava_flow,lethal,protective_gear] execVM "\Root_Effects\Root_Volcano\ALvolcano\alias_volcano.sqf";

object_name			- string, object name used as generator for volcano, or use this if you run the script from objects init field
crater_radius			- meters, diameter for crater so you can adapt it to the choosen hil, recommended ar least 50 meters or more
delay_eruptions		- number, delay in seconds between eruptions,if the delay is smaller than 0 erruptions will be disabled
enable_crater_lava	- boolean, if true SFX for caldera will be generated
enable_lightning		- boolean, if true lightning bolts will randomly show up in the smoke cloud
enable_lava_flow		- boolean, WIP
lethal				- boolean, if true units too close to crater with no protection will die, also units inside the crater will be killed
protective_gear		- array containing the class name if the items you wanna be used as protective gear near crater
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

// Not using curatorCanAttach because that alters the height of the module
// private _object = attachedTo _logic;
// curatorMouseOver params ["_type", "_entity"];
// private _objectloc = if (_type == "OBJECT") then {_entity} else {objNull};

_objectloc = getPosATL _logic;

// if (_objectloc == objNull) exitWith { ["Place Module on an object!"] call zen_common_fnc_showMessage; };

deleteVehicle _logic;

["Object Settings",[
	["SLIDER:RADIUS",["Crater Radius","DIAMETER for the Volcano crater in meters."],[50,500,50,0,_radiuspos,[7,120,32,1]]],
	["TOOLBOX:YESNO",["Enable Eruption","If true, the Volcano will erupt every X seconds configured below."],false],
	["SLIDER",["Eruption Delay","Delay in seconds between Volcano Eruptions."],[120,600,600,0]],
	["TOOLBOX:YESNO",["Enable Crater Lava","If true, SFX for caldera will be generated."],false],
	["TOOLBOX:YESNO",["Enable Lightning","If true, lightning bolts will be randomly generated in the smoke cloud."],false],
	["TOOLBOX:YESNO",["Enable Lava Flow","If true, Lava Flow will be generated. CAUTION: WIP/BROKEN - CAN CAUSE ISSUES."],false],
	["TOOLBOX:YESNO",["Enable Lethality","If true, units inside/too close to the crater without the Protection Gear configured below will be killed."],true],
	["EDIT:MULTI",["Protective Gear","Comma (,) seperated classnames (without spaces) of the items considered as 'Protective Gear' near crater."],["B_Kitbag_mcamo",{},4]]
	],{
		params ["_results", "_objectloc"];
		_results params ["_radius", "_enableEruption", "_eruptionDelay", "_enableCraterLava", "_enableLightning", "_enableLavaFlow", "_enableLethality", "_protectiveGear"];

		if (_enableEruption != true) then {
			_eruptionDelay = 0;
		};
		if (_enableLethality != true) then {
			_protectiveGear = [];
		};

		_object = "Land_HelipadEmpty_F" createVehicle _objectloc;

		["Volcano configured and active!"] call zen_common_fnc_showMessage;

		[[_object, _radius, _eruptionDelay, _enableCraterLava, _enableLightning, _enableLavaFlow, _enableLethality, _protectiveGear],"\Root_Effects\Root_Volcano\AL_volcano\volcano_main.sqf"] remoteExec ["BIS_fnc_execVM", 0];
	},{
		["Aborted"] call zen_common_fnc_showMessage;
		playSound "FD_Start_F";
	}, _objectloc] call zen_dialog_fnc_create;

