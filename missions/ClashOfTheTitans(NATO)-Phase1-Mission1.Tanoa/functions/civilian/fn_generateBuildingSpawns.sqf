params["_group"];
private _numToMove = floor ([1, ((count units _group) / 2)] call DK_fnc_randomBetween);
for "_n" from 0 to _numToMove do {
	_unit = [_civGroup, false] call DK_fnc_randomUnitInGroup;
	_building = selectRandom _remainingBuildings;
	_positions = [_building] call BIS_fnc_buildingPositions;
	_unit setPosATL (selectRandom _positions);
};

// Return the Group
_group;