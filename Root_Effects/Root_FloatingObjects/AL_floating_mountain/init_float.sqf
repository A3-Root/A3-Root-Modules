// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT

/*
null= [object_name, [slide_vel, slide_dist], [bounce_speed, bounce_altitude], [rot_vel, rot_dir], roll_vel, [orbit_radius, obrit_speed, orbit_clock_wise], dist_dependent] execVM "\Root_Effects\Root_FloatingObjects\AL_floating_mountain\obj_float_animate.sqf";

* object_name		- string, name of the object you want to animate, you can use this if you run the script from init field of the object
* slide_vel			- number, distance in meters the object will be moved in each loop
* slide_dist		- number, maximum distance in meters the object will glide during slide animation, slide movement is dependat on objects direction
* bounce_speed		- number, distance in meters the object will be moved in each loop
* bounce_altitude	- number, determines how high and low the object will bounce in meters from initial altitude
* rot_vel			- number, rotation speed in degrees
* rot_dir			- boolean, if true will rotate clockwise, if is false rotation will be countr-clockwise
* roll_vel			- number, rolling speed in radiants 
* orbit_radius		- number, orbit radius in meters around initial position of the object
* obrit_speed		- number, speed in meters
* orbit_clock_wise	- boolean, true for clockwise orbiting and false for counter-clockwise
* dist_dependent	- number, activation distance, minimum distance in meters of players to object in order for object to be animated, if player is out of defined range the animation will be suspended until the player gets in range
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
private _object = attachedTo _logic;
deleteVehicle _logic;

if (isNull _object) exitWith {
    ["Place Module on an object!"] call zen_common_fnc_showMessage;
};

["Object Settings", [
	["TOOLBOX:YESNO", ["Enable Damage", "If true, the object will take damage and can be killed/destroyed."], true],
	["TOOLBOX:YESNO", ["Enable Simulation", "If true, the object will be simulated as normal."], true],
	["SLIDER", ["Elevation", "Adjust the height of the object in meters."], [0, 1000, 5, 0]],
	["TOOLBOX:YESNO", ["Enable Slide", "If true, the object will slide around the area."], false],
	["SLIDER", ["Slide Velocity", "Distance in meters the object will be moved in each loop."], [0, 5, 0.02, 2]],
	["SLIDER", ["Slide Distance", "Maximum distance in meters the object will slide during slide animation, slide movement is dependat on objects direction."], [0, 5, 0.02, 2]],
	["TOOLBOX:YESNO", ["Enable Bounce", "If true, the object will bounce around the area."], false],
	["SLIDER", ["Bounce Speed", "Distance in meters the object will be moved in each loop."], [0, 10, 0.2, 1]],
	["SLIDER", ["Bounce Altitude", "Determines how high and low the object will bounce in meters from initial altitude."], [0, 100, 2, 0]],
	["TOOLBOX:YESNO", ["Enable Rotation", "If true, the object will rotate around the area."], true],
	["TOOLBOX:YESNO", ["Rotate Clockwise", "If true, the object will rotate clockwise, if false rotation will be countr-clockwise."], true],
	["SLIDER", ["Rotation Velocity", "Rotation speed in degrees."], [0, 359, 1, 0]],
	["TOOLBOX:YESNO", ["Enable Rollover", "If true, the object will roll over the area."], false],
	["SLIDER", ["Roll Velocity", "Rolling speed in radiants."], [0, 5, 0.02, 2]],
	["TOOLBOX:YESNO", ["Enable Orbit", "If true, the object will orbit around the area."], true],
	["TOOLBOX:YESNO", ["Orbit Clockwise", "True for clockwise orbiting and false for counter-clockwise."], [true]],
	["SLIDER:RADIUS", ["Orbit Radius", "Orbit radius in meters around initial position of the object."], [5, 500, 10, 0, _radiuspos, [7, 120, 32, 1]]],
	["SLIDER", ["Orbit Speed", "Speed in meters."], [0, 5, 0.10, 2]],
	["TOOLBOX:YESNO", ["Enable Distance Dependent", "If true, the animation will be suspended until the player gets in range."], [false]],
	["SLIDER:RADIUS", ["Activation Distance", "Minimum distance in meters of players to object in order for object to be animated, if player is out of defined range the animation will be suspended until the player gets in range."], [1, 5000, 500, 0, _radiuspos, [7, 120, 32, 1]]]
	], {
		params ["_results", "_attached"];
		_results params ["_allow_damage", "_allow_simulation", "_elevation", "_enableslide", "_slidevel", "_slidedist", "_enablebounce", "_bouncespeed", "_bouncealtitude", "_enablerot", "_rotateclockwise", "_rotvel", "_enableroll", "_rollvel", "_enableorbit", "_orbitclockwise", "_orbitradius", "_orbitspeed", "_enabledistance", "_dist"];

		if (_enableslide != true) then {
			_slidevel = 0;
			_slidedist = 0;
		};
		if (_enablebounce != true) then {
			_bouncespeed = 0;
			_bouncealtitude = 0;
		};
		if (_enablerot != true) then {
			_rotvel = 0;
			_rotateclockwise = nil;
		};
		if (_enableroll != true) then {
			_rollvel = 0;
		};
		if (_enableorbit != true) then {
			_orbitspeed = 0;
			_orbitclockwise = true;
			_orbitradius = 0;
		};
		if (_enabledistance != true) then {
			_dist = 9999;
		};

		["Object Configuration Applied!"] call zen_common_fnc_showMessage;

		[[_attached, [_slidevel, _slidedist], [_bouncespeed, _bouncealtitude], [_rotvel, _rotateclockwise], _rollvel, [_orbitradius, _orbitspeed, _orbitclockwise], _dist, _elevation, _allow_damage, _allow_simulation], "\Root_Effects\Root_FloatingObjects\AL_floating_mountain\float_main.sqf"] remoteExec ["BIS_fnc_execVM", 0];
	}, {
		["Aborted"] call zen_common_fnc_showMessage;
		playSound "FD_Start_F";
	}, _object] call zen_dialog_fnc_create;


/*
["Confirm Settings",[
		["TOOLBOX:YESNO",["CONFIRM?","Once set, the object CANNOT be deleted/modified."], false],
		],{
			params ["_results"];
			_results params ["_confirm"];

			if (_confirm == true) then { [[_attached, [_slidevel, _slidedist], [_bouncespeed, _bouncealtitude], [_rotvel, _rotateclockwise], _rollvel, [_orbitradius, _orbitspeed, _orbitclockwise], _dist, _elevation, _allow_damage, _allow_simulation], "\Root_Effects\Root_FloatingObjects\AL_floating_mountain\float_main.sqf"] remoteExec ["BIS_fnc_execVM", 0]; }

			["Object Configuration Applied!"] call zen_common_fnc_showMessage;

			else {
				["Object Configuration Cancelled!"] call zen_common_fnc_showMessage;
				playSound "FD_Start_F";
			};
		},{
			["Aborted"] call zen_common_fnc_showMessage;
			playSound "FD_Start_F";
		}] call zen_dialog_fnc_create;

	}, {}, _object] call zen_dialog_fnc_create;

*/
