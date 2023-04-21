// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

if(!isserver) exitwith {};
params ["_ufo","_radius","_typ_crop"];

[[_ufo,_radius,_typ_crop],"\Root_Effects\Root_UFO\AL_ufo\ufo_cropping.sqf"] remoteExec ["execvm"];

sleep 5;
sunet_ini = nil;