
_burpRemoveTime = 0;

while {true} do {
	sleep 1; // 1 ticks per second system
	


	//--- BURPERS
	{
		_burper = _x;
		if (!alive _burper) then {continue};

		//--- Update burper positions if mobile
		if (_burper getVariable ["isMobile",false] && {_burper getVariable ["nextUpdate",0] < diag_tickTime}) then {
			_burper setVariable ["nextUpdate", diag_tickTime + random 60];
			_poz_ini_burp = getPosATL _burper;
			_new_poz = [_poz_ini_burp,0.1,1,1,0,-1,0] call BIS_fnc_findSafePos;
			_burper setPosATL [_new_poz select 0,_new_poz select 1, _poz_ini_burp select 2];
		};

		//--- Check if burper is being removed
		if (!isNil "ROOT_var_antiBurperDevice" && _burpRemoveTime > -1) then {
			_nearDevices = nearestObjects [_burper, [ROOT_var_antiBurperDevice], _burper getVariable ["destroyRange",5], false];
			if (count _nearDevices > 0) then {
				_burpRemoveTime = _burpRemoveTime + 1;
				if (_burpRemoveTime < 7) then {
					[_object_anom_burp] remoteExec ["ROOT_fnc_burperDisableEffect",[0,-2] select isDedicated];
				} else {
					//--- Destroy Burper
					_burpRemoveTime = -1; // disable
					[_burper,_nearDevices] spawn ROOT_fnc_burperOnDestroyedEffect;
					ROOT_var_burperObjects deleteAt _forEachIndex; //TODO Not sure if this will fuck up the sorting
					continue;
				}
			} else {
				_burpRemoveTime = 0;
			};
		};


		//--- Apply panic to near AI's
		if (_burper getVariable ["AiPanicEnabled",false]) then {
			_nearAis = _burper nearEntities ["Man",80];
			{
				if (!isPlayer _x && {_x call ROOT_fnc_hasBurperDetector}) then {
					[_x,_burper] remoteExec ["ROOT_fnc_burperAiAvoid",[0,owner _x] select isMultiplayer];
				}
			} foreach _nearAis;
		};


		//--- Apply damage to nearby units and objects
		_killRange = _burper getVariable ["killRange",10];
		_nearUnits = if (_burper getVariable ["killVehicles",true]) then {
			_burper nearEntities [["Man", "LandVehicle"], _killRange];
		} else {
			_burper nearEntities [["Man"], _killRange];
		};

		{
			if (!isDamageAllowed _x || !alive _burper) then {continue};
			[_x] spawn {
				params["_unit"];
				_effect = ["strigat_1","strigat_2","strigat_3","strigat_4","strigat_5","strigat_6","strigat_7","strigat_8","strigat_9","strigat_91","strigat_92"] call BIS_fnc_selectRandom;
				[_unit,[_effect,100]] remoteExec ["say3d",0];
				sleep 0.5 + (random 0.5);
				_unit setDamage 1;
				_unit hideObjectGlobal true;
				if !(_unit isKindOf "LandVehicle") then { deletevehicle _unit; };
				_body = createVehicle ["Land_HumanSkeleton_F", [getPosATL _unit select 0,getPosATL _unit select 1,1.5], [], 0, "CAN_COLLIDE"];
				[_body] remoteExec ["ROOT_fnc_burperDamageEffect",[0,-2] select isDedicated];
				_blood = createVehicle ["BloodSplatter_01_Medium_New_F", [getPosATL _unit select 0,getPosATL _unit select 1,0], [], 0, "CAN_COLLIDE"];
				_body setDir (random 360);
				_body setVectorUp [0,-1,1];
				[_burper,["blood_splash",100]] remoteExec ["say3d",0];
				sleep 0.3;
				[_blood,["bones_drop",100]] remoteExec ["say3d",0];
			}
		} foreach _nearUnits;
	} foreach ROOT_var_burperObjects;

}