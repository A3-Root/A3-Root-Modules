// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT

/*
null = [marker_name]execvm "AL_screamer\screamer.sqf"

marker_name	- string, name of the marker where you want to place the anomaly
*/


// Only run on player machines
if (!hasinterface) exitwith {};

// If ZEN is not loaded, do not start script
if !(isClass (configFile >> "CfgPatches" >> "zen_custom_modules")) exitwith
{
    diag_log "******CBA and/or ZEN not detected. They are required for this mod.";
};

params ["_logic"];

if (isNil "SCREAMER_markerIndex") then { SCREAMER_markerIndex = 0 };
_screamermarkerName = format ["SCREAMER_%1", SCREAMER_markerIndex];
SCREAMER_markerIndex = SCREAMER_markerIndex + 1;
_screamermarker = createMarker [_screamermarkerName, _logic];

private _radiuspos = getPosATL _logic;

deleteVehicle _logic;

["Screamer Anomaly Settings", [
	["SIDES", ["Screamer Side", "Specifies the side the Screamer will spawn as. If multiple selected, only the first side is chosen as spawn. Defaults to CIVILIAN. Only required when 'AI Engage' is active."], []],
	["SIDES", ["Screamer Targets", "Specifies the side(s) the Screamer will consider hostile. If none are selected, it will attack everyone and everything."], []],
	["EDIT", ["Screamer Model", "Classname of the object used as the Anomaly."], ["Land_AncientStatue_01_F"]],
	["SLIDER", ["Screamer Health", "Percentage amount of health the Screamer has."], [10, 5000, 400, 0]],
	["SLIDER:RADIUS", ["Screamer Territory", "Radius in meters of the Screamer's territory."], [20, 500, 100, 0, _radiuspos, [7, 120, 32, 1]]], 
	["SLIDER:RADIUS", ["Screamer Effect Radius", "Radius in meters of the Screamer's attack."], [10, 490, 50, 0, _radiuspos, [7, 120, 32, 1]]], 
	["TOOLBOX:YESNO", ["Affect Vehicles", "If true, the Screamer will also affect vehicles in its scream path."], true],
	["TOOLBOX:YESNO", ["AI Engage [EXPERIMENTAL]", "If true, the Screamer will be engaged by AI. [NOTE - If the Screamer Model is a static model, a bright visible VR soldier would additionally be created for this purpose.]"], false],
	["TOOLBOX:YESNO", ["AI Panic", "If true, the AI will forcefully run away from Screamer location during its attack."], false],
	["SLIDER:PERCENT", ["Screamer Damage (Close)", "Percentage amount of damage the Screamer does to hostiles at close range."], [0.01, 1, 0.4, 2]],
	["SLIDER:PERCENT", ["Screamer Damage (Medium)", "Percentage amount of damage the Screamer does to hostiles at mid range."], [0.01, 1, 0.2, 2]],
	["SLIDER:PERCENT", ["Screamer Damage (Far)", "Percentage amount of damage the Screamer does to hostiles at far ranges."], [0.01, 1, 0.1, 2]]
	], {
		params ["_results", "_screamermarkerName"];
		_results params ["_screamer_spawn_side", "_screamer_hostiles", "_screamer_model", "_screamer_health", "_screamer_territory", "_screamer_atk_radius", "_isvicdmg", "_isaidmg", "_isaipanic", "_screamer_damage_close", "_screamer_damage_medium", "_screamer_damage_far"];

		if (_screamer_hostiles isEqualTo []) then {
            _screamer_hostiles = ["WEST", "EAST", "RESISTANCE", "CIVILIAN"];
        };

		if (_isaidmg == true) then {
			if (_screamer_spawn_side isEqualTo []) then {
            	_screamer_spawn_side = EAST;
			} else {
				_screamer_spawn_side = _screamer_spawn_side select 0;
			};
		} else {
			_screamer_spawn_side = EAST;
		};
		
		if (_screamer_atk_radius > (_screamer_territory / 2)) then {
            _screamer_atk_radius = (_screamer_territory / 2);
        };

		if (_screamer_territory < (_screamer_atk_radius * 2)) then {
            _screamer_territory = (_screamer_atk_radius * 2);
        };
		
        ["Screamer Anomaly configured and active!"] call zen_common_fnc_showMessage;

		[[_screamermarkerName, _screamer_model, _screamer_damage_close, _screamer_damage_medium, _screamer_damage_far, _screamer_territory, _screamer_hostiles, _screamer_atk_radius, _isvicdmg, _isaidmg, _isaipanic, _screamer_spawn_side, _screamer_health], "\Root_Anomalies\Root_Screamer\AL_screamer\screamer_main.sqf"] remoteExec ["BIS_fnc_execVM", 0];
	}, {
		["Aborted"] call zen_common_fnc_showMessage;
		playSound "FD_Start_F";
	}, _screamermarkerName] call zen_dialog_fnc_create;