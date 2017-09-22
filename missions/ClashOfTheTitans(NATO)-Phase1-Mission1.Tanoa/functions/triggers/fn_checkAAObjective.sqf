diag_log "Triggered! Checking AA.";
waitUntil { ({alive _x} count units ObjectiveGroup1) == 0; };
["TaskDestroyAA1", "SUCCEEDED"] call BIS_fnc_taskSetState;
["TaskDestroyAA2Radar", "ASSIGNED"] call BIS_fnc_taskSetState;

// Move the reenforcements to the captured beach
// and add the "GO" code support to the playable
// units when the group is in position. 
private _spawnPos = markerPos "SupportSpawn";
private _landPoint = markerPos "SupportLandMarker";
private _dir = SupportCraft getDir _landPoint;
SupportCraft setPos _spawnPos;
SupportCraft setDir _dir;
SupportCraft doMove _landPoint;
/*
	https://www.reddit.com/r/arma/comments/4k3glg/the_new_rhs_paradrop_waypoint_is_awesome/
	{ unassignVehicle _x; _x action["getOut", vehicle _x]; } forEach (units SupportGroup1);
	SupportGroup leaveVehicle (vehicle SupportGroup);
	uiSleep 1;
	{ unassignVehicle _x; _x action["Eject", vehicle _x]; } forEach (units SupportGroup2);
	uiSleep 1;
*/