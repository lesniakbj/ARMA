// Setup Globals
POLL_STATE = true;
CHECK_MAIN_OBJ = true;
CHECK_SIDE_OBJ = true;
AIR_SUPPORT_GIVEN = false;
SUPPORT_ACTIVE = false;
GO_COMMAND_GIVEN = false;

// Setup Objective Arrays
mainObjUnits = [];
sideObjUnits = [];
teamLeaderUnits = [];

// Add Side Objective Units
_SAMSites = [];
_SAMSites set [count _SAMSites, SAMSite1];
_SAMSites set [count _SAMSites, SAMSite2];
_SAMSites set [count _SAMSites, SAMSite3];
_SAMSites set [count _SAMSites, SAMSite4];

_radarSites = [];
_radarSites set [count _radarSites, Radar1];
_radarSites set [count _radarSites, Radar2];

sideObjUnits set [0, _SAMSites];
sideObjUnits set [1, _radarSites];

// Add Main Objective Units
_unitGroups = [];
_unitGroups set [count _unitGroups, MainGroup1];
_unitGroups set [count _unitGroups, MainGroup2];

_otherGroup = [];
_otherGroup set [count _otherGroup, MainRadar];

mainObjUnits set [0, _unitGroups];
mainObjUnits set [1, _otherGroup];

// Add Team Leader Units
teamLeaderUnits set [count teamLeaderUnits, TeamLeader1];
teamLeaderUnits set [count teamLeaderUnits, TeamLeader2];
teamLeaderUnits set [count teamLeaderUnits, TeamLeader3];
teamLeaderUnits set [count teamLeaderUnits, TeamLeader4];
teamLeaderUnits set [count teamLeaderUnits, TeamLeader5];

{
	_x addAction ["Turn On IR Strobes", "actions\IRStrobe\strobesOn.sqf"];
	_x addAction ["Boom", "actions\admin\destroyAllSAMs.sqf"];
} foreach teamLeaderUnits;

// Load Functions
call compile preprocessFileLineNumbers "functions\strobes\attach\fn_attachStrobe.sqf";

// Add Triggers to Objective Units
execVM "init\addKilledTriggers.sqf";

// Finally, set the scene and objectives
setTimeMultiplier 3;
titleText ["Eliminate the OPFOR Outpost. Destruction of AA is optional.", "PLAIN DOWN", 5];