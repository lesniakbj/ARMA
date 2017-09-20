// Run the intro video
[] execVM "functions\init\intro.sqf";

// Setup Player's Stats
profileNamespace setVariable ["DK_cmp_Kills", objNull];
profileNamespace setVariable ["DK_cmp_Deaths", objNull];
profileNamespace setVariable ["DK_cmp_Civilians", objNull];
profileNamespace setVariable ["DK_cmp_Score", objNull];


if(isServer) then {
	// Setup Faction Relationships
	civilian setFriend [EAST, 1];
	civilian setFriend [WEST, 1];


	addMissionEventHandler ["EntityKilled", DK_fnc_saveKill];
};
