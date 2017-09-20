// Wait for Mission Init
waitUntil {time > 0};

// Run the intro video
[] execVM "functions\init\intro.sqf";

if(isServer) then {
	// Setup Faction Relationships
	civilian setFriend [EAST, 1];
	civilian setFriend [WEST, 1];

	// Setup serverID
	[] call DK_fnc_setupServerID;

	// Setup Stats Listeners
	// addMissionEventHandler ["PlayerConnected", DK_fnc_clearStats];
	// addMissionEventHandler ["EntityKilled", DK_fnc_saveKill];
};

// Load Client Save Functionality
waitUntil {!isNil "serverID"};
if(!isDedicated) then {
	[] call DK_fnc_loadPlayerStats;
	[] spawn DK_fnc_savePlayerStatsLoop;
};