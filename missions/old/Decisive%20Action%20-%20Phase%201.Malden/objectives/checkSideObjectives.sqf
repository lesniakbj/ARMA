_SAMArr = sideObjUnits select 0;
_SAMCount = count _SAMArr;
_radarArr = sideObjUnits select 1;
_radarCount = count _radarArr;

// Check to see if we can give the play Air Support
// 		1) All SAM site are destroyed
//		2) 1 SAM Radar site is destroyed
if (!AIR_SUPPORT_GIVEN && _SAMCount == 0 && _radarCount <= 2) then { 
	{
		PlayerSupportProvider synchronizeObjectsAdd [_x];
	} foreach teamLeaderUnits;
	AIR_SUPPORT_GIVEN = true;
};

// Check to see if we can spawn the Reserve Groups
//		1) 2 SAMs from the same site are destroyed
//		2) 1 SAM Radar site is destroyed
_siteNorth = (!alive SAMSite3 && !alive SAMSite4);
_siteSouth = (!alive SamSite1 && !alive SamSite2);
if(!SUPPORT_ACTIVE) then {
	_siteFound = (_siteNorth || _siteSouth);

	// Get the direction so we know where to spawn from
	_spawn = "NORTH";
	if(_siteNorth) then {
		_spawn = "NORTH";
	} else {
		_spawn = "SOUTH";
	};

	// Also respawn if there are 0 SAMSites
	_minSitesDestroyed = (_SAMCount <= 2 && _radarCount <= 2);
	_noSAMs = (_SAMCount == 0);
	if (_siteFound && (_minSitesDestroyed || _noSAMs)) then { 
		[_spawn] execVM "init\reserveForcesInit.sqf";
	};
};

// If support is active, check to see if they are close to their waypoint so
// we can give the play the "GO" command.
if(SUPPORT_ACTIVE && !GO_COMMAND_GIVEN) then {
	if((speed SupportCraft) <= 1) then {
		{ _x action["getOut", vehicle _x]; } forEach (units SupportGroup1);
		uiSleep 1;
		{ _x action["getOut", vehicle _x]; } forEach (units SupportGroup2);
		uiSleep 1;
		{ _x action["getOut", vehicle _x]; } forEach (units SupportCraftGroup);
		uiSleep 1;
		
		_type = (typeOf SupportCraft);
		_pos = (getPos SupportCraft);
		deleteVehicle SupportCraft;
		_type createVehicle _pos;
	};
	execVM "triggers\checkSupportPosition.sqf";
};

/*
_bothDestroyed = _siteNorth && _siteSouth;
if(AIR_SUPPORT_GIVEN && SUPPORT_ACTIVE && GO_COMMAND_GIVEN && _bothDestroyed) then {
	["SAMSitesTask", "Succeeded", true] spawn BIS_fnc_taskSetState;
	["CompoundTask", "Assigned", true] spawn BIS_fnc_taskSetState;
	["RadarTask", "Assigned", true] spawn BIS_fnc_taskSetState;
	{ if((side _x) == west) then { _x setCurrentTask CompoundTaskID; }; } foreach allUnits;
	CHECK_SIDE_OBJ = false;
};
*/