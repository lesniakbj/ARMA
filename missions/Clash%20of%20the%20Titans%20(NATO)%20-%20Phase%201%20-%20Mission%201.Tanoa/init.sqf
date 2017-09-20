[] execVM "functions\init\intro.sqf";

if(isServer) then {
	// Setup Faction Relationships
	civilian setFriend [EAST, 1];
	civilian setFriend [WEST, 1];
};