params["_varName"];
_varValue = profileNameSpace getVariable (_varName + serverID);
if(isNil "_varValue") exitWith {};
[_varName, _varValue] call DK_fnc_applyLoadedStat;