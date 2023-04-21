// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 


if (!hasInterface) exitWith {};

	_fall_meteor_smoke = _this select 0;
	
	_li2 = "#lightpoint" createVehicle getpos _fall_meteor_smoke;
	_li2 setLightBrightness 90;
	_li2 setLightDayLight true;
	_li2 setLightAmbient[1,0.5,0];
	_li2 setLightColor[1, 0.5, 0];
	_li2 lightAttachObject [_fall_meteor_smoke, [0,0,0.1]];
	
	_meteor_smoke  = "#particlesource" createVehicleLocal getPosATL _fall_meteor_smoke;
	_meteor_smoke  setParticleCircle [0,[0,0,0]];
	_meteor_smoke  setParticleRandom [0,[0,0,0],[0,0,0],0,0,[0,0,0,0],0,0];
	_meteor_smoke  setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal",16,3,17,1], "", "Billboard", 1,0.5,[0, 0, 0], [0, 0, 0.5],5, 10.1, 7.9, 0.0001, [7,3,1], [[0.1,0.1,0.1,0.9], [0.6,0.6,0.6,0.6], [0.8,0.8,0.8,0.4],[0.9,0.9,0.9,0.3],[1,1,1,0.1]],[500], 1, 0, "", "", _fall_meteor_smoke];	
	_meteor_smoke  setDropInterval 0.002;

	_ps2 = "#particlesource" createVehicleLocal getPosATL _fall_meteor_smoke;
	_ps2 setParticleCircle [0, [0, 0, 0]];
	_ps2 setParticleRandom [0.5,[1,1,0],[0.175,0.175,0],5,0.25,[0,0,0,0.5],1,0];
	_ps2 setParticleParams [["\A3\data_f\cl_basic",1,0,1], "", "Billboard",1,7,[0,0,3],[0,0,0],7,10,7.9,0.1,[10,20,50],[[0,0,0,1],[0,0,0,1],[0,0,0,0]],[0.08], 1, 0, "", "", _fall_meteor_smoke];
	_ps2 setDropInterval 0.01;
	
	while {!isNull _fall_meteor_smoke} do 
	{
		_fall_meteor_smoke say3D ["meteor_1",2000];
		sleep 0.9;
	};
	deleteVehicle _li2;