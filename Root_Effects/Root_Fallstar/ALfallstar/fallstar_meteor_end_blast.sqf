// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

private ["_shk","_blast","_blast_wave"];

if (!hasInterface) exitWith {};

	_poz	= _this select 0;
	_xv		= _this select 1;
	_yv		= _this select 2;
	_shk	= _this select 3;
	
	_splash_hot = "#particlesource" createVehicleLocal _poz;
	_splash_hot setParticleCircle [0, [0,0,0]];
	_splash_hot setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d",16,0,16,1], "", "Billboard", 1, 0.3, [0, 0,0], [0,0,0],5,10,7,0.1, [80,60], [[1,1,1,1],[1,1,1,0]], [1], 1, 0, "", "",_poz];
	_splash_hot setDropInterval 0.1;
	
	_bolovani = "#particlesource" createVehicleLocal _poz;
	_bolovani setParticleCircle [20,[0,0,0]];
	_bolovani setParticleRandom [7,[0.3,0.3,0],[_xv*5,_yv*5,100],0,0.5,[0, 0, 0, 0.1],0.2,0];
	_bolovani setParticleParams [["\A3\data_f\ParticleEffects\Universal\Mud.p3d", 1, 0, 1], "", "SpaceObject", 1,10, [0, 0, 0], [_xv*2,_yv*2,150],2,200,5,3, [2,2,2], [[0, 0, 0, 1], [0, 0, 0, 0.5], [0.5, 0.5, 0.5, 0]], [0.125],0.5,0, "", "", _poz,0,true,0.6,[[0,0,0,0]]];
	_bolovani setDropInterval 0.005;	

	[_splash_hot] spawn {
		_de_sters = _this select 0;
		sleep 0.5;
		deleteVehicle _de_sters;
	};	
	
	if (_shk) then {
		_blast = "#particlesource" createVehicleLocal _poz;
		_blast setParticleCircle [0,[0,0,0]];
		_blast setParticleRandom [0,[0,0,0],[0,0,0],0,0,[0,0,0,0],0,0];
		_blast setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1,2,[0,0,0],[0,0,-100],15,100,3,1,[30,800],[[0.5,0.5,0.5,0.5],[0.5,0.5,0.5,0]],[0.08],0, 0, "", "", _poz];
		_blast setDropInterval 60;
		
		_blast_wave = "#particlesource" createVehicleLocal _poz;
		_blast_wave setParticleCircle [5,[100,100,0]];
		_blast_wave setParticleRandom [5,[5,5,0],[-100,-100,0],0,2,[0,0,0,0.5],0,0];
		_blast_wave setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1,5,[0,0,0],[0,0,-5],0,20,1,0.0001,[10,30],[[0,0,0,0.1],[0.5,0.5,0.5,0]],[0.08],0, 0, "", "", _poz];
		_blast_wave setDropInterval 0.00001;
	};
	
	_fum = "#particlesource" createVehicleLocal _poz;
	_fum setParticleCircle [40,[0,0,0]];
	_fum setParticleRandom [0.5,[1,1,0],[50,50,70],3,0.5,[0,0,0,1],1,0];
	_fum setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1,10,[0,0,0],[0,0,20],5,30,5,1,[30,50,100],[[0,0,0,1],[0,0,0,0.5],[0.5,0.5,0.5,0]],[0.08], 1, 0, "", "", _poz];
	_fum setDropInterval 0.01;
	
	_meteor_voice = "land_helipadempty_f" createVehiclelocal _poz;
	
	[_meteor_voice] spawn {
		private ["_meteor_voice"];
		_meteor_voice = _this select 0;
		_delay_m = linearConversion [0,2000,player distance _meteor_voice,0,1,true];
		_pow_met = linearConversion [0,2000,player distance _meteor_voice,6,0.1,true];
		sleep _delay_m;
		_meteor_voice say3D ["expozie",3000];
		enableCamShake true;
		addCamShake [_pow_met,5,35];
	};
	
	_craterus = "Crater" createVehiclelocal _poz;
	_li_end = "#lightpoint" createVehicleLocal _poz;
	_li_end setLightIntensity 5000;
	_li_end setLightDayLight true;	
	_li_end setLightAttenuation [800,100,10,0,5,800]; 
	_li_end setLightFlareSize 100;
	_li_end setLightFlareMaxDistance 2000;	
	_li_end setLightAmbient[1, 0.5, 0];
	_li_end setLightColor[1, 0.5, 0];
	sleep 0.2;
	if (_shk) then {deleteVehicle _blast_wave};
	sleep 0.2;
	deleteVehicle _fum;
	deleteVehicle _li_end;
	if (_shk) then {deleteVehicle _blast};
	deleteVehicle _bolovani;
	playSound "earthquakes";
	sleep 1+random 1;
	addCamShake [0.5, 30, 35];	
	sleep 5.3;
	enableCamShake false;
	deleteVehicle _meteor_voice;