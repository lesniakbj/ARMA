params["_civArr", "_buildings"];
private _numToMove = floor ([1, ((count _civArr) / 2)] call DK_fnc_randomBetween);
for "_n" from 0 to _numToMove do {
	_unit = selectRandom _civArr;
	_building = selectRandom _buildings;
	_positions = [_building] call BIS_fnc_buildingPositions;
	_unit setPosATL (selectRandom _positions);
};

// Return the Group
_civArr;