// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 


if(!isserver) exitwith {};
private ["_cross_ufo"];
params ["_poz_ini"];
_cross_ufo = "Land_Battery_F" createVehicle [0,0,0];
end_cross = false; publicvariable "end_cross";
_cross_ufo setPosATL [_poz_ini#0,_poz_ini#1,3000];
_cross_ufo setvelocity [0,0,-300];
[[_cross_ufo],"\Root_Effects\Root_UFO\AL_ufo\ufo_cross_lit.sqf"] remoteExec ["execVM"];
sleep 8;
[_cross_ufo,["ufo_cross",3000]] remoteExec ["say3d"];
_zig = 2+round (random 10);
while {_zig>0} do {
	_cross_ufo setvelocity [200+round(random 200)*selectrandom[-1,1],200,1];
	sleep 1+round (random 2);
	_zig=_zig-1;
};
_cross_ufo setvelocity [0,0,500];
end_cross = true; publicvariable "end_cross";
sleep 6;
deletevehicle _cross_ufo;