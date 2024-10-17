// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT
if (!hasInterface)	exitWith {};

cutText ["","WHITE OUT",1]; titleCut ["","WHITE IN",1];
_effect_tip = ["blur","colorinv","chrom","colorcor"] call BIS_fnc_selectRandom;
enableCamShake true;
addCamShake [3+random 7,3,13+random 33];
playsound "puls";

switch (_effect_tip) do 
{
	case "blur": 
				{
				"dynamicBlur" ppEffectEnable true;   
				"dynamicBlur" ppEffectAdjust [40];   
				"dynamicBlur" ppEffectCommit 0;     
				"dynamicBlur" ppEffectAdjust [0.0];
				"dynamicBlur" ppEffectCommit 3;  
				sleep 3;
				"dynamicBlur" ppEffectEnable false; 
				};
	case "colorinv": 
				{
				0 = ["ColorInversion", 2500, [0, 1, 0]] spawn 
				{
					params ["_name", "_priority", "_effect", "_handle"];
					while {
						_handle = ppEffectCreate [_name, _priority];
						_handle < 0
					} do {
						_priority = _priority + 1;
					};
					_handle ppEffectEnable true;
					_handle ppEffectAdjust _effect;
					_handle ppEffectCommit 5;
					waitUntil {ppEffectCommitted _handle};
					uiSleep 3; 
					_handle ppEffectEnable false;
					ppEffectDestroy _handle;
				};
				};				
	case "chrom": 
				{
				0 = ["ChromAberration", 200, [0.93, 0.86, true]] spawn {
					params ["_name", "_priority", "_effect", "_handle"];
					while {
						_handle = ppEffectCreate [_name, _priority];
						_handle < 0
					} do {
						_priority = _priority + 1;
					};
					_handle ppEffectEnable true;
					_handle ppEffectAdjust _effect;
					_handle ppEffectCommit 5;
					waitUntil {ppEffectCommitted _handle};
					uiSleep 3; 
					_handle ppEffectEnable false;
					ppEffectDestroy _handle;
				};
				};								
	case "colorcor": 
				{
				0 = ["ColorCorrections", 1500, [ 1, 1, 0, [0, 0, 0, 0],[1.8, 1.8, 0.3, -5],[0.2, 0.59, 0.11, -1.83]]] spawn 
				{
					params ["_name", "_priority", "_effect", "_handle"];
					while {
						_handle = ppEffectCreate [_name, _priority];
						_handle < 0
					} do {
						_priority = _priority + 1;
					};
					_handle ppEffectEnable true;
					_handle ppEffectAdjust _effect;
					_handle ppEffectCommit 5;
					waitUntil {ppEffectCommitted _handle};
					uiSleep 3; 
					_handle ppEffectEnable false;
					ppEffectDestroy _handle;
				};
				};					
};