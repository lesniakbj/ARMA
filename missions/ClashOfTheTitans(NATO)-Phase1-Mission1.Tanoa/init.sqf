// Wait for Mission Init
waitUntil {time > 0};

// Setup the Server.
if(isServer) then {
	// Setup Faction Relationships
	civilian setFriend [EAST, 1];
	civilian setFriend [WEST, 1];

	// Setup serverID
	[] call DK_fnc_setupServerID;
};
waitUntil {!isNil "serverID"};

// Run the intro Video
_handle = [] execVM "functions\init\intro.sqf";
waitUntil {scriptDone _handle};


// Load Client Save Functionality
if(!isDedicated) then {
	// Load our player stats
	[] call DK_fnc_loadPlayerStats;

	// Setup Listeners to Save/Load Stats (player = Client Local)
	// addMissionEventHandler ["PlayerConnected", DK_fnc_clearStats];
	addMissionEventHandler ["EntityKilled", DK_fnc_saveKill];

	// Continously Saved Stats Here
	[] spawn DK_fnc_savePlayerStatsLoop;
};