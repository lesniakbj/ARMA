diag_log "Triggered! Checking AA.";
if(!isServer) exitWith {};

waitUntil { ({alive _x} count units ObjectiveGroup1) == 0; };
["TaskDestroyAA1", "SUCCEEDED"] call BIS_fnc_taskSetState;
["TaskDestroyAA2Radar", "ASSIGNED"] call BIS_fnc_taskSetState;
[WEST, 5] call BIS_fnc_respawnTickets;
[WEST, getPos trg_civSpawn2, "Local Village"] call BIS_fnc_addRespawnPosition;

// Move the reenforcements to the captured beach
// and add the "GO" code support to the playable
// units when the group is in position. 
// private _spawnPos = markerPos "SupportSpawn";
// private _landPoint = markerPos "SupportLandMarker";
// private _dir = SupportCraft getDir _landPoint;
// SupportCraft setPos _spawnPos;
// SupportCraft setDir _dir;
// SupportCraft doMove _landPoint;
// waitUntil {((speed SupportCraft) <= 5) && (SupportCraft distance _landPoint <= 100)};

// {  unassignVehicle _x; _x action["GetOut", vehicle _x]; } forEach (units SupportGroup1);
// sleep 2;
// { unassignVehicle _x; _x action["GetOut", vehicle _x];} forEach (units SupportGroup2);
// sleep 2;
// { unassignVehicle _x; _x action["GetOut", vehicle _x];} forEach (units SupportGroup3);

// while {(count (waypoints SupportGroup1)) > 0} do { deleteWaypoint ((waypoints SupportGroup1) select 0); };
// while {(count (waypoints SupportGroup2)) > 0} do { deleteWaypoint ((waypoints SupportGroup2) select 0); };
// while {(count (waypoints SupportGroup3)) > 0} do { deleteWaypoint ((waypoints SupportGroup3) select 0); };
// SupportGroup1 addWaypoint [getMarkerPos "AttackMarker1", 10, 0];
// SupportGroup2 addWaypoint [getMarkerPos "AttackMarker1", 10, 0];
// SupportGroup3 addWaypoint [getMarkerPos "AttackMarker2", 10, 0];
// /*
// 	https://www.reddit.com/r/arma/comments/4k3glg/the_new_rhs_paradrop_waypoint_is_awesome/
// 	{ unassignVehicle _x; _x action["getOut", vehicle _x]; } forEach (units SupportGroup1);
// 	SupportGroup leaveVehicle (vehicle SupportGroup);
// 	uiSleep 1;
// 	{ unassignVehicle _x; _x action["Eject", vehicle _x]; } forEach (units SupportGroup2);
// 	uiSleep 1;
// */