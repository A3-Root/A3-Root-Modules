// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT

if (!hasinterface) exitwith {};
params ["_ufo"];

_cloud = "#particlesource" createVehicleLocal getpos _ufo;
_cloud setParticleCircle [0,[0,0,0]];
_cloud setParticleRandom [0,[1500,1500,100],[0,0,0],0,0,[0,0,0,0],0,0];
_cloud setParticleParams[["\A3\data_f\cl_basic", 1, 0, 1],"","Billboard",1,3,[0,0,-1500],[0,0,50],3,10,7.9,0,[400,450,500],[[0.1,0.1,0.5,0],[1,1,1,0.3],[0,0,0.5,0]],[0],0,0,"","",_ufo];
_cloud setDropInterval 0.002;
[_cloud] spawn {params ["_de_sters"];sleep 0.5;deleteVehicle _de_sters};

_lum_fulg_w = "#lightpoint" createvehiclelocal getposatl _ufo;
_lum_fulg_w setLightDayLight true;_lum_fulg_w setLightUseFlare true;
_lum_fulg_w setLightFlareSize 15; _lum_fulg_w setLightFlareMaxDistance 5000;	
_lum_fulg_w setLightAmbient[0.5,0.5,1];	_lum_fulg_w setLightColor[0.443,0.706,0.9];
_lum_fulg_w setLightAttenuation [0,0,0,0,0,4000]; 
_lum_fulg_w setLightIntensity 10;
_lum_fulg_w setLightBrightness 10;

_lum_fulg_w attachto [_ufo,[0,0,0]];
waituntil {end_cross};
if (overcast >0.5) then {
	_cloud = "#particlesource" createVehicleLocal getpos _ufo;
	_cloud setParticleCircle [0,[0,0,0]];
	_cloud setParticleRandom [0,[1500,1500,100],[0,0,0],0,0,[0,0,0,0],0,0];
	_cloud setParticleParams[["\A3\data_f\cl_basic", 1, 0, 1],"","Billboard",1,3,[0,0,500],[0,0,50],3,10,7.9,0,[400,450,500],[[0.1,0.1,0.5,0],[1,1,1,0.3],[0,0,0.5,0]],[0],0,0,"","",_ufo];
	_cloud setDropInterval 0.002;
	[_cloud] spawn {params ["_de_sters"];sleep 0.5;deleteVehicle _de_sters};
};
_dim_flare=15;
while {_dim_flare>0} do {
	_lum_fulg_w setLightFlareSize _dim_flare;
	_dim_flare=_dim_flare-1;
	sleep 0.2;
};
sleep 3;
deletevehicle _lum_fulg_w;