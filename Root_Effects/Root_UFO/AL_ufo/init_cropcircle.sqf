// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

/*

=============>>> CROP CIRCLES <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

[object_name,radius,typeOFcropCircle] execvm "\Root_Effects\Root_UFO\AL_ufo\crop_circle.sqf";

object_name		- string, name of object you use to designate the location of the crop circle
radius			- number, radius in meters of the circle you want to generate, when it comes to spiral is the starting radius of it which will start growing which each iteration
typeOFcropCircle	- string, one of the values: "circle", "spiral", "flower"

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
_objectloc = getPosATL _logic;
deleteVehicle _logic;

["UFO Cropcircle Settings",[
	["SLIDER:RADIUS",["Cropcircle Radius","Radius in meters of the Cropcircle."],[20,1000,50,0,_radiuspos,[7,120,32,1]]],
	["COMBO",["Cropcircle Design","Design of the Cropcircle."],[["circle", "spiral", "flower"],["Circle", "Spiral", "Flower"], 0]]
	],{
		params ["_results", "_objectloc"];
		_results params ["_radius","_type"];
		
		_object = "Land_HelipadEmpty_F" createVehicle _objectloc;

		["UFO Cropcircle Configured and Created!"] call zen_common_fnc_showMessage;

		[[_object, _radius, _type],"\Root_Effects\Root_UFO\AL_ufo\ufo_crop_circle.sqf"] remoteExec ["BIS_fnc_execVM", 0];
	},{
		["Aborted"] call zen_common_fnc_showMessage;
		playSound "FD_Start_F";
	}, _objectloc] call zen_dialog_fnc_create;

