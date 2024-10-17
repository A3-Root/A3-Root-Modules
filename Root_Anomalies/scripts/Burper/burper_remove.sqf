// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

/*

Inbound

[_object_anom_burp, _anti_burper_device, _killrange] execvm "\Root_Anomalies\scripts\Burper\burper_remove.sqf";

*/

params ["_object_anom_burp","_anti_burper_device", "_kill_range"];

private _device_anti_burp;

waitUntil {
	uiSleep 1; 
	!isNil "anti_burper";
};

_task_time = 0;

_object_anom_burp setVariable ["burper_activ", true, true];

while {(alive _object_anom_burp) && (_task_time < 7)} do {
	_device_anti_burp = nearestObjects [position _object_anom_burp, [anti_burper], _kill_range, false];
	if (count _device_anti_burp > 0) then {
		_task_time = _task_time + 1;
		[[_object_anom_burp], "\Root_Anomalies\scripts\Burper\burper_disable.sqf"] remoteExec ["execVM"]
	} else {
		_task_time = 0;
	};
	uiSleep 5;
};

[[_object_anom_burp], "\Root_Anomalies\scripts\Burper\burper_blast.sqf"] remoteExec ["execVM"];
["charge_b"] remoteExec ["playsound"];
_object_anom_burp setVariable ["burper_activ", false, true];
uiSleep 1;
deleteVehicle _object_anom_burp;
{_x setDamage 1} forEach _device_anti_burp;
uiSleep 1.5;
["puls_bass"] remoteExec ["playsound"];