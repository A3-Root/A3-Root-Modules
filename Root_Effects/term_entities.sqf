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
deleteVehicle _logic;

["Terminate Effects",[
	["TOOLBOX:YESNO",["Terminate All UFO Encounters","If true, all UFO Encounters will be terminated."],false],
	["TOOLBOX:YESNO",["Terminate All UFO Seekers","If true, all UFO Seekers will be terminated."],false],
	["TOOLBOX:YESNO",["Terminate All UFO Cropcircles","If true, all UFO Cropcircles will be terminated."],false],
	["TOOLBOX:YESNO",["Terminate All Meteors","If true, all Meteors will be terminated."],false],
	["TOOLBOX:YESNO",["Terminate All Comets","If true, all Comets will be terminated."],false],
	["TOOLBOX:YESNO",["Terminate All Volcano Eruption","If true, all Volcano Eruptions will be terminated."],false],
	["TOOLBOX:YESNO",["Terminate All AAA Barrage","If true, all AAA Barrage will be terminated."],false],
	["TOOLBOX:YESNO",["Terminate All Artillery Barrage","If true, all Artillery Barrage will be terminated."],false],
	["TOOLBOX:YESNO",["Terminate All Missile Launches","If true, all Missile Launhes will be terminated."],false],
	["TOOLBOX:YESNO",["Terminate All Tracers","If true, all Tracers will be terminated."],false],
	["TOOLBOX:YESNO",["Terminate All Search Lights","If true, all Search Lights will be terminated."],false]
	// ["TOOLBOX:YESNO",["Terminate All Spacetime Rupture","If true, all Spacetime Ruptures will be terminated."],false]
	// ["TOOLBOX:YESNO",["Terminate All Aurora Borealis","If true, all Aurora Borealis will be terminated."],false]
	],{
		params ["_results"];
		// _results params ["_isencounter", "_isseeker", "_iscropcircles", "_ismeteor", "_iscomet", "_isvolcano", "_isaaa", "_isartillery", "_ismissile", "_istracer", "_issearchlight", "_isrupture", "_isaurora"];
		_results params ["_isencounter", "_isseeker", "_iscropcircles", "_ismeteor", "_iscomet", "_isvolcano", "_isaaa", "_isartillery", "_ismissile", "_istracer", "_issearchlight"];

		if (_isencounter == true) then { ufoencounter = false; publicVariable "ufoencounter"; };
		if (_isseeker == true) then { seekeron = false; publicVariable "seekeron"; };
		if (_iscropcircles == true) then { end_cross = false; publicVariable "end_cross"; };
		if (_ismeteor == true) then { alias_meteors = false; publicVariable "alias_meteors"; };
		if (_iscomet == true) then { alias_fallingstar = false; publicVariable "alias_fallingstar"; };
		if (_isvolcano == true) then { volcano = false; publicVariable "volcano"; };
		if (_isaaa == true) then { al_aaa = false; publicVariable "al_aaa"; };
		if (_isartillery == true) then { al_art = false; publicVariable "al_art"; };
		if (_ismissile == true) then { al_missile = false; publicVariable "al_missile"; };
		if (_istracer == true) then { al_tracer = false; publicVariable "al_tracer"; };
		if (_issearchlight == true) then { al_search_light = false; publicVariable "al_search_light"; };
		// if (_isrupture == true) then { rupture_active = false; publicVariable "rupture_active"; };
		// if (_isaurora == true) then { aurora_active = false; publicVariable "aurora_active"; };
		
		["Effects Terminated!"] call zen_common_fnc_showMessage;
	},{
		["Termination Aborted!"] call zen_common_fnc_showMessage;
		playSound "FD_Start_F";
	}] call zen_dialog_fnc_create;

