params["_unit", "_triggerZone"];
if(!isServer) exitWith {};
_pos = [_triggerZone] call DK_fnc_randomPositionInTriggerArea;
_wp = _unit addWaypoint [_pos, 10, 0, "DK_civ_randomWaypoint"];
_wp setWaypointType "MOVE";
_wp setWaypointStatements [true, DK_fnc_generateUnitWaypoint];