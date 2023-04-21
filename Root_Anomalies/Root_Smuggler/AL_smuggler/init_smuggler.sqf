// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 
/* 
null = [marker, mobile_anomaly, device_detector, spawn_classname, delay_between_spawn, teleport_protect] execVM "\Root_Anomalies\Root_Smuggler\AL_smuggler\smuggler_main.sqf";


marker			- string, name for the marker where you want to place the anomaly
mobile_anomaly	- boolean, if true the anomaly will change randomly its location over time, otherwise they stay in the same location where they were initially placed
device_detector	- classname of the object you want to act as a anomaly detector, the anomaly will be visible only when you or AI have/has the defined item in inventory
					** if is empty this feature will be disabled and all units will be aware of it and the anomaly will be visible all the time
spawn_classname	- array with the object classnames of the objects you want the anomaly to spawn randomly over time, 
					if is empty this feature will be ignored
delay_between_spawns - number, is the delay between spawns in seconds, based on this value a random interval will be generated, the minimum value is set to 30 seconds
teleport_protect- classname of the object you want to function as protection to teleportation, unit having this item will not be teleported when is in range
					* if empty no protection will be provided and the units will be teleported every time when in range
*/

// if (getNumber (configFile >> "CfgVehicles" >> _anomaly_vic >> "scope") > 0) then 

// Only run on player machines
if (!hasinterface) exitwith {};

// If ZEN is not loaded, do not start script
if !(isClass (configFile >> "CfgPatches" >> "zen_custom_modules")) exitwith
{
    diag_log "******CBA and/or ZEN not detected. They are required for this mod.";
};

params ["_logic"];

if (isNil "SMUGGLER_markerIndex") then { SMUGGLER_markerIndex = 0 };

_smugglerMarkerName = format ["SMUGGLER_%1", SMUGGLER_markerIndex];
SMUGGLER_markerIndex = SMUGGLER_markerIndex + 1;
_smugglermarker = createMarker [_smugglerMarkerName, _logic];
deleteVehicle _logic;

["Smuggler Anomaly Settings", [
	["TOOLBOX:YESNO", ["Enable Roaming Smuggler", "If true, the Smuggler to teleport to random position every 30 seconds around the marker area."], false],
	["TOOLBOX:YESNO", ["Enable Detection Device", "If true, the Smuggler will be invisible and can only be detected with a detection device configured below."], true],
	["TOOLBOX:YESNO", ["Enable Teleport Protection", "If true, the Smuggler will not attack and teleport anyone wearing the protection device configured below."], true],
	["TOOLBOX:YESNO", ["Disable Object Spawning", "If true, the Smuggler will disable spawning in random objects and entites including custom AI/Vehicles/Things configured below in random."], false],
	["EDIT", ["Detection Device", "Class Names of the Detection Device. Can be the same item as Protection Device."], ["MineDetector"]],
	["EDIT", ["Protection Device", "Class Names of the Protection Device. Can be the same item as Detection Device."], ["B_Kitbag_mcamo"]],
	["EDIT:MULTI", ["Spawn Objects Allowed", "Comma (,) seperated classnames (without spaces) of the objects/entities."], ["Land_OfficeCabinet_01_F,Land_ArmChair_01_F,OfficeTable_01_old_F,B_G_Soldier_AR_F,B_GEN_Soldier_F,C_man_1,Weapon_arifle_AKM_F,Weapon_launch_RPG7_F,I_C_Soldier_Bandit_5_F,O_Soldier_GL_F", {}, 4]],
	["SLIDER", ["Spawn Objects Delay", "Addtional delay in seconds between spawning random objects. Minimum delay is set to 10 seconds. For example, if this value is set to 15, actual delay between spawning entites would be 25 seconds. (10 + 15)"], [0, 600, 10, 0]],
	["SLIDER:PERCENT", ["Smuggler Damage", "Percentage amount of damage the Smuggler does per teleportation. '0' means no damage taken when teleported."], [0, 1, 0.1, 2]],
	["TOOLBOX:YESNO", ["Disable Sensitive Lights", "If true, Bright lights will be disabled during teleportation. Highly recommended for people with sensitivity to lights."], false]
	], {
		params ["_results", "_smugglerMarkerName"];
		_results params ["_isroaming", "_isdetectable", "_isprotectable", "_isspawning", "_detectdevice", "_protectdevice", "_spawnobjects", "_spawnobjectsdelay", "_dmg_on_teleport", "_noseizure"];

		if (_isdetectable != true) then {_detectdevice = ""};
		if (_isprotectable != true) then {_protectdevice = ""};
		if (_isspawning == true) then {_spawnobjects = "[]"} else 
		{
			_spawnobjects = _spawnobjects splitString ",";
		};

		["Smuggler Anomaly Configured and Created!"] call zen_common_fnc_showMessage;

		[[_smugglerMarkerName, _isroaming, _detectdevice, _spawnobjects, _spawnobjectsdelay, _protectdevice, _dmg_on_teleport, _noseizure], "\Root_Anomalies\Root_Smuggler\AL_smuggler\smuggler_main.sqf"] remoteExec ["BIS_fnc_execVM", 0];
	}, {
		["Aborted"] call zen_common_fnc_showMessage;
		playSound "FD_Start_F";
	}, _smugglerMarkerName] call zen_dialog_fnc_create;



