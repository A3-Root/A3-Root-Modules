// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT

if (!hasinterface) exitwith {};

params ["_ini_poz"];
_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
charge_done = "\Root_Effects\Root_UFO\sound\charge_complete.ogg";
charging = "\Root_Effects\Root_UFO\sound\charge_2.ogg";
_ufo = "Sign_Sphere200cm_F" createVehiclelocal [0,0,0];
_ufo setObjectTexture [0,"#(argb,8,8,3)color(1,1,1,1,ca)"];
_ufo setposATL _ini_poz;
playsound "static";
sleep 5;
_plasma_wave = "#particlesource" createVehicleLocal getposasl _ufo;  
_plasma_wave setParticleCircle [0,[0,0,0]];  
_plasma_wave setParticleRandom [0,[0,0,0],[0,0,0],0,0,[0,0,0,0],0,0];
_plasma_wave setParticleParams [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,0.5,[0,0,1],[0,0,0],0,9.999,7,0,[1,50],[[1,1,1,0.2],[1,1,1,0]],[1],0,0,"","",_ufo];
_plasma_wave setDropInterval 0.1;

[_ufo] execvm "\Root_Effects\Root_UFO\AL_ufo\ufo_light_charge_sfx.sqf";
charge_ufo=false;
playSound3D [charge_done,"",false,getpos _ufo,1,1,5000];
sleep 5;
deletevehicle _plasma_wave;
charge_ufo=true;
_obiect_lit = createSimpleObject ["A3\data_f\VolumeLight_searchLight.p3d",getposATL _ufo];
_obiect_lit attachto [_ufo,[0,150,-2]]; 
deletevehicle _ufo;
sleep 0.5;
deletevehicle _obiect_lit;