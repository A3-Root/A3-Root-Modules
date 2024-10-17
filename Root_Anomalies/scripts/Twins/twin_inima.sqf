// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

if (!hasinterface) exitWith {};

_inima = _this select 0;
_unghi = 0;
while {alive _inima} do
{
	if (_unghi == 360) then {_unghi=0};
	_inima setdir _unghi;
	_unghi = _unghi + 1;
	sleep 0.1;
};