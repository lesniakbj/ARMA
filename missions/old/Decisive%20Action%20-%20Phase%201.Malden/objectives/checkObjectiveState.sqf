// Check Side Objectives
if(CHECK_SIDE_OBJ) then {
	execVM "objectives\checkSideObjectives.sqf";
};

// Check Main Objectives
if(CHECK_MAIN_OBJ) then {
	execVM "objectives\checkMainObjectives.sqf";
};

// Flip the flag so we poll again in 10 seconds
POLL_STATE = false;