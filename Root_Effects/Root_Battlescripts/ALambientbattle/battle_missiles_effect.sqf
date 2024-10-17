// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 


if (!hasInterface) exitWith {};

params ["_miss_object_name", "_missle_distance", "_launch_delay"];

uiSleep _launch_delay;

_al_rocket = "Land_Battery_F" createVehicleLocal getPosATL _miss_object_name;

while {(al_missile) and (!isNull _miss_object_name)} do 
{
	if (player distance _miss_object_name > _missle_distance) then 
	{
		_sunetr =  ["roc_1","roc_2","roc_3","roc_4"] call BIS_fnc_selectRandom;

		_li = "#lightpoint" createVehiclelocal (getPos _al_rocket);
		_li setLightBrightness 100;
		_li setLightAttenuation [5,0,100,2000,200,500]; 
		_li setLightUseFlare true;
		_li setLightFlareSize 1;
		_li setLightFlareMaxDistance 2000;	
		_li setLightAmbient[1,0.7,0];
		_li setLightColor[1,1,1];
		_li lightAttachObject [_al_rocket, [0,0,-3]];

		_al_rocket say3d [_sunetr,2000];

		_ps1 = "#particlesource" createVehicleLocal getpos _al_rocket;
		_ps1 setParticleCircle [0, [0, 0, 0]];
		_ps1 setParticleRandom [2, [0, 0, 0], [0.2, 0.2, 0.5], 0.3, 0.5, [0, 0, 0, 0.5], 0, 0];
		_ps1 setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 2+random 1, [0, 0, 0], [0, 0, 1], 3, 0.01, 0.007, 0, [4,1,7,10], [[1, 1, 1, 1], [0.6, 0.3, 0.2, 1], [0, 0, 0, 0.5], [0, 0, 0, 0]], [0.08], 1, 0, "", "", _al_rocket];
		_ps1 setDropInterval 0.002;

		_al_rocket setVelocity [0,0,200];

		uiSleep _launch_delay;
		deleteVehicle _ps1;	
		deletevehicle _li;
		_al_rocket setPosATL getPosATL _miss_object_name;
	} else {uiSleep 5};
};

deleteVehicle _al_rocket;