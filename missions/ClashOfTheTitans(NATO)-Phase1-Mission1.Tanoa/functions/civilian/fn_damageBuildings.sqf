params["_buildingList", "_triggerZone"];
if(!isServer) exitWith {};
private _destroyedBuildings = [];

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
			_destroyedBuildings pushBack _building;
		} else {
			_building setDamage ([0, 35] call DK_fnc_randomBetween);
		};
	};
};

_destroyedBuildings;