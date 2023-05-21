
_burpRemoveTime = 0;

while {true} do {
	sleep 1; // 1 ticks per second system
	


	//--- BURPERS
	{
		_burper = _x;
		//--- Update burper positions if mobile
		if (_burper getVariable ["isMobile",false] && {_burper getVariable ["nextUpdate",0] < diag_tickTime}) then {
			_burper setVariable ["nextUpdate",diag_tickTime + random 60];
			_poz_ini_burp = getPosATL _burper;
			_new_poz = [_poz_ini_burp,0.1,1,1,0,-1,0] call BIS_fnc_findSafePos;
			_burper setPosATL [_new_poz select 0,_new_poz select 1, _poz_ini_burp select 2];
		};

		//--- Check if burper is being removed
		if (!isNil "ROOT_var_antiBurperDevice" && _burpRemoveTime > -1) then {
			_nearDevices = nearestObjects [position _burper, [ROOT_var_antiBurperDevice], _burper getVariable ["killRange",5], false];
			if (count _nearDevices > 0) then {
				_burpRemoveTime = _burpRemoveTime + 1;
				if (_burpRemoveTime < 7) then {
					[_object_anom_burp] remoteExec ["ROOT_fnc_burperDisableEffect",[0,-2] select isDedicated];
				} else {
					//--- KILL BURPER
					_burpRemoveTime = -1; // disable
					[_burper,_nearDevices] spawn ROOT_fnc_burperOnDestroyedEffect;
					ROOT_var_burperObjects deleteAt _forEachIndex; //TODO Not sure if this will fuck up the sorting
				}
			} else {
				_burpRemoveTime = 0;
			};
		};


		//--- Apply panic to near AI's
		if (_burper getVariable ["AiPanicEnabled",false]) then {
			_nearAis = (position _burper) nearEntities ["Man",80];
			{
				if (!isPlayer _x && {_x call ROOT_fnc_hasBurperDetector}) then {
					[_x,_burper] remoteExec ["ROOT_fnc_burperAiAvoid",[0,owner _x] select isMultiplayer];
				}
			} foreach _nearAis;
		};
	} foreach ROOT_var_burperObjects;


}