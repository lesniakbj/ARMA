// Wait for Mission Init
waitUntil {time > 0};

// Setup Faction Relationships
civilian setFriend [EAST, .7];
civilian setFriend [WEST, 1];

// Setup the Server.
if(isServer) then {
	// Setup serverID
	[] call DK_fnc_setupServerID;
};
waitUntil {!isNil "serverID"};

// Setup Respawns
[WEST, 10] call BIS_fnc_respawnTickets;
[WEST, "BeginMarker", "Mission Start"] call BIS_fnc_addRespawnPosition;
[WEST, "ARifleman"]  call BIS_fnc_addRespawnInventory;
[WEST, "ReconFAC"]  call BIS_fnc_addRespawnInventory;
[WEST, "Demo"]  call BIS_fnc_addRespawnInventory;
[WEST, "Marksman"] call BIS_fnc_addRespawnInventory;
[WEST, "ATRifleman"] call BIS_fnc_addRespawnInventory;
[WEST, "AutoRifleman"] call BIS_fnc_addRespawnInventory;

// Run the intro Video
_handle = [] execVM "functions\init\intro.sqf";
waitUntil {scriptDone _handle};

if(!isDedicated) then {
	// Setup Arsenal (Allow Players their own Loadouts)
	[] call DK_fnc_setupAmmoBoxes;
};