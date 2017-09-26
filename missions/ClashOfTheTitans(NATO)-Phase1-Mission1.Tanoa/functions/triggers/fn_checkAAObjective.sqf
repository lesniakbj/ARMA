diag_log "Triggered! Checking AA.";
if(!isServer) exitWith {};

waitUntil { uiSleep 1; ({alive _x} count units ObjectiveGroup1) == 0; };
["TaskDestroyAA1", "SUCCEEDED"] call BIS_fnc_taskSetState;
["TaskDestroyAA2Radar", "ASSIGNED"] call BIS_fnc_taskSetState;
[WEST, 5] call BIS_fnc_respawnTickets;
[WEST, getPos trg_civSpawn2, "Local Village"] call BIS_fnc_addRespawnPosition;

// Move the reenforcements to the captured beach
// and add the "GO" code support to the playable
// units when the group is in position. 
private _spawnPos = markerPos "SupportSpawn";
private _landPoint = markerPos "SupportLandMarker";
private _dir = SupportCraft getDir _landPoint;
SupportCraft setPos _spawnPos;
SupportCraft setDir _dir;
SupportCraft setVelocityModelSpace [0, 10, 0];
SupportCraft doMove _landPoint;
waitUntil { uiSleep 1; ((speed SupportCraft) <= 5) && (SupportCraft distance _landPoint <= 150); };

// Get everyone out of the Boat
{  uiSleep .5; unassignVehicle _x; _x action["GetOut", vehicle _x]; } forEach (units SupportGroup1);
uiSleep 3;
{  uiSleep .5;  unassignVehicle _x; _x action["GetOut", vehicle _x];} forEach (units SupportGroup2);
uiSleep 3;
{  uiSleep .5; unassignVehicle _x; _x action["GetOut", vehicle _x];} forEach (units SupportGroup3);

// Move them to their respective Ambush Points
while {(count (waypoints SupportGroup1)) > 0} do { deleteWaypoint ((waypoints SupportGroup1) select 0); };
while {(count (waypoints SupportGroup2)) > 0} do { deleteWaypoint ((waypoints SupportGroup2) select 0); };
while {(count (waypoints SupportGroup3)) > 0} do { deleteWaypoint ((waypoints SupportGroup3) select 0); };
_wp1 = SupportGroup1 addWaypoint (getMarkerPos "AttackMarker1");
_wp2 = SupportGroup2 addWaypoint (getMarkerPos "AttackMarker2");
_wp3 = SupportGroup3 addWaypoint (getMarkerPos "AttackMarker1");
_wp1 setWaypointType "MOVE";
_wp2 setWaypointType "MOVE";
_wp3 setWaypointType "MOVE";

// Add the Action to give the the GO command
{ _x addAction ["Send GO Command", "{}", nil, 2, false, true]; } forEach allPlayers;