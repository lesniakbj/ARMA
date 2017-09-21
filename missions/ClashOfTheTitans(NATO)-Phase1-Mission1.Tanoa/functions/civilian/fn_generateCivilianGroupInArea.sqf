params["_numCivs", "_civClasses", "_behavior", "_triggerZone"];
private _civArr = [];
for "_x" from 0 to _numCivs do {
	_civGroup = createGroup civilian;
	_pos = [_triggerZone] call DK_fnc_randomPositionInTriggerArea;
	_civClass = selectRandom _civClasses;
	_civ = _civGroup createUnit [_civClass, _pos, [], 0, "NONE"];
	_civ setSpeedMode "LIMITED";
	_civ setCombatMode "GREEN";
	_civ setBehaviour _behavior;
	_civ enableDynamicSimulation true;
	_civArr pushBack _civ;
};

// Return the Civ Array
_civArr;