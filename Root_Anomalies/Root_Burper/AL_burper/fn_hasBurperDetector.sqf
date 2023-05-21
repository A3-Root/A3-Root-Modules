


params ["_unit"];

if (!isNil "ROOT_var_buperDetector") exitWith {true};

(headgear _unit == ROOT_var_buperDetector)or(goggles _unit==ROOT_var_buperDetector)or(uniform _unit==ROOT_var_buperDetector)or(vest _unit==ROOT_var_buperDetector)or(Backpack _unit==ROOT_var_buperDetector) or (ROOT_var_buperDetector in (assigneditems _unit + items _unit));