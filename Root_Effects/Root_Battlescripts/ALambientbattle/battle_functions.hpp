// CREATED BY ROOT WITH HELP FROM SYSROOT @ ARMA3 DISCORD 

SYNC_FNC_UNLOCK = {
  params ["_mutex"];
  _mutex setVariable ["SYNC_LOCKED", false, true];
};

SYNC_FNC_EXEC_AND_LOCK = {
  params ["_mutex", "_params", ["_code", {}, [{}]]];
  if !([_mutex] call SYNC_FNC_LOCKED) then {
    _params call _code;
    _mutex setVariable ["SYNC_LOCKED", true, true];
  }
};

SYNC_FNC_LOCKED = {
  params ["_mutex"];
  _mutex getVariable ["SYNC_LOCKED", false];
};

SYNC_FNC_ALL_LOCKED = {
  params ["_mutexes"];
  (count (_mutexes select {[_x] call SYNC_FNC_LOCKED})) == (count _mutexes);
};