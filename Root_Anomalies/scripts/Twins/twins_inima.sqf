// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT

if (!hasinterface) exitwith {};

_inima = _this select 0;
_unghi = 0;
while {alive _inima} do {
    if (_unghi == 360) then {
        _unghi = 0
    };
    _inima setDir _unghi;
    _unghi = _unghi + 1;
    uiSleep 0.1;
};