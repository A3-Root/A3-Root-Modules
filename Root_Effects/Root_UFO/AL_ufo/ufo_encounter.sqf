// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

if(!isserver) exitwith {};
params ["_freq"];
[] execVM "\Root_Effects\Root_UFO\AL_ufo\ufo_hunt.sqf";
waituntil {!isNil "ufo_hunt_alias"};

ufoencounter = true;
while {ufoencounter} do {
	_enc_type = selectrandom ["cross","jump"];
	_poz = ufo_hunt_alias getrelpos [200+random 1800,selectrandom [random 60,random -60]];
	_ini_poz = [_poz#0,_poz#1,200+random 1800];
	switch (_enc_type) do {
		case "cross": {[[_ini_poz],"\Root_Effects\Root_UFO\AL_ufo\ufo_cross.sqf"] remoteExec ["execvm"]};
		case "jump": {[[_ini_poz],"\Root_Effects\Root_UFO\AL_ufo\ufo_charging_SFX.sqf"] remoteExec ["execvm"]};
	};
	sleep _freq;
}