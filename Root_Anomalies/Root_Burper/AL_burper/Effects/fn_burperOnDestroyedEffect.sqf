params ["_burper",["_nearDevices",[]]];

//["charge_b",true] remoteExec ["playsound"];
[_burper] remoteExec ["ROOT_fnc_burperBlastEffect",[0,-2] select isDedicated];
["charge_b"] remoteExec ["playsound"];
_burper setVariable ["isActive",false,true];
sleep 1;
deleteVehicle _burper;
{_burper setDamage 1} forEach _nearDevices;
sleep 1.5;
["puls_bass"] remoteExec ["playsound"];