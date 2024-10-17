// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT

if (!hasinterface) exitwith {};
params ["_ufo"];
enableCamShake true;
_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
ateri = "\Root_Effects\Root_UFO\sound\aterizat.ogg";
lans = "\Root_Effects\Root_UFO\sound\lansare.ogg";
playSound3D [ateri,"",false,[getmarkerpos _ufo#0,getmarkerpos _ufo#1,200],10,1,3000];
uiSleep 1.3;
_orb_reper = "Sign_Sphere100cm_F" createVehiclelocal getmarkerpos _ufo;
_orb_reper setObjectTextureGlobal [0,"#(argb,8,8,3)color(1,1,1,0,ca)"];
drop [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,2.5,[0,0,500],[0,0,-200],0,9,7,0,[1,10],[[0,0,1,1],[0.9,.9,1,1]],[1],0,0,"","",_orb_reper];
uiSleep 2;
for "_i" from 1 to 3 do { 
	uiSleep 0.1;
	drop [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",.5,1,[0,0,0],[0,0,0],0,9,7,0,[1,10,.5],[[0,0,0,0],[0,0,0,1],[0,0,0,0]],[1],0,0,"","",_orb_reper];
};
_blast_wave = "#particlesource" createVehicleLocal getPosATL _orb_reper;
_blast_wave setParticleCircle [5,[0,0,0]];
_blast_wave setParticleRandom [0.1,[3,3,1],[100,100,0],0,2,[0,0,0,0.5],1,0];
_blast_wave setParticleParams [["\A3\data_f\cl_basic",1,0,1],"","Billboard",1,3,[1,1,2],[0,0,-5],0,20,1,1,[5,10],[[0.05,0.04,0.03,0.5],[0.05,0.04,0.03,0]],[1],1,0,"","",_orb_reper];
_blast_wave setDropInterval 0.002;
[_blast_wave] spawn {_de_sters = _this select 0;uiSleep 0.2; deleteVehicle _de_sters};
"Crater" createVehiclelocal getpos _orb_reper;
drop [["\A3\data_f\ParticleEffects\Universal\Universal",16,12,9,0],"","BillBoard",1,3,[0,0,1],[0,0,10],0,50,0.01,0,[10,25],[[0.1,0.1,0.1,1],[0.1,0.1,0.1,1]],[1000],1,0,"","",_orb_reper];
uiSleep 0.3;

_orb_obj = "#lightpoint" createvehiclelocal getmarkerpos _ufo;
_orb_obj setLightDayLight true;_orb_obj setLightUseFlare true;
_orb_obj setLightFlareSize 5; _orb_obj setLightFlareMaxDistance 5000;	
_orb_obj setLightAmbient[0.5,0.5,1]; _orb_obj setLightColor[0.5,0.7,0.9];
_orb_obj setLightAttenuation [0,0,0,0,0,4000]; 
_orb_obj setLightBrightness 10;
_orbit_speed=0.02;

_jumps = 4+round (random 33);
[_orb_obj] spawn {
	params ["_orb_obj"];
	while {alive _orb_obj} do {
		_orb_obj say3d ["charge_2",400];
		uiSleep 4;
	}
};
addCamShake [2,10,30];
playSound "cutremur";
while {_jumps>0} do {
	_radius = 5 + round (random 20);
	_poz_rel=_orb_reper getRelPos [_radius,round (random 360)];
	_orb_reper setpos _poz_rel;
	_sens = selectrandom [true,false];
	_moveme= _orb_reper getRelDir _orb_obj;
	_rad_lit = _orb_obj distance _orb_reper;
	_rand_arc= round (random 180);
	while {_rand_arc>0} do {
		_poz_rel_1=_orb_reper getRelPos [_rad_lit,_moveme];
		_orb_obj setpos [_poz_rel_1#0,_poz_rel_1#1,2];
		drop [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,1,[0,0,0],[0,0,0],0,9.999,7,0,[1,5],[[0.443,0.706,0.81,0.2],[0.443,0.706,0.81,0]],[1],0,0,"","",_orb_obj];
		drop [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",.2,0.5,[1,1,0],[0,0,0],0,9,7,0,[1,10,.5],[[0,0,0,0],[0,0,0,1],[0,0,0,0]],[1],0,0,"","",_orb_obj];
		if (_sens) then {_moveme=_moveme+1} else {_moveme=_moveme-1};
		_rand_arc=_rand_arc-1;
		uiSleep _orbit_speed;
	};
	_jumps=_jumps-1;
};
playSound3D [lans,"",false,[getmarkerpos _ufo#0,getmarkerpos _ufo#1,200],10,1,3000];
for "_i" from 1 to 10 do { 
	uiSleep 0.2;
	drop [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",.5,1,[0,0,0],[0,0,0],0,9,7,0,[1,10,.5],[[0,0,0,0],[0,0,0,1],[0,0,0,0]],[1],0,0,"","",_orb_obj];
};
drop [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,2.5,[0,0,0],[0,0,200],0,9,7,0,[10,1],[[1,1,1,1],[0.9,.9,1,1]],[1],0,0,"","",_orb_obj];
deletevehicle _orb_obj;
deletevehicle _orb_reper;

deletevehicle _orb_reper;
deletevehicle _orb_obj;