params["_civArr", "_triggerZone"];
if(!isServer) exitWith {};
{ [_x, _triggerZone] spawn DK_fnc_generateUnitWaypoint; } forEach _civArr;