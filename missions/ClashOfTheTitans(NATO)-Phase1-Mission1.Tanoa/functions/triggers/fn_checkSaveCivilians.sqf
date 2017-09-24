params["_saveGroup"];
if(!isServer) exitWith {};
private _cnt = ({alive _x} count (units _saveGroup)); 

if(_cnt >= 2) then {
   ["SaveCivTask", "SUCCEEDED"] call BIS_fnc_taskSetState;
   [WEST, 5] call BIS_fnc_respawnTickets;
} else {
   ["SaveCivTask", "FAILED"] call BIS_fnc_taskSetState; 
};


[WEST, getPos CheckCivTrigger, "Captive Civilians"] call BIS_fnc_addRespawnPosition;
["TaskDestroyAA1", "ASSIGNED"] call BIS_fnc_taskSetState; 