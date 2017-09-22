while {MissionTimeSeconds > 0} do {
	MissionTimeSeconds = MissionTimeSeconds - 1;  
	hintSilent format["Support Arrives In: \n %1", [((MissionTimeSeconds)/60)+.01,"HH:MM"] call BIS_fnc_timetostring];	
	sleep 1;
};