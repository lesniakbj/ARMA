_spawnDir = (_this select 0);

// Clear waypoints before we assign them
[SupportCraftGroup] execVM "functions\fn_deleteWaypoints.sqf";
[SupportGroup1] execVM "functions\fn_deleteWaypoints.sqf";
[SupportGroup2] execVM "functions\fn_deleteWaypoints.sqf";

// Add Waypoints
_wp1 = Nil;
_wp2 = Nil;

// Use the Nortrhly Markpoint as the pos
if(_spawnDir == "NORTH") then {
	SupportCraft setPos (getMarkerPos "SupportSpawnNorth");
	SupportCraft setDir 270;
	_craftWP = SupportCraftGroup addWaypoint [(getMarkerPos "LandingMarkerNorth"), 0];
	SupportCraftGroup addWaypoint [(waypointPosition _craftWP), 0];
	SupportCraftGroup addWaypoint [(getMarkerPos "StagingMarkerNorth"), 10];
	_wp1 = SupportGroup1 addWaypoint [(getMarkerPos "StagingMarkerNorth"), 10];
	_wp2 = SupportGroup2 addWaypoint [(getMarkerPos "StagingMarkerNorth"), 10];
} else {
	SupportCraft setPos (getMarkerPos "SupportSpawnSouth");
	SupportCraft setDir 310;
	_craftWP = SupportCraftGroup addWaypoint [(getMarkerPos "LandingMarkerSouth"), 0];
	SupportCraftGroup addWaypoint [(waypointPosition _craftWP), 0];
	SupportCraftGroup addWaypoint [(getMarkerPos "StagingMarkerSouth"), 10];
	_wp1 = SupportGroup1 addWaypoint [(getMarkerPos "StagingMarkerSouth"), 10];
	_wp2 = SupportGroup2 addWaypoint [(getMarkerPos "StagingMarkerSouth"), 10];
};

// Set the main waypoints, and synchronize to the "Go" trigger.
// We will give the player access to the "Go" trigger when the
// groups get in position. 
[SupportCraftGroup, 0] setWaypointType "MOVE";
[SupportCraftGroup, 0] setWaypointCompletionRadius 30;
[SupportCraftGroup, 0] setWaypointSpeed "FULL";
[SupportCraftGroup, 1] setWaypointType "HOLD";
[SupportCraftGroup, 1] setWaypointCompletionRadius 30;
[SupportCraftGroup, 1] setWaypointSpeed "NORMAL";
[SupportGroup1, 0] setWaypointType "HOLD";
[SupportGroup1, 0] setWaypointCompletionRadius 30;
[SupportGroup1, 0] setWaypointSpeed "NORMAL";
[SupportGroup2, 0] setWaypointType "HOLD";
[SupportGroup2, 0] setWaypointCompletionRadius 30;
[SupportGroup2, 0] setWaypointSpeed "NORMAL";
SupportGroup1 setbehaviour "AWARE";
SupportGroup1 setCombatMode "YELLOW";
SupportGroup2 setbehaviour "AWARE";
SupportGroup2 setCombatMode "YELLOW";
SupportAttackTrigger synchronizeTrigger [_wp1, _wp2];

// Set some code we want to run when each group has left the boat.
execVM "triggers\startSupportStrobes.sqf";

// Set support activity state
SUPPORT_ACTIVE = true;