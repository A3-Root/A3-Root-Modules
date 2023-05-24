// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 


params ["_burper","_mobile_anomaly","_protectDevice","_damage_protect","_antiBurperDevice","_burper_radius","_vehicle_allowed","_destroyRange","_isaipanic"];


_burper setVariable ["isMobile",_mobile_anomaly,true];
_burper setVariable ["destroyRange",_destroyRange,true];
_burper setVariable ["killRange",_burper_radius,true];
_burper setVariable ["BurperActive",true,true];
_burper setVariable ["AiPanicEnabled",_isaipanic,true];
_burper setVariable ["killVehicles",_vehicle_allowed,true];

if (_protectDevice != "") then {
	ROOT_var_burperDetector = _protectDevice;
	publicVariable "ROOT_var_burperDetector";
};

if (ROOT_var_antiBurperDevice != "") then {
	ROOT_var_antiBurperDevice = _antiBurperDevice;
	publicVariable "ROOT_var_antiBurperDevice";
};

ROOT_var_burperProtectorNeeded = (_protectDevice != "");
publicVariable "ROOT_var_burperProtectorNeeded";


if (_damage_protect !="") then {
	obj_prot_burper = _damage_protect;
	publicVariable "obj_prot_burper"
};
