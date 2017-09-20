// For the civilian population zone we will
// follow the following rules:
//		1) Spawn Civilians in the Trigger Zone
//		2) Spawn some of the Civilians in Buildings
//		3) Generate a Single Waypoint for All Civilians
//		4) If the waypoint is gone, it should generate another
//		5) There should be a cap to the number of Civilians	
params["_triggerZone", "_civRange", "_behavior", "_partiallDestroyed"];
if(!isServer) exitWith {};

private _numCivs = _civRange call DK_fnc_randomBetween;
private _buildingList = nearestObjects [_triggerZone, ["Static"], 100];
private _civClasses = [worldName] call DK_fnc_getCivilianClasses;
private _civGroup = objNull;

// Create the Standard Civilians in the Area
for "_x" from 0 to _numCivs do {
	if(isNull _civGroup) then {
		_civGroup = createGroup civilian;
	};
	
	_pos = [_triggerZone] call DK_fnc_randomPositionInTriggerArea;
	_civClass = selectRandom _civClasses;
	_civ = _civGroup createUnit [_civClass, _pos, [], 0, "NONE"];
	_civ setSpeedMode "LIMITED";
	_civ setCombatMode "GREEN";
	_civ setBehaviour _behavior;
	_civ enableDynamicSimulation true;
};

// If the area is "War-Torn", destroy some buildings. 
if(_partiallDestroyed) then {
	for "_n" from 0 to ((count _buildingList) - 1) do {
		_building = _buildingList select _n;
		_rand = (random 1);
		if(_rand <= .20 && !isNil "_building") then {
			_building setDamage 1;
			"test_EmptyObjectForFireBig" createVehicle (getPos _building);
		};
	};
};

// With the remaining buildings, move some spawns there.

_civGroup;
