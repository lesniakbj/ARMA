deleteWaypoint [SupportGroup1, 0];
deleteWaypoint [SupportGroup2, 0];
deleteWaypoint [SupportCraftGroup, 0];

// Setup the "GO" code waypoints
SupportGroup1 addWaypoint [(getMarkerPos "MainObjMarker"), 0];
SupportGroup2 addWaypoint [(getMarkerPos "MainObjMarker"), 0];
SupportCraftGroup addWaypoint [(getMarkerPos "MainObjMarker"), 0];
[SupportGroup1, 0] setWaypointType "SAD";
[SupportGroup1, 0] setWaypointCompletionRadius 40;
[SupportGroup1, 0] setWaypointSpeed "NORMAL";
[SupportGroup1, 0] setWaypointFormation "LINE";
[SupportGroup2, 0] setWaypointType "SAD";
[SupportGroup2, 0] setWaypointCompletionRadius 40;
[SupportGroup2, 0] setWaypointSpeed "NORMAL";
[SupportGroup2, 0] setWaypointFormation "LINE";
[SupportCraftGroup, 0] setWaypointType "SAD";
[SupportCraftGroup, 0] setWaypointCompletionRadius 40;
[SupportCraftGroup, 0] setWaypointSpeed "NORMAL";
[SupportCraftGroup, 0] setWaypointFormation "LINE";
SupportGroup1 setbehaviour "COMBAT";
SupportGroup2 setbehaviour "COMBAT";
SupportCraftGroup setbehaviour "COMBAT";