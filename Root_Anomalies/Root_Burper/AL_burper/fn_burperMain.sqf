// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 


if (!isServer) exitwith {};


params ["_object_anom_burp","_mobile_anomaly","_device_detector","_damage_protect","_antiBurperDevice","_burper_radius","_vehicle_allowed","_killrange","_isaipanic"];


_object_anom_burp setVariable ["isMobile",_mobile_anomaly,true];
_object_anom_burp setVariable ["killRange",_killrange,true];
_object_anom_burp setVariable ["isActive",true,true];
_object_anom_burp setVariable ["AiPanicEnabled",_isaipanic,true];

if (_device_detector != "") then {
	ROOT_var_buperDetector = _device_detector;
	publicVariable "ROOT_var_buperDetector";
};

if (ROOT_var_antiBurperDevice != "") then {
	ROOT_var_antiBurperDevice = _antiBurperDevice;
	publicVariable "ROOT_var_antiBurperDevice";
};

detection_smugg = (_device_detector != "");
publicVariable "detection_smugg";


if (_damage_protect !="") then {
	obj_prot_burper = _damage_protect;
	publicVariable "obj_prot_burper"
};


// TODO!!!!
[_object_anom_burp, _burper_radius, _vehicle_allowed, _antiBurperDevice] execvm "\Root_Anomalies\Root_Burper\AL_burper\burper_damage_trap.sqf";
[[_object_anom_burp],"\Root_Anomalies\Root_Burper\AL_burper\burper_sfx.sqf"] remoteExec ["execVM",0,true];

