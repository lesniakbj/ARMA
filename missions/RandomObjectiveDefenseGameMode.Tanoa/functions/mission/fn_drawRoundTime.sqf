params[];

while{ELAPSED_TIME < MISSION_TIME} do {
	_time = MISSION_TIME - ELAPSED_TIME;
	_timeLeft = [_time, "MM:SS"] call BIS_fnc_secondsToString;
	hintSilent format ["Time Left:\n%1\n\nCurrent Round:\n%2", _timeLeft, MISSION_ROUND];
	sleep 1;
};