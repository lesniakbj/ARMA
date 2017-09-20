// Run the intro video
[] execVM "functions\init\intro.sqf";

if(isServer) then {
	// Setup Faction Relationships
	civilian setFriend [EAST, 1];
	civilian setFriend [WEST, 1];

	// Setup Stats Listeners
	addMissionEventHandler ["PlayerConnected", DK_fnc_clearStats];
	addMissionEventHandler ["EntityKilled", DK_fnc_saveKill];
};
