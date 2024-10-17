// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

private ["_fall_star_light"];

if (!hasInterface) exitWith {};

	_fall_star_light = _this select 0;

	_psmoke = "#particlesource" createVehicleLocal getPosATL _fall_star_light;
	_psmoke setParticleCircle [0, [0, 0, 0]];
	_psmoke setParticleRandom [3, [0.25, 0.25, 0.25], [0, 0, 0], 0, 0.25, [0, 0, 0, 0.5], 0, 0];	
	_psmoke setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 2, [0, 0, 0], [0, 0, 0.75], 30, 10, 7.9, 0, [1.2, 4, 1], [[1, 1, 1, 1], [0.25, 0.25, 0.25, 0.5]], [0.08], 1, 0, "", "", _fall_star_light];
	_psmoke setDropInterval 0.002;	
	
	_bri_li = 3000;
	_li = "#lightpoint" createVehicle [(getPos _fall_star_light select 0),(getPos _fall_star_light select 1),(getPos _fall_star_light select 2)];
	_li lightAttachObject [_fall_star_light, [0,0,0]];
	_li setLightIntensity _bri_li;
	_li setLightAttenuation [500,300,3000,0,5,500]; 
	_li setLightUseFlare true;
	_li setLightFlareSize 10;
	_li setLightFlareMaxDistance 2000;	
	_li setLightAmbient[1,.8,.7];
	_li setLightColor[1,1,1];	
	
	uiSleep 0.2;
	
	_li setLightFlareSize 5;

	while {_bri_li>-50} do {
		_li setLightIntensity _bri_li;
		_bri_li=_bri_li-50;
	uiSleep 0.05;
	};
	waitUntil {_bri_li==0};
	deleteVehicle _li;