


params ["_unit"];

if (isNil "ROOT_var_burperDetector") exitWith {true};
if (typeOf _this == "VirtualCurator_F") exitWith {true};

(toLower headgear _unit == toLower ROOT_var_burperDetector) || 
(toLower goggles _unit == toLower ROOT_var_burperDetector) || 
(toLower uniform _unit == toLower ROOT_var_burperDetector) || 
(toLower vest _unit == toLower ROOT_var_burperDetector) || 
(toLower Backpack _unit == toLower ROOT_var_burperDetector) || {
((assigneditems _unit + items _unit) findIf {toLower _x == toLower ROOT_var_burperDetector}) != -1}