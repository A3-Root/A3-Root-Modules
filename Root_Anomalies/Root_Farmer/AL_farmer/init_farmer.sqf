// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT
/*
[marker_namer, territory, damage_inflicted, recharge_delay, health_points] execVM "\Root_Anomalies\Root_Farmer\AL_farmer\init_farmer.sqf";
marker_namer		- string, name of the marker where you want the anomaly to spawn
territory			- number, radius in meters of Farmer's territory
damage_inflicted	- number, amount of damage inflicted by Farmer's shock wave
recharge_time		- number, delay in seconds between Farmer's attacks see line 47 in al_steamer.sqf if you want to customize even more the delay between attacks
health_points		- number, amount of health farmer has
*/

// Only run on player machines
if (!hasinterface) exitwith {};

// If ZEN is not loaded, do not start script
if !(isClass (configFile >> "CfgPatches" >> "zen_custom_modules")) exitwith
{
    diag_log "******CBA and/or ZEN not detected. They are required for this mod.";
};

params ["_logic"];

private _pos = getPosATL _logic;

if (isNil "FARMER_markerindex") then {
    FARMER_markerindex = 0
};

_farmerMarkerName = format ["FARMER_%1", FARMER_markerindex];
FARMER_markerindex = FARMER_markerindex + 1;

_farmerMarker = createMarker [_farmerMarkerName, _pos];

deleteVehicle _logic;

["Farmer Anomaly Settings", [
    ["SLIDER", ["Farmer Health", "Amount of damage the Farmer takes before being killed."], [10, 5000, 400, 0]],
    ["TOOLBOX:YESNO", ["Override Minimum Territory", "If true, the minimum territory radius of the Farmer will be overriden from 75m."], false],
    ["SLIDER:RADIUS", ["Farmer Territory", "Radius in meters of the Farmer's territory."], [10, 1000, 75, 0, _pos, [7, 120, 32, 1]]],
    ["TOOLBOX:YESNO", ["AI Panic", "If true, the AI will forcefully run away from Farmer during its attack."], false],
    ["SLIDER:PERCENT", ["Farmer Damage", "Percentage amount of damage the Farmer does to his target."], [0.01, 1, 0.6, 2]],
    ["SLIDER", ["Farmer Recharge Delay", "Delay in seconds between Farmer's attacks."], [3, 60, 5, 0]]
], {
    params ["_results", "_farmerMarkerName"];
    _results params ["_farmer_hp", "_territory_override", "_farmer_territory", "_isaipanic", "_farmer_damage", "_farmer_recharge"];
    
    if (_territory_override != true) then {
        if (_farmer_territory < 75) then {
            _farmer_territory = 75;
        };
    };

    ["Farmer Anomaly Configured and Created!"] call zen_common_fnc_showMessage;

    [[_farmerMarkerName, _farmer_territory, _farmer_damage, _farmer_recharge, round _farmer_hp, _isaipanic], "\Root_Anomalies\Root_Farmer\AL_farmer\farmer_main.sqf"] remoteExec ["BIS_fnc_execVM", 0];
},{
    ["Aborted"] call zen_common_fnc_showMessage;
    playSound "FD_Start_F";
}, _farmerMarkerName] call zen_dialog_fnc_create;