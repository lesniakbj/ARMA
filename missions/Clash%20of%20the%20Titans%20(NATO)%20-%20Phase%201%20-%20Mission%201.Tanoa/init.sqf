[] execVM "functions\init\intro.sqf";

if(isServer) then {
	// Setup Faction Relationships
	civilian setFriend [EAST, 1];
	civilian setFriend [WEST, 1];

	// Setup Globals and Watcher Function
	SleepingStaticGroups = [];
	SleepingStaticGroups set [count SleepingStaticGroups, SeizedCiv1];
	SleepingStaticGroups set [count SleepingStaticGroups, SeizingCiv1];
	SleepingStaticGroups set [count SleepingStaticGroups, ObjectiveGroup1];
	[SleepingStaticGroups] spawn DK_fnc_checkStaticUnits;
};