// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT

ateri = "\Root_Effects\Root_UFO\sound\aterizat.ogg";
lans = "\Root_Effects\Root_UFO\sound\lansare.ogg";

fnc_orbit = {
	private ["_ufo","_orb_obj","_orbit_speed","_radius","_crop","_ung"]; params ["_ufo","_orb_obj","_orbit_speed","_radius","_crop"];
	_ung = 0;
	_placeit=0;
	"Crater" createVehiclelocal getpos _ufo;
	while {_ung<360} do {
		_poz_rel=_ufo getRelPos [_radius,_ung];
		_orb_obj setpos [_poz_rel#0,_poz_rel#1,2];
		drop [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,0.3,[0,0,0],[0,0,0],0,9.999,7,0,[1,10],[[0.443,0.706,0.81,0.2],[0.443,0.706,0.81,0]],[1],0,0,"","",_orb_obj];
		if ((_crop)&&(_placeit==0)) then {_gol = "Land_ShellCrater_02_decal_F" createvehiclelocal _poz_rel; if (_radius>=50) then {_placeit=4} else {_placeit=12}};
		_placeit=_placeit-1;
		_ung=_ung+1;
		sleep _orbit_speed;
	};
	playSound3D [lans,"",false,[getpos _orb_obj # 0,getpos _orb_obj # 1,100],10,1,3000];
	for "_i" from 1 to 10 do { 
		sleep 0.2;
		drop [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",.5,1,[0,0,0],[0,0,0],0,9,7,0,[1,10,.5],[[0,0,0,0],[0,0,0,1],[0,0,0,0]],[1],0,0,"","",_orb_obj];
	};
	drop [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,2.5,[0,0,0],[0,0,200],0,9,7,0,[10,1],[[1,1,1,1],[0.9,.9,1,1]],[1],0,0,"","",_orb_obj];
	deletevehicle _orb_obj;
};

fnc_spiral = {
	private ["_ufo","_orb_obj","_orbit_speed","_radius","_crop","_ung"]; params ["_ufo","_orb_obj","_orbit_speed","_radius","_crop"];
	_ung = 0;
	_placeit=0;
	"Crater" createVehiclelocal getpos _ufo;
	while {_ung<1260} do {
		_poz_rel=_ufo getRelPos [_radius,_ung];
		_orb_obj setpos [_poz_rel#0,_poz_rel#1,2];
		drop [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,0.3,[0,0,0],[0,0,0],0,9.999,7,0,[1,10],[[0.443,0.706,0.81,0.2],[0.443,0.706,0.81,0]],[1],0,0,"","",_orb_obj];
		if ((_crop)&&(_placeit==0)) then {_gol = "Land_ShellCrater_02_decal_F" createvehiclelocal _poz_rel; _placeit=2};
		_placeit=_placeit-1;
		_radius=_radius+0.1;
		_ung=_ung+1;
		sleep _orbit_speed;
	};
	playSound3D [lans,"",false,[getpos _orb_obj # 0,getpos _orb_obj # 1,100],10,1,3000];
	for "_i" from 1 to 10 do { 
		sleep 0.2;
		drop [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",.5,1,[0,0,0],[0,0,0],0,9,7,0,[1,10,.5],[[0,0,0,0],[0,0,0,1],[0,0,0,0]],[1],0,0,"","",_orb_obj];
	};
	drop [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,2.5,[0,0,0],[0,0,200],0,9,7,0,[10,1],[[1,1,1,1],[0.9,.9,1,1]],[1],0,0,"","",_orb_obj];
	deletevehicle _orb_obj;
};

fnc_floare = {
	private ["_ufo","_orb_obj","_orbit_speed","_radius","_crop","_ung","_orb_reper"]; params ["_ufo","_orb_obj","_orbit_speed","_radius","_crop"];
	_ang = 0;
	"Crater" createVehiclelocal getpos _ufo;
	_orb_reper = "Sign_Sphere100cm_F" createVehiclelocal [0,0,0];
	_orb_reper setObjectTextureGlobal [0,"#(argb,8,8,3)color(1,1,1,0,ca)"];
	_orb_reper setObjectMaterialGlobal [0, "a3\characters_f_bootcamp\common\data\vrarmoremmisive.rvmat"];
	while {_ang<360} do {
		_ung = 360;
		_poz_rel=_ufo getRelPos [_radius,_ang];
		_orb_reper setpos _poz_rel;
		_placeit=0;
		while {_ung>0} do {
			_poz_rel_1=_orb_reper getRelPos [15,_ung];
			_orb_obj setpos [_poz_rel_1#0,_poz_rel_1#1,2];
			drop [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,0.2,[0,0,0],[0,0,0],0,9.999,7,0,[1,5],[[0.443,0.706,0.81,0.2],[0.443,0.706,0.81,0]],[1],0,0,"","",_orb_obj];
			if ((_crop)&&(_placeit==0)) then {_gol = "Land_ShellCrater_02_decal_F" createvehiclelocal getpos _orb_obj; _placeit=18};
			_placeit=_placeit-1;
			_ung=_ung-1;
			if ((_ung<10)||(_ung>349)) then {drop [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",.3,1,[1,1,0],[0,0,0],0,9,7,0,[1,10,.5],[[0,0,0,0],[0,0,0,1],[0,0,0,0]],[1],0,0,"","",_orb_obj]};
			sleep _orbit_speed;
		};
		_ang=_ang+30;
	};
	playSound3D [lans,"",false,[getpos _orb_obj # 0,getpos _orb_obj # 1,100],10,1,3000];
	for "_i" from 1 to 10 do { 
		sleep 0.2;
		drop [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",.5,1,[0,0,0],[0,0,0],0,9,7,0,[1,10,.5],[[0,0,0,0],[0,0,0,1],[0,0,0,0]],[1],0,0,"","",_orb_obj];
	};
	drop [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,2.5,[0,0,0],[0,0,200],0,9,7,0,[10,1],[[1,1,1,1],[0.9,.9,1,1]],[1],0,0,"","",_orb_obj];
	deletevehicle _orb_obj;
	deletevehicle _orb_reper;
};

if (!hasinterface) exitwith {};
params ["_ufo","_radius","_typ_crop"];
enableCamShake true;
if (isnil "sunet_ini") then {
	playSound3D ["\Root_Effects\Root_UFO\sound\aterizat.ogg", "", false, [getpos _ufo select 0, getpos _ufo select 1, 200], 10, 1, 0];
	[] spawn {
		sleep 3.9;
		addCamShake [2,10,30];
		playSound "cutremur";
	};
	sunet_ini = true;
};
sleep 1.3;
_orb_obj = "#lightpoint" createvehiclelocal [0,0,0];
_orb_obj setLightDayLight true;_orb_obj setLightUseFlare true;
_orb_obj setLightFlareSize 5; _orb_obj setLightFlareMaxDistance 5000;	
_orb_obj setLightAmbient[0.5,0.5,1]; _orb_obj setLightColor[0.443,0.706,0.9];
_orb_obj setLightAttenuation [0,0,0,0,0,4000]; 
_orb_obj setLightBrightness 5;

drop [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,2.5,[0,0,500],[0,0,-200],0,9,7,0,[1,10],[[0,0,1,1],[0.9,.9,1,1]],[1],0,0,"","",_ufo];
sleep 2;
for "_i" from 1 to 3 do { 
	sleep 0.1;
	drop [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",.5,1,[0,0,0],[0,0,0],0,9,7,0,[1,10,.5],[[0,0,0,0],[0,0,0,1],[0,0,0,0]],[1],0,0,"","",_orb_obj];
};
sleep 0.3;
_blast_wave = "#particlesource" createVehicleLocal getpos _ufo;
_blast_wave setParticleCircle [5,[0,0,0]];
_blast_wave setParticleRandom [0.1,[3,3,1],[100,100,0],0,2,[0,0,0,0.5],1,0];
_blast_wave setParticleParams [["\A3\data_f\cl_basic",1,0,1],"","Billboard",1,3,[1,1,2],[0,0,-5],0,20,1,1,[5,10],[[0,0,0,0.3],[0.1,0.1,0.1,0]],[1],1,0,"","",_ufo];
_blast_wave setDropInterval 0.002;
[_blast_wave] spawn {_de_sters = _this select 0;sleep 0.2; deleteVehicle _de_sters};
switch (_typ_crop) do {
    case "circle": {[_ufo,_orb_obj,0.01,_radius,true] spawn fnc_orbit};
    case "spiral": {[_ufo,_orb_obj,0.01,_radius,true] spawn fnc_spiral};
    case "flower": {[_ufo,_orb_obj,0.01,_radius,true] spawn fnc_floare};
};
while {alive _orb_obj} do {
	_orb_obj say3d ["crop_me",2000];
	sleep 17;
};