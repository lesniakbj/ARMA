params["_unit", "_triggerZone"];
if(!isServer) exitWith {};
onEachFrame {};
_pos = [_triggerZone] call DK_fnc_randomPositionInTriggerArea;
_wp = [_unit, _pos, "MOVE", "LIMITED", DK_fnc_generateUnitWaypoint] call DK_fnc_setUnitWaypoint;
onEachFrame { drawIcon3D ["targetIcon.paa", [1,1,1,1], getPosVisual _wp, 2, 2, 45, "DK_civ_randomWaypoint", 1, 0.05, "TahomaB"]; };