params["_unit", "_vehicle", "_distance", "_thisEventHandler"];
if(!isServer) exitWith {};
_unit setVariable ["DK_BreakStatic", true];
_unit removeEventHandler ["FiredNear", _thisEventHandler];