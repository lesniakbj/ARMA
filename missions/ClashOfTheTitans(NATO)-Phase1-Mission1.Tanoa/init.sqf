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


	addMissionEventHandler ["EntityKilled", {
		params ["_killed", "_killer", "_instigator"];
		if (isNull _instigator) then {_instigator = UAVControl vehicle _killer select 0};
		if (isNull _instigator) then {_instigator = _killer};

		if(isPlayer _killed) then {
			[_killed, _killer, _instigator] call DK_fnc_saveDeathStat;
		};

		if(isPlayer _killer) then {
			[_killed, _killer, _instigator] call DK_fnc_saveKillStat;
		};
	}];
};
