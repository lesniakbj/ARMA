params["_civGroup", "_buildings"];
if(!isServer) exitWith {};
private _numToMove = floor ([1, ((count units _civGroup) / 2)] call DK_fnc_randomBetween);
for "_n" from 0 to _numToMove do {
	_unit = selectRandom (units _civGroup);
	_building = selectRandom _buildings;
	_positions = _building buildingPos -1;
	_unit setPosATL (selectRandom _positions);
};

// Return the Group
_civGroup;