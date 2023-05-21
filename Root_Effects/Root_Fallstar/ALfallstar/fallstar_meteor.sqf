// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

	private ["_xx_dest","_yy_dest","_blast"];

	_dire	= [1000,-1000] call BIS_fnc_selectRandom;	
	_xx = (getpos fallstar_hunt_alias select 0)+random _dire;
	_dire	= [1000,-1000] call BIS_fnc_selectRandom;	
	_yy = (getpos fallstar_hunt_alias select 1)+random _dire;
	_poz_ini = [_xx, _yy, 800];
	_blast = true;

	_falling_meteor_main = "Land_Battery_F" createVehicle _poz_ini;
	_falling_meteor_main setPosATL _poz_ini;

	[[_falling_meteor_main],"\Root_Effects\Root_Fallstar\ALfallstar\fallstar_meteor_ini_blast.sqf"] remoteExec ["execVM"];

	_bariera_sunet = ["bariera_1","bariera_2","bariera_3","bariera_4", "bariera_5"] call BIS_fnc_selectRandom;	
	[_falling_meteor_main,[_bariera_sunet,4000]] remoteExec ["say3d"];

	_dire_dest	= [1000,-1000] call BIS_fnc_selectRandom;	
	_xx_dest 	= _xx+random _dire_dest;
	_dire_dest	= [1,-1] call BIS_fnc_selectRandom;
	_yy_dest 	= _yy+random _dire_dest;

	[[_falling_meteor_main],"\Root_Effects\Root_Fallstar\ALfallstar\fallstar_meteoreffect.sqf"] remoteExec ["execVM"];

	_falling_meteor_main setvelocity [_xx_dest/200,_yy_dest/200,-100];
	waitUntil {sleep 0.1; (getpos _falling_meteor_main select 2)<20};
	_poz_end = getPos _falling_meteor_main;

	[[_poz_end,_xx_dest/200,_yy_dest/200,_blast],"\Root_Effects\Root_Fallstar\ALfallstar\fallstar_meteor_end_blast.sqf"] remoteExec ["execVM"];
	deleteVehicle _falling_meteor_main;
	
	_nearobjects = nearestObjects[_poz_end,[],100];
	{if((_x isKindOf "LandVehicle") or (_x isKindOf "Man") or (_x isKindOf "Air")) then {
		if (typeOf _x != "VirtualCurator_F") then {
			_x setVelocity [random 3, random 3, random 30];
			if (_x isKindOf "Man") then {
			_bodyPart = ["RightLeg", "LeftArm", "Body", "LeftLeg", "RightArm", "Head"];
			_dmgType = selectRandom ["backblast", "explosive", "grenade", "punch", "ropeburn", "shell", "stab"];
			for "_i" from 0 to 5 do { [_x, 0.99, (_bodyPart select _i), _dmgType] call ace_medical_fnc_addDamageToUnit;
			_x setDamage [1, false] }; } else { _x setdamage [1, false]; };
		};
		} else {_x setdamage [1,false]}} foreach _nearobjects;
