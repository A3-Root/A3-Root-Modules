// CREATED BY ROOT
// HEAVILY RELIES ON CODE BY JOHNB43 => https://steamcommunity.com/id/johnb43

private ["_unitList", "_isfreeze", "_unitCount", "_revealunit", "_temp", "_useanim", "_animtype"];

if (!isServer) exitWith {};

params ["_unitList", "_isfreeze", "_useanim", "_animtype"];

_unitCount = 0;

{
	if (_isfreeze) then 
	{
		_unitCount = _unitCount + 1;
		if (_useanim) then 
		{
			[_x, _animtype] remoteExec ["playMove",_x];
		} else 
		{
			[_x, false] remoteExec ["enableSimulationGlobal",2];
		};
	} else 
	{
		_unitCount = _unitCount + 1;
		if (_useanim) then 
		{
			[_x, ""] remoteExec ["switchMove",_x];
		} else 
		{
			[_x, true] remoteExec ["enableSimulationGlobal",2];
			[_x, false] remoteExec ["enableSimulationGlobal",2];
			[_x, true] remoteExec ["enableSimulationGlobal",2];
			_temp = _x;
			{_x reveal _temp} forEach allUnits;
		};
	};
} forEach _unitList;


if (_isfreeze) then 
{
	if (_useanim) then
	{
		["Froze %1 Players with Animation", _unitCount] call zen_common_fnc_showMessage; 
	} else 
	{ 
		["Froze %1 Players", _unitCount] call zen_common_fnc_showMessage; 
	};
} else 
{ 
	if (_useanim) then
	{
		["Unfroze %1 Players with Animation", _unitCount] call zen_common_fnc_showMessage; 
	} else 
	{ 
		["Unfroze %1 Players", _unitCount] call zen_common_fnc_showMessage; 
	};
};