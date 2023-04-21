// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

params ["_poz"];

fnc_check_gear ={
			params ["_unit"];
			_ck_ret=false;
			_slot_check = [headgear _unit, goggles _unit, uniform _unit, vest _unit, Backpack _unit];
			{
				if (typeOf _x == "VirtualCurator_F") exitWith {_ck_ret=false};
				if !(_x in _slot_check) exitWith {_ck_ret=true};
				} forEach protect_volcano;
			if (_ck_ret) exitWith {true};
			false
	};

while {volcano} do {
	_unit_dead = _poz nearEntities [["Man","Air","Car","Motorcycle","Tank"],600];
	if (count _unit_dead >0) then {
		if (count protect_volcano > 0) then {
			{
				if (_x call fnc_check_gear) then {
					if (_x isKindOf "Man") then {
						_bodyPart = ["Head", "RightLeg", "LeftArm", "Body", "LeftLeg", "RightArm"];
                		{ [_x, 1, _bodyPart, "ropeburn"] call ace_medical_fnc_adddamagetoUnit; } foreach _bodyPart;
                		} else { _x setDamage 1; }; } } foreach _unit_dead; };
		{ if (_x inArea [[9981.46,12077.1,74.964],280,220,0,false,200]) then {
			if (_x isKindOf "Man") then {
				_bodyPart = ["Head", "RightLeg", "LeftArm", "Body", "LeftLeg", "RightArm"];
                { [_x, 1, _bodyPart, "ropeburn"] call ace_medical_fnc_adddamagetoUnit;
				_x setDamage 1; } foreach _bodyPart;
                } else { _x setDamage 1; };}} foreach _unit_dead;
	};
	sleep 2;
};

