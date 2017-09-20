params["_saveGroup"];
if(!isServer) exitWith {};

_cnt = ({alive _x} count (units _saveGroup)); 
if(_cnt >= 2) then {
   ["SaveCivTask", "SUCCEEDED"] call BIS_fnc_taskSetState; 
} else {
   ["SaveCivTask", "FAILED"] call BIS_fnc_taskSetState; 
};