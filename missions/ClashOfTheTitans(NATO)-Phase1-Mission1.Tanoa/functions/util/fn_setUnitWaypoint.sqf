params["_unit", "_wpPos", ["_wpType", "MOVE"], ["_wpBehaviour", "SAFE"], ["_wpSpeed", "LIMITED"], ["_wpScript", objNull]];
// Leave the group
private _group = group _unit;
_unit joinSilent grpNull;

// Assign the waypoint
_wp = _unit addWaypoint [_wpPos, 10, 0, "DK_unitWaypoint"];
_wp setWaypointType _wpType;
_wp setWaypointBehaviour _wpBehaviour;
_wp setWaypointSpeed _wpSpeed;
if(!isNull _wpScript) then {
	_wp setWaypointStatements [true, _wpScript];
};
_unit setCurrentWaypoint _wp;

// Rejoin the group
_unit joinSilent _group;

// Return the waypoint
_wp;