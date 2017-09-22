params["_civGroup", "_triggerZone", "_buildings"];
if(!isServer) exitWith {};
{ [_x, _triggerZone, _buildings] spawn DK_fnc_civilianWaypointLoop; } forEach (units _civGroup);