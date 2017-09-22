/*

*/
DK_fnc_searchForBuildings = {
	params["_triggerZone"];
	if(!isServer) exitWith {};
	private _trgArea = triggerArea _triggerZone;
	private _trgA = (_trgArea select 0);
	private _trgB = (_trgArea select 1);
	private _types = ["Static"];
	private _buildings = if(_trgA > _trgB) then { nearestObjects [_triggerZone, _types, _trgA]; } else { nearestObjects [_triggerZone, _types, _trgB]; };

	// Return buildings
	_buildings;
};

/*

*/
DK_fnc_destroyBuildings = {
	params["_buildingList", "_triggerZone"];
	if(!isServer) exitWith {};
	private _remainingBuildings = [];

	for "_n" from 0 to ((count _buildingList) - 1) do {
		_building = _buildingList select _n;
		_rand = (random 1);
		_shouldDestroy = _rand <= .20;
		_buildingIsValid = !isNil "_building";
		_buildingInZone = (getPos _building inArea _triggerZone);
		if(_buildingIsValid && _buildingInZone) then {
			if(_shouldDestroy) then {
				_building setDamage 1;
				"test_EmptyObjectForFireBig" createVehicle (getPos _building);
			} else {
				_building setDamage ([0, 35] call DK_fnc_randomBetween);
				_remainingBuildings pushBack _building;
			};
		};
	};

	_remainingBuildings;
};

/*

*/
DK_fnc_generateBuildingSpawns = {
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
};