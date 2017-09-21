params["_unit", "_triggerZone"];
if(!isServer) exitWith {};
onEachFrame {};
_pos = [_triggerZone] call DK_fnc_randomPositionInTriggerArea;
_wp = _unit addWaypoint [_pos, 10, 0, "DK_civ_randomWaypoint"];
_wp setWaypointType "MOVE";
_wp setWaypointStatements [true, DK_fnc_generateUnitWaypoint];
_unit setCurrentWaypoint _wp;
onEachFrame { drawIcon3D ["targetIcon.paa", [1,1,1,1], getPosVisual _wp, 2, 2, 45, "DK_civ_randomWaypoint", 1, 0.05, "TahomaB"]; };