// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

if(!isserver) exitwith {};
params ["_freq"];
[] execVM "\Root_Effects\Root_UFO\AL_ufo\ufo_hunt.sqf";
waituntil {!isNil "ufo_hunt_alias"};

_seekermarker=createMarker ["seekermarker",[0,0,0]];

seekeron = true;
while {seekeron} do {
	_poz = ufo_hunt_alias getrelpos [100+random 500,selectrandom [random 60,random -60]];
	"seekermarker" setMarkerPos _poz;
	[["seekermarker"],"\Root_Effects\Root_UFO\AL_ufo\ufo_travel_SFX.sqf"] remoteExec ["execvm"];
	sleep _freq
}