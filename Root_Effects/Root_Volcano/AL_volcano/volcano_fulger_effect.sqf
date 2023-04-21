// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 


if ((random 10) < 9.9) exitWith {};

_tip_fulger = selectRandom ["A3\data_f\blesk1","A3\data_f\blesk2"];
_tunet = selectRandom ["05_far","06_far","08_far","14_far","21_far","26_far"];

_sclipiri = floor (random 5);
drop [[_tip_fulger,1,0,1],"","SpaceObject",1,0.2,_this,[0,0,0],0,10,7.9,0,[3],[[1,1,1,1]],[1],0,0,"","",_this];
while {_sclipiri>0} do 
{
	_li_fulger = "#lightpoint" createVehicle _this;
	_li_fulger setLightAttenuation [0,0,0,0,40,10000];
	_brit = 50+(random 150);
	_li_fulger setLightBrightness _brit;
	_li_fulger setLightDayLight true;	
	_li_fulger setLightUseFlare false;
	_li_fulger setLightFlareSize 50;
	_li_fulger setLightFlareMaxDistance 2000;	
	_li_fulger setLightAmbient[1,1,1];
	_li_fulger setLightColor[1,1,1];
	sleep 0.15+(random 0.2);
	deleteVehicle _li_fulger;
	_sclipiri = _sclipiri-1;
};
sleep 0.5;
playsound _tunet;