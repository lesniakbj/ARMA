params["_civGroup", "_triggerZone"];

{ 
	// Spawn a thread for each unit that generates waypoints when they are done
	_pos = [_triggerZone] call DK_fnc_randomPositionInTriggerArea; 

} forEach units _civGroup;