


params ["_unit"];

if (isNil "obj_prot_burper") exitWith {false};

(typeOf _unit == "VirtualCurator_F") ||
(toLower headgear _unit == toLower obj_prot_burper) ||
(toLower goggles _unit == toLower obj_prot_burper) ||
(toLower uniform _unit == toLower obj_prot_burper) ||
(toLower vest _unit == toLower obj_prot_burper) ||
(toLower Backpack _unit == toLower obj_prot_burper) ||
(typeOf _unit == missionNamespace getVariable ["ROOT_var_antiBurperDevice",""]) ||
((assigneditems _x + items _x) findIf {toLower _x == toLower obj_prot_burper}) != -1