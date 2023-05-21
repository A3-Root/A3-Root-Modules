// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT

/*
null = [marker,mobile_anomaly,device_detector,damage_protect,ROOT_var_antiBurperDevice_device] execVM "AL_burpy\alias_burper.sqf";

marker				- string, name fo the marker where you want to place the anomaly
mobile_anomaly		- boolean, if true the anomaly will change location over time, otherwise they stay in the same location where they were initially placed
device_detector		- string, classname of the object you want to act as a anomaly detector
damage_protect		- string, classname of the object you want to function as protective gear so a unit will be un-harmed by anomaly when in proximity
						* if empty no protection will be provided
ROOT_var_antiBurperDevice_device	- string, class name of the object which will act as a Burper neutralizer, if this item/vehicle is in 10 m range from Burper it will make Burper disappear
*/

// Only run on player machines
if (!hasinterface) exitwith {};

// If ZEN is not loaded, do not start script
if !(isClass (configFile >> "CfgPatches" >> "zen_custom_modules")) exitwith
{
    diag_log "******CBA and/or ZEN not detected. They are required for this mod.";
};

params ["_logic"];

if (isNil "BURPER_markerIndex") then { BURPER_markerIndex = 0 };

_burperMarkerName = format ["BURPER_%1", BURPER_markerIndex];
BURPER_markerIndex = BURPER_markerIndex + 1;
_burpermarker = createMarker [_burperMarkerName, _logic];

private _radiuspos = getPosATL _logic;
private _devicepos = getPosATL _logic;

deleteVehicle _logic;


["Burper Anomaly Settings", [
	["SLIDER:RADIUS", ["Burper Territory", "Radius in meters of the Burper's effective range for destruction."], [5, 2000, 10, 0, _radiuspos, [7, 120, 32, 1]]],
	["TOOLBOX:YESNO", ["Enable Vehicle Damage", "If true, all land vehicles wil also be affected by the Burper."], true],
	["TOOLBOX:YESNO", ["Enable Roaming Burper", "If true, the Burper to teleport to random position over time."], false],
	["TOOLBOX:YESNO", ["Enable Detection Device", "If true, the Burper will be invisible and can only be detected with a detection device configured below."], true],
	["TOOLBOX:YESNO", ["Enable Burper Protection", "If true, the Burper will not attack anyone wearing the protection device configured below."], true],
	["TOOLBOX:YESNO", ["Enable Killswitch", "If true, the Burper can and will be destroyed if the configured object is within 10m of its position."], true],
	["TOOLBOX:YESNO", ["Enable AI Panic", "If true, the AI can and will run away to a safe distance from Burper when its visible."], true],
	["SLIDER:RADIUS", ["Killswitch Range", "Radius in meters the Killswitch from Burper to trigger. Ensure its atleast 5m more than Burper Territory if using vehicle."], [10, 4000, 20, 0, _devicepos, [7, 120, 32, 1]]],
	["EDIT", ["Detection Device", "Classname of the Detection Device. Can be the same item as Protection Device."], ["MineDetector"]],
	["EDIT", ["Protection Device", "Classname of the Protection Device. Can be the same item as Detection Device."], ["B_Kitbag_mcamo"]],
	["EDIT", ["Killswitch Device", "Classname of the Killswitch Device. (Default: CSAT Typhoon Device)"], ["O_Truck_03_device_F"]]
	], {
		params ["_results", "_burperMarkerName"];
		_results params ["_burper_territory", "_isvehicle", "_isroaming", "_isdetectable", "_isprotectable", "_iskillable", "_isaipanic", "_killswitch_range", "_detectdevice", "_protectdevice", "_killdevice"];

		if !(_isdetectable) then {_detectdevice = ""};
		if !(_isprotectable) then {_protectdevice = ""};
		if !(_iskillable) then {_killdevice = "NO-KILL-DEVICE-CONFIGURED"; _killswitch_range = 1};
		if (_killswitch_range < _burper_territory) then {
			if (_killdevice isKindOf "LandVehicle") then {
				if ((_killswitch_range + _burper_territory) > (2 * _burper_territory)) then { _killswitch_range = 1.5 * _burper_territory; };
			} else {
				_killswitch_range = _killswitch_range + 5;
			};
		};

		["Burper Anomaly Configured and Created!"] call zen_common_fnc_showMessage;
		
		_object_anom_burp = "Land_HelipadEmpty_F" createVehicle [getmarkerPos _burperMarkerName select 0,getmarkerPos _burperMarkerName select 1,2];
		ROOT_var_burperObjects pushBack [_object_anom_burp];
		publicVariable "ROOT_var_burperObjects";

		_balta_sang = createVehicle ["BloodSplatter_01_Medium_New_F",[getmarkerPos _burperMarkerName select 0,getmarkerPos _burperMarkerName select 1,0], [], random 8, "CAN_COLLIDE"];
		_balta_sang setdir (random 360);

		[_object_anom_burp, _isroaming, _detectdevice, _protectdevice, _killdevice, _burper_territory, _isvehicle, _killswitch_range, _isaipanic] remoteExec ["ROOT_fnc_burperMain",0];
	}, {
		["Aborted"] call zen_common_fnc_showMessage;
		playSound "FD_Start_F";
	}, _burperMarkerName
] call zen_dialog_fnc_create;