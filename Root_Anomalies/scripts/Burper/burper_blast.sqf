// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

private ["_obj_neutr"];

if (!hasInterface) exitWith {};

_obj_neutr = _this select 0;

if (player distance _obj_neutr < 300) then {
	cutText ["", "WHITE OUT", 1];
	uiSleep 0.1;
	titleCut ["", "WHITE IN", 1];
	"dynamicBlur" ppEffectEnable true;   
	"dynamicBlur" ppEffectAdjust [40];   
	"dynamicBlur" ppEffectCommit 0;     
	"dynamicBlur" ppEffectAdjust [0.0];
	"dynamicBlur" ppEffectCommit 3;  
	uiSleep 3;
	"dynamicBlur" ppEffectEnable false; 
};