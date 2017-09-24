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

	// Setup Arsenal (Allow Players their own Loadouts)
	["AmmoboxInit", [Arsenal1, false]] spawn BIS_fnc_arsenal;
	["AmmoboxInit", [Arsenal2, false]] spawn BIS_fnc_arsenal;
	[Arsenal1, ["CUP_SOFLAM","CUP_srifle_SVD_pso","CUP_arifle_M4A1_camo_Aim","CUP_arifle_AK74","CUP_launch_RPG7V","CUP_lmg_PKM","CUP_arifle_M4A1_camo_GL_Holo_Flashlight_Snds","CUP_hgun_Colt1911","CUP_hgun_M9_snds"], true] call BIS_fnc_addVirtualWeaponCargo;
	[Arsenal1, ["FirstAidKit","DemoCharge_Remote_Mag","CUP_H_CDF_H_PASGT_MNT","CUP_V_CDF_6B3_2_MNT","CUP_optic_Kobra","CUP_muzzle_PBS4","CUP_V_B_RRV_Scout3","CUP_H_FR_BeanieGreen","CUP_muzzle_snds_M16","CUP_V_B_RRV_Scout2","CUP_H_FR_BoonieMARPAT","CUP_V_CDF_6B3_3_MNT","CUP_V_CDF_6B3_1_MNT","CUP_B_FR_MOLLE_Sab","CUP_V_B_RRV_DA1","CUP_H_FR_ECH"], true] call BIS_fnc_addVirtualItemCargo;
	[Arsenal1, ["CUP_B_USMC_MOLLE_WDL","CUP_B_FR_MOLLE_Sab","CUP_B_CDF_MGPack"], true] call BIS_fnc_addVirtualBackpackCargo;
	[Arsenal2, ["CUP_SOFLAM","CUP_srifle_SVD_pso","CUP_arifle_M4A1_camo_Aim","CUP_arifle_AK74","CUP_launch_RPG7V","CUP_lmg_PKM","CUP_arifle_M4A1_camo_GL_Holo_Flashlight_Snds","CUP_hgun_Colt1911","CUP_hgun_M9_snds"], true] call BIS_fnc_addVirtualWeaponCargo;
	[Arsenal2, ["FirstAidKit","DemoCharge_Remote_Mag","CUP_H_CDF_H_PASGT_MNT","CUP_V_CDF_6B3_2_MNT","CUP_optic_Kobra","CUP_muzzle_PBS4","CUP_V_B_RRV_Scout3","CUP_H_FR_BeanieGreen","CUP_muzzle_snds_M16","CUP_V_B_RRV_Scout2","CUP_H_FR_BoonieMARPAT","CUP_V_CDF_6B3_3_MNT","CUP_V_CDF_6B3_1_MNT","CUP_B_FR_MOLLE_Sab","CUP_V_B_RRV_DA1","CUP_H_FR_ECH"], true] call BIS_fnc_addVirtualItemCargo;
	[Arsenal2, ["CUP_B_USMC_MOLLE_WDL","CUP_B_FR_MOLLE_Sab","CUP_B_CDF_MGPack"], true] call BIS_fnc_addVirtualBackpackCargo;

	// Continously Saved Stats Here
	[] spawn DK_fnc_savePlayerStatsLoop;
};