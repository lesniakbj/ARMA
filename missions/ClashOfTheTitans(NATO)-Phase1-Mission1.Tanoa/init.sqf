// Wait for Mission Init
waitUntil {time > 0};

// Setup the Server.
if(isServer) then {
	// Setup Faction Relationships
	civilian setFriend [EAST, .7];
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

	// Load their Mission Actions (If Any)
	player addAction ["Show Current Stats", DK_fnc_showCurrentStats, [], 1];

	// Setup Listeners to Save/Load Stats (player = Client Local)
	// addMissionEventHandler ["PlayerConnected", DK_fnc_clearStats];
	addMissionEventHandler ["EntityKilled", DK_fnc_saveKill];
	addMissionEventHandler ["TeamSwitch", {
		params["_oldUnit", "_newUnit"];
		_newUnit addAction ["Show Current Stats", DK_fnc_showCurrentStats, [], 1];
	}];

	// Continously Saved Stats Here
	[] spawn DK_fnc_savePlayerStatsLoop;
};