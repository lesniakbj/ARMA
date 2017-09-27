// Wait for Mission Init
waitUntil {time > 0};

// Setup our Mission Time, Round, and State
MISSION_TIME = 3600;
ELAPSED_TIME  = 0;
MISSION_ROUND = 1;
ROUND_STATE = "Buy";
publicVariable "MISSION_TIME";
publicVariable "ELAPSED_TIME";
publicVariable "MISSION_ROUND";
publicVariable "ROUND_STATE";

if(isServer) then {
	DK_fnc_serverTimeKeeper = {
		START_TIME = diag_tickTime;
		while {ELAPSED_TIME < MISSION_TIME} do {
			ELAPSED_TIME = diag_tickTime - START_TIME;
			publicVariable "ELAPSED_TIME";
			sleep 1;
		};
	};
	[] spawn DK_fnc_serverTimeKeeper;

	{ 
		// Setup our needed variables on the Players
		_x setVariable ["Money", 0, true];
		_x setVariable ["Kills", 0, true];
		_x setVariable ["Deaths", 0, true];

		// Give each player a starting amount of Money
		_x setVariable ["Money", 100];

		// Spawn the Round Timer / Counter
		[[], DK_fnc_drawRoundTime] remoteExec ["spawn"];

		// Spawn the Game State Checker
		[[], DK_fnc_clientCheckRoundState] remoteExec ["spawn"];
	} forEach allPlayers;

	uiSleep 10;
	ROUND_STATE = "Round Start";
	publicVariable "ROUND_STATE";

	uiSleep 1;
	[true, ["Defend the Supplies"], ["If you want to buy anything between rounds, you better defend your supplies...", "Defend the Supplies", "Defend"], DefObj1, true] call BIS_fnc_taskCreate;
};