diag_log "Triggered! Checking AA.";
waitUntil { ({alive _x} count units ObjectiveGroup1) == 0; };
["TaskDestroyAA1", "SUCCEEDED"] call BIS_fnc_taskSetState;